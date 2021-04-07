(* This file will contain all pretty-printing for computorv1 *)

open Ast

let pp_mono fmt _bla =
  Format.fprintf fmt "TODO"

let pp_poly fmt _bla =
  Format.fprintf fmt "TODO"

let pp_eq fmt (left, right) =
  Format.fprintf fmt "%a = %a@." pp_poly left pp_poly right

let pp_std (eq : equation) =
  pp_eq Format.std_formatter eq
