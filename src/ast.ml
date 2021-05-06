(** This file will contain all custom types for computorv1 *)

(** Exception raised when equation has a monome with a degree > 2, this obeys
    the specifications of the project *)
exception Big_degree

(** Exception raised when equation has a two or more distinct variables, this
    obeys the specifications of the project *)
exception Too_many_variables

(** Type for a monomes generated after receving result of parsing, the optionnal
    part of the type is to enlarge scope of parsable input by accepting monomes
    like [a] | [ax] | [ax^n] | [a * x] | [a * x^n] *)
type monome = float * (string * int) option

(** Recursive type definition for parser *)
type polynome =
  | Mon of monome
  | Add of polynome * polynome
  | Sub of polynome * polynome

type equation = polynome * polynome
