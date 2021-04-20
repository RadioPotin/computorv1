(* This module will contain code for 2nd Degree equation resolution *)

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

let sqrt x =
  let rec sqrt_aux guess = function
    | 0. -> guess
    | iter ->
      let guess = guess -. ((guess *. guess -. x) /. (2. *. guess)) in
      sqrt_aux guess (iter -. 1.)
  in
  sqrt_aux 1. 10.

let solve fmt e =
  (* Separate both polynomes of the equation left and right from '=' sign *)
  let left, right = e in
  (* Move right polynome to the left of the '=' sign, invert signs *)
  let right' = List.map (fun (coeff, var) ->
    (~-.coeff, var)) right in
  (* Concatenate *)
  let p = left @ right' in
  let seen = ref None in
  (* Scan for presence of more than one variable, exit if there is *)
  List.iter (fun (_coeff, var)->
    match var with
    |None -> ()
    |Some (var, _n)->
      begin
        match !seen with
        |None -> seen := Some var
        |Some seen -> if seen <> var then
            (Format.fprintf fmt "There are two different variable `%s` and `%s`!@." var seen; exit 1)
      end
  ) p;

  (*
   * Produce new list with monomes matching
   * (coeff:float * (var:string, 0) option)
   * replaced with (1, None)
   *)
  let poly = List.map (fun (coeff, var)->
    match (coeff, var) with
    |(coeff, None) -> (coeff, var)
    |(coeff, Some (_x, 0)) -> (coeff, None)
    |(coeff, Some (_x, _n)) -> (coeff, var)
  ) p in

  let degree = ref 0 in
  List.iter (fun (_coeff, var)->
    match var with
    |None -> ()
    |Some (_var, n)->
      match !degree with
      |0 -> degree := n
      |x ->
        if x < n then
          degree := n
        else
          ()
  ) poly;

  (*
   * Add coefficients of same power together
   * c is for constants
   * b for 1st degree terms
   * a for 2nd degree terms
   *)
  let a = ref 0. in
  let b = ref 0. in
  let c = ref 0. in
  List.iter (fun (coeff, var)->
    match var with
    |None -> c := !c +. coeff
    |Some (_var, n)->
      if n = 1 then b := !b +. coeff
      else if n = 2 then a := !a +. coeff
      else
        ()
  ) poly;

  if !degree > 2 then
    begin
      Format.fprintf fmt "Polynomial degree: %d@." !degree;
      Format.fprintf fmt "The polynomial degree is strictly greater than 2, I can't solve.@.";
      exit 1
    end;

  let a = Option.value (Some !a) ~default:0. in
  let b = Option.value (Some !b) ~default:0. in
  let c = Option.value (Some !c) ~default:0. in
  if a <> 0. then
    (* Calculating delta for resolution of
     * 2nd Degree equation
    *)
    let delta = b *. b -. 4. *. a *. c in
    begin
      match delta with
      | 0. -> let solution = ~-.b /. (2. *. a) in
        Pp.pretty fmt a b c seen;
        Format.fprintf fmt "Polynomial degree: %d@." !degree;
        Pp.deltap fmt delta;
        Format.fprintf fmt "%g@." solution

      | delta when Float.compare 0. delta < 0 ->
        let solution1 = (~-.b -. (sqrt delta))/. (2. *. a) in
        let solution2 = (~-.b +. (sqrt delta))/. (2. *. a) in
        Pp.pretty fmt a b c seen;
        Format.fprintf fmt "Polynomial degree: %d@." !degree;
        Pp.deltap fmt delta;
        Format.fprintf fmt "%g@.%g@." solution1 solution2

      | delta ->
        Pp.pretty fmt a b c seen;
        Format.fprintf fmt "Polynomial degree: %d@." !degree;
        Pp.deltap fmt delta;
        Format.fprintf fmt "Complex solution here.@."

      (* (-b + i*sqrt(-delta))/(2a) and (-b - i*sqrt(-delta))/(2a)
         * sont solutions pour delta < 0, difficilement affichable mais recevable si simplifié
         *
      *)
    end;
  else
    (* Calculating x for resolution of
     * 1st or 0th Degree equation
    *)
    match b with
    | 0. ->
      begin
        match c with
        (* Case 0 = 0
        *)
        | 0.->
          Pp.pretty fmt a b c seen;
          Format.fprintf fmt "Polynomial degree: %d@." !degree;
          Pp.deltap fmt 0.;

          (* Case 3 = 0
          *)
        | c ->
          Pp.pretty fmt a b c seen;
          Format.fprintf fmt "Impossible.@."
      end

    (* Case x = -c/b
    *)
    | b ->
      begin
        let solution = ~-.c /. b in
        Pp.pretty fmt a b c seen;
        Format.fprintf fmt "Polynomial degree: %d@." !degree;
        Pp.deltap fmt 0.;
        Format.fprintf fmt "%g@." solution
      end
