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

let pow fmt n =
  Format.fprintf fmt "^%d" n

let var fmt = function
  | None -> ()
  | Some (x, n) -> Format.fprintf fmt " * %s%a" x pow n

let mono fmt (a, x) =
  Format.fprintf fmt "%g%a" a var x

let polyprint fmt (terms, variable) =
  let size = List.length terms in
  let print_sign fmt l =
    match l with
    | (_k, v) ->
      if Float.compare 0. v > 0 then
        Format.fprintf fmt " - "
      else
        Format.fprintf fmt " + " in
  let rec reduce terms =
    begin
      match terms with
      | [] -> assert false
      | [(k, v)] ->
        mono fmt ((if Float.compare 0. v > 0 && size <> 1 then ~-.v else v),
          (if String.equal variable "" then None else Some(variable, k)));
      | (k, v)::r ->
        mono fmt ((if Float.compare 0. v > 0 then ~-.v else v),
          (if String.equal variable "" then None else Some(variable, k)));
        print_sign fmt (List.hd r);
        reduce r
    end;
  in
  reduce terms

let poly fmt = function
  | [] -> Format.fprintf fmt "0"
  | polynome -> Format.pp_print_list ~pp_sep:(fun fmt () -> Format.fprintf fmt " + ") mono fmt polynome

let equ fmt (polynome, var) =
  polyprint fmt (polynome, var)
