(* This file will contain all pretty-printing for computorv1 *)

let deltap fmt delta =
  Format.fprintf fmt (
    if delta > 0. then
      "Discriminant is strictly positive, the two solutions are:@."
    else if delta < 0. then
      "Discriminant is strictly negative, there is no solution with real numbers:@."
    else
      "The solution is:@."
  )

let polyprint fmt (terms, variable) =
  Format.fprintf fmt "Reduced form: ";
  let size = List.length terms in
  let print_sign fmt l =
    match l with
    | (_k, v) ->
      if Float.compare 0. v > 0 then
        Format.fprintf fmt " - "
      else
        Format.fprintf fmt " + " in
  let rec reduce terms variable =
    begin
      match terms with
      | [] -> assert false
      | [(k, v)] ->
        Format.fprintf fmt "%g * %s^%d" (if Float.compare 0. v > 0 && size <> 1 then ~-.v else v) variable k;
      | (k, v)::r ->
        Format.fprintf fmt "%g * %s^%d" (if Float.compare 0. v > 0 then ~-.v else v) variable k;
        print_sign fmt (List.hd r);
        reduce r variable
    end;
  in
  reduce terms variable
