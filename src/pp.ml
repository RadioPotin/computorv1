(* This file will contain all pretty-printing for computorv1 *)

open Ast

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

let reduced fmt e =
  Format.fprintf fmt "@.%a = 0@." poly e

let std (e : equation) =
  equ Format.std_formatter e
