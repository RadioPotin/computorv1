(* This file will contain all pretty-printing for computorv1 *)

open Ast

let pow fmt n =
  if n <> 1 then Format.fprintf fmt "^%d" n

let var fmt = function
  | None -> ()
  | Some (x, n) -> Format.fprintf fmt "%s%a" x pow n

let mono fmt (a, x) =
  Format.fprintf fmt "%d%a" a var x

let poly fmt = function
  | [] -> Format.fprintf fmt "0"
  | polynome -> Format.pp_print_list ~pp_sep:(fun fmt () -> Format.fprintf fmt " + ") mono fmt polynome

let equ fmt (left, right) =
  Format.fprintf fmt "@.%a = %a0@." poly left poly right

let std (e : equation) =
  equ Format.std_formatter e
