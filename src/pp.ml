(* This file will contain all pretty-printing for computorv1 *)

open Ast

let reduced a b c seen =
  Format.printf "Reduced form: ";
  let a =
    if Float.equal a 0. then
      None
    else
      Some a
  in
  let b =
    if Float.equal b 0. then
      None
    else
      Some b
  in
  let c =
    if Float.equal c 0. then
      None
    else
      Some c
  in
  let var =  Option.value !seen ~default:""
  in
  begin
    match a,b,c with
    | None, None, None -> Format.printf "0 = 0@."
    | None, None, Some z -> Format.printf "%g = 0@." z
    | None, Some y, None -> Format.printf "%g%s = 0@." y var
    | None, Some y, Some z -> Format.printf "%g%s + %g = 0@." y var z
    | Some x, None, None -> Format.printf "%g%s^2 = 0@." x var
    | Some x, None, Some z -> Format.printf "%g%s^2 + %g = 0@." x var z
    | Some x, Some y, None -> Format.printf "%g%s^2 + %g%s = 0@." x var y var
    | Some x, Some y, Some z-> Format.printf "%g%s^2 + %g%s + %g = 0@." x var y var z
  end

let deltap delta =
  Format.printf (
    if delta > 0. then
      "Delta is strictly positive (%g), the two solutions are:@."
    else if delta < 0. then
      "Delta is strictly negative (%g), there is no solution with real numbers:@."
    else
      "Delta is %g, the solution is:@."
  ) delta

let pow fmt n =
  if n <> 1 then Format.fprintf fmt "^%d" n

let var fmt = function
  | None -> ()
  | Some (x, n) -> Format.fprintf fmt "%s%a" x pow n

let mono fmt (a, x) =
  Format.fprintf fmt "%g%a" a var x

let poly fmt = function
  | [] -> Format.fprintf fmt "0"
  | polynome -> Format.pp_print_list ~pp_sep:(fun fmt () -> Format.fprintf fmt " + ") mono fmt polynome

let equ fmt (left, right) =
  Format.fprintf fmt "@.%a = %a@." poly left poly right

let std (e : equation) =
  equ Format.std_formatter e
