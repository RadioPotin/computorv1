(* This module will contain code for 2nd Degree equation resolution *)

(*
 * TODO
 * REPLACE SQRT WITH CUSTOM SQRT
*)

let solve e =
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
            (Format.eprintf "There are two different variable `%s` and `%s`!@." var seen; exit 1)
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
        (Format.eprintf "Polynomial degree is strictly greater than 2 (%d) I can't solve.@." n; exit 1)
  ) poly;

  (*
  let reduce polynome =
     *)

  Pp.std (poly, [(0., None)]);

  let a = !a in
  let b = !b in
  let c = !c in
  (* Calculating delta for resolution *)
  let delta = b *. b -. 4. *. a *. c in
  Pp.deltap delta;

  let b = b in
  let a = a in
  match delta with
  |0. -> let sol = ~-.b /. (2. *. a) in
    Format.printf "%f@." sol
  |delta when delta > 0. ->
    let x1 = (~-.b -. (sqrt delta))/. (2. *. a) in
    let x2 = (~-.b +. (sqrt delta))/. (2. *. a) in
    Format.printf "%f@.%f@." x1 x2
  |delta -> assert (delta < 0.); ()

(*
   * (-b + i*sqrt(-delta))/(2a) and (-b - i*sqrt(-delta))/(2a)
   * sont solutions pour delta < 0, difficilement affichable mais recevable si simplifié
   * *)
