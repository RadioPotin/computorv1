(* This file will contain all pretty-printing for computorv1 *)

let deltap fmt delta =
  Format.fprintf fmt
    ( if delta > 0. then
      "Discriminant is strictly positive, the two solutions are:@."
    else if delta < 0. then
      "Discriminant is strictly negative, there is no solution with real \
       numbers:@."
    else
      "The solution is:@." )

let pow fmt n = Format.fprintf fmt "^%d" n

let var fmt = function
  | None -> ()
  | Some (x, n) -> Format.fprintf fmt " * %s%a" x pow n

let mono fmt ((a, x) : Ast.monome) = Format.fprintf fmt "%g%a" a var x

let polyprint fmt (terms, variable) =
  let mk_var k =
    if variable = "" then
      None
    else
      Some (variable, k)
  in
  match terms with
  | [] -> Format.fprintf fmt "0"
  | (k, v) :: p ->
    mono fmt (v, mk_var k);
    List.iter
      (fun (k, v) ->
        Format.fprintf fmt "%s%a"
          ( if v >= 0. then
            " + "
          else
            " - " )
          mono
          (Float.abs v, mk_var k) )
      p

let equ fmt (polynomeL, polynomeR, var) =
  Format.fprintf fmt "%a = %a" polyprint (polynomeL, var) polyprint
    (polynomeR, var)
