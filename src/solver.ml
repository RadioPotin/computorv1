(** This module will contain code for 2nd Degree equation resolution *)

open Ast

(** [convert ast] takes the polynome represented as a recursive type and
    converts it to a type
    [(coefficient:float, (variable:string * power:int) option) list] *)
let convert : polynome -> monome list =
  let rec aux sub = function
    | Add (a, b) -> aux sub a @ aux false b
    | Sub (a, b) -> aux sub a @ aux true b
    | Mon (x, v) ->
      if sub then
        [ (~-.x, v) ]
      else
        [ (x, v) ]
  in
  aux false

(** [ast_to_lists (p1, p2)] takes a type [(polynome * polynome)] and calls
    [convert ast] on each polynome to return a [(monome list * monome list)] to
    facilitate manipulation *)
let ast_to_lists ((p1, p2) : polynome * polynome) = (convert p1, convert p2)

(** [sqrt x] is a reimplementation of classic sqrt function, it's presence is
    justified by the specifications of the ComputorV1 42 subject *)
let sqrt (x : float) =
  let rec sqrt_aux guess = function
    | 0. -> guess
    | iter ->
      let guess = guess -. (((guess *. guess) -. x) /. (2. *. guess)) in
      sqrt_aux guess (iter -. 1.)
  in
  sqrt_aux 1. 10.
(*
Alternative, iterative version of the custom SQRT function re-implementation

let sqrt x =
  let z = ref 1. in
  for i = 10 downto 0 do
     begin
       z := !z -. (!z *. !z -. x) /. (2. *. !z)
     end
      done;
   !z
 *)

(** [solve e] takes both monome lists and does all necessary operations that
    lead to solution. Invert all monomes of the righthand side polynome and
    concatenate to lefthand side one. Check for more than one variable, exit if
    so. Create a Hashtable of [(key:power, value:coefficient)]. Check for a
    degree > 2, exit if so. Simplify list by combining same power monomes.
    Proceed to calculate delta and pretty-print the reduced form along with
    polynomial degree and solution(s). *)
let solve fmt (e : monome list * monome list) =
  (* Separate both polynomes of the equation left and right from '=' sign *)
  let left, right = e in
  (* Move right polynome to the left of the '=' sign, invert signs *)
  let right' = List.map (fun (coeff, var) -> (~-.coeff, var)) right in
  (* Concatenate *)
  let p = left @ right' in
  let seen = ref None in
  (* Scan for presence of more than one variable, exit if there is *)
  List.iter
    (fun (_coeff, var) ->
      match var with
      | None -> ()
      | Some (var, _n) -> (
        match !seen with
        | None -> seen := Some var
        | Some seen ->
          if seen <> var then begin
            Format.fprintf fmt
              "There are two different variables `%s` and `%s`!@." var seen;
            Format.fprintf fmt "Won't compute.@.";
            raise Too_many_variables
          end ) )
    p;

  (*
   * Produce new list with monomes matching
   * (coeff:float * (var:string, 0) option)
   * replaced with (1, None)
   *)
  let poly =
    List.map
      (fun (coeff, var) ->
        match (coeff, var) with
        | coeff, None -> (coeff, var)
        | coeff, Some (_x, 0) -> (coeff, None)
        | coeff, Some (_x, _n) -> (coeff, var) )
      p
  in

  (*
   * Create hashtable
   * Keys are Power to which a given coefficient(varible option) is raised
   * Values are the said coefficients
   *
   * Add coefficients of same power together to simplify polynome
   *)
  let tbl = Hashtbl.create 512 in
  List.iter
    (fun (coeff, var) ->
      match var with
      | None -> (
        let x = Hashtbl.find_opt tbl 0 in
        match x with
        | None -> Hashtbl.add tbl 0 coeff
        | Some x -> Hashtbl.replace tbl 0 (coeff +. x) )
      | Some (_var, n) -> (
        let x = Hashtbl.find_opt tbl n in
        match x with
        | None -> Hashtbl.replace tbl n coeff
        | Some x -> Hashtbl.replace tbl n (coeff +. x) ) )
    poly;

  let var = Option.value !seen ~default:"" in
  (* Convert all Hashtbl of monomes (key:power, value:coef) to a list of (power, coef)*)
  let allterms = List.of_seq (Hashtbl.to_seq tbl) in
  (* Order in growing order of (power, _coef) *)
  let sorted_terms =
    List.sort (fun (pow1, _) (pow2, _) -> Int.compare pow1 pow2) allterms
  in
  (* Filter out the monomes that have a coef of 0 *)
  let filtered_terms = List.filter (fun x -> snd x <> 0.) sorted_terms in
  (* Find highest degree with non null coefficient *)
  let max_degree =
    try fst (List.hd (List.rev filtered_terms)) with
    | Failure _ -> 0
  in
  (* Raise an exception in case of degree > 2 *)
  if max_degree > 2 then begin
    Format.fprintf fmt "Reduced form: %a@." Pp.equ (filtered_terms, [], var);
    Format.fprintf fmt "Polynomial degree: %d@." max_degree;
    Format.fprintf fmt
      "The polynomial degree is strictly greater than 2, I can't solve.@.";
    raise Big_degree
  end;

  let a = Option.value (Hashtbl.find_opt tbl 2) ~default:0. in
  let b = Option.value (Hashtbl.find_opt tbl 1) ~default:0. in
  let c = Option.value (Hashtbl.find_opt tbl 0) ~default:0. in
  let normalize fmt root =
    Format.fprintf fmt "%g"
      ( if Float.compare (-0.) root = 0 then
        Float.abs root
      else
        root )
  in
  (* If a is not 0, then it's not a 2nd degree equation *)
  if a <> 0. then (
    (* Calculating delta for resolution of
     * 2nd Degree equation
     *)
    let delta = (b *. b) -. (4. *. a *. c) in
    let normalize fmt root =
      Format.fprintf fmt "%g"
        ( if Float.compare (-0.) root = 0 then
          Float.abs root
        else
          root )
    in
    match delta with
    | 0. ->
      (* Delta is null, there is only one possible solution *)
      let solution = ~-.b /. (2. *. a) in
      Format.fprintf fmt "Reduced form: %a@." Pp.equ (filtered_terms, [], var);
      Format.fprintf fmt "Polynomial degree: %d@." max_degree;
      Pp.deltap fmt delta;
      Format.fprintf fmt "%a@." normalize solution
      (* Delta is positive, 2 solutions possible *)
    | delta when Float.compare 0. delta < 0 ->
      let solution1 = (~-.b -. sqrt delta) /. (2. *. a) in
      let solution2 = (~-.b +. sqrt delta) /. (2. *. a) in
      Format.fprintf fmt "Reduced form: %a@." Pp.equ (filtered_terms, [], var);
      Format.fprintf fmt "Polynomial degree: %d@." max_degree;
      Pp.deltap fmt delta;
      Format.fprintf fmt "%a@.%a@." normalize solution1 normalize solution2
      (* Solutions are found in complex numbers *)
    | delta ->
      let reduce_zi fmt root =
        if Float.compare 1. root = 0 then
          Format.fprintf fmt ""
        else
          Format.fprintf fmt "%g" root
      in
      Format.fprintf fmt "Reduced form: %a@." Pp.equ (filtered_terms, [], var);
      Format.fprintf fmt "Polynomial degree: %d@." max_degree;
      Pp.deltap fmt delta;
      let root1 = ~-.b /. (2. *. a) in
      let root2 = sqrt ~-.delta /. (2. *. a) in
      Format.fprintf fmt "%a - %ai@." normalize root1 reduce_zi root2;
      Format.fprintf fmt "%a + %ai@." normalize root1 reduce_zi root2
  ) else
    (* Calculating x for resolution of
     * 1st or 0th Degree equation
     *)
    match b with
    | 0. -> (
      match c with
      (* Case 0 = 0
      *)
      | 0. ->
        Format.fprintf fmt "Reduced form: 0 = 0@.";
        Format.fprintf fmt "Polynomial degree: %d@." max_degree;
        Pp.deltap fmt 0.;
        Format.fprintf fmt "All real numbers are solutions.\n"
      (* Case 3 = 0
      *)
      | _c ->
        Format.fprintf fmt "Reduced form: %a@." Pp.equ (filtered_terms, [], var);
        Format.fprintf fmt "Impossible.@." )
    (* Case x = -c/b
  *)
    | b ->
      let solution = ~-.c /. b in
      Format.fprintf fmt "Reduced form: %a@." Pp.equ (filtered_terms, [], var);
      Format.fprintf fmt "Polynomial degree: %d@." max_degree;
      Pp.deltap fmt 0.;
      Format.fprintf fmt "%a@." normalize solution
