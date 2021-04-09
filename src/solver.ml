(* This module will contain code for 2nd Degree equation resolution *)

(*
  - 2nd degree polynome:

    ax² + bx + c

  - Formula to find the delta of the equation and find nb of solutions:

    \delta = b² - 4ac

      if (\delta < 0) then
         solution found with imaginary numbers
      else if (\delta = 0) then
        -b/2a
      else if (\delta > 0) then
       -b-racined/2a et -b+racine/2a

  - Solving for x:

    bx + c = 0
    bx = -c
    x = (-c)/b
*)
(* TODO
 * REPLACE SQRT WITH CUSTOM SQRT
 * *)
(* Take equation e *)
let solve e =
  (* Separate both polynomes of the equation left and right from '=' sign *)
  let left, right = e in
  (* Move right polynome to the left of the '=' sign, invert signs *)
  let right' = List.map (fun (coeff, var) ->
    (-coeff, var)) right in
  (* Concatenate *)
  let polynome = left @ right' in
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
  ) polynome;
  (*
   * Add coefficients of same power together
   * c is for constants
   * b for 1st degree terms
   * a for 2nd degree terms
   *)
  let a = ref 0 in
  let b = ref 0 in
  let c = ref 0 in
  List.iter (fun (coeff, var)->
    match var with
    |None -> c := !c + coeff
    |Some (_var, n)->
      if n = 1 then b := !b + coeff
      else if n = 2 then a := !a + coeff
      else
        (Format.eprintf "Power of %d is unsupported@." n; exit 1)
  ) polynome;

  let a = !a in
  let b = !b in
  let c = !c in
  Format.printf "a = %d; b = %d; c = %d@." a b c;
  (* Calculating delta for resolution *)
  let delta = b * b - 4 * a * c in
  Format.printf "delta = %d@." delta;
  let b = float_of_int b in
  let a = float_of_int a in
  match delta with
  |0 -> let sol = ~-.b /. (2. *. a) in Format.printf "x0 = %f@." sol
  |delta when delta > 0 ->
    let x1 = (~-.b -. sqrt (float_of_int delta))/. (2. *. a) in
    let x2 = (~-.b +. sqrt (float_of_int delta))/. (2. *. a) in
    Format.printf "x1 = %f and x2 = %f@." x1 x2
  |delta -> assert (delta < 0); ()
(*
   * (-b + i*sqrt(-delta))/(2a) and (-b - i*sqrt(-delta))/(2a)
   * sont solutions pour delta < 0, difficilement affichable mais recevable si simplifié
   * *)
