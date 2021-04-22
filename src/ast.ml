(*
 * This file will contain all custom types for computorv1
 *)

exception Big_degree
exception Too_many_variables

type op = Plus | Minus

(*
 * ax^n
 *)
type monome = float * ((string * int) option)

(*
 * aX^n + X + b
 * [(a, ("x", n));;(1, ("x", 1));;(b,("", 1))]
*)
type polynome = monome list

type equation = polynome * polynome
