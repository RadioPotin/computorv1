(*
 * This file will contain all custom types for computorv1
 *)

exception Big_degree
exception Too_many_variables

type monome =
  | Const of float
  | Term of float * string * int

type polynome =
  | Mon of monome
  | Add of polynome * polynome
  | Sub of polynome * polynome

type equation = polynome * polynome
