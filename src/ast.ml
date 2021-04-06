(* This file will contain all custom types for computorv1 *)

(*
  ax^n
*)
type monome = int * (string option) * int

(*
  aX^n + X + b 
  [a, "x", n]::[1, "x", 1]::[b,"",1]::[]
*)
type polynome = monome list

type equation = polynome * polynome
