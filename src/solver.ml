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

  Pp.reduced !a !b !c seen;
  if !degree > 2  then
    begin
      Format.eprintf "Polynomial degree is %d@." !degree;
      Format.eprintf "Polynomial degree is strictly greater than 2 I can't solve.@.";
      exit 1
    end
  else
    Format.printf "Polynomial degree is %d@." !degree;

  let a = Option.value (Some !a) ~default:0. in
  let b = Option.value (Some !b) ~default:0. in
  let c = Option.value (Some !c) ~default:0. in
  (* Calculating delta for resolution *)
  let delta = b *. b -. 4. *. a *. c in
  begin
    match delta with
    |0. -> let solution = ~-.b /. (2. *. a) in
      Pp.deltap delta;
      Format.printf "%f@." solution
    |delta when Float.compare 0. delta < 0 ->
      let solution1 = (~-.b -. (sqrt delta))/. (2. *. a) in
      let solution2 = (~-.b +. (sqrt delta))/. (2. *. a) in
      Pp.deltap delta;
      Format.printf "%f@.%f@." solution1 solution2
    |delta -> assert (Float.compare 0. delta < 0);
  end;
(*
 * (-b + i*sqrt(-delta))/(2a) and (-b - i*sqrt(-delta))/(2a)
   * sont solutions pour delta < 0, difficilement affichable mais recevable si simplifié
   *
   *)
