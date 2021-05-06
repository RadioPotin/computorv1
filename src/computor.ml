(** Main entry point to the Computor executable *)

open Computor
open Ast

(** Displays the usage of computor executable *)
let usage () =
  Format.eprintf "usage: %s <2nd degree equation>@." Sys.argv.(0);
  exit 1

let () =
  if Array.length Sys.argv <> 2 then usage ();
  let buf = Lexing.from_string Sys.argv.(1) in
  try
    let file = Parser.equation Lexer.token buf in
    let polynomes = Solver.ast_to_lists file in
    Solver.solve Format.std_formatter polynomes
  with
  | Big_degree -> exit 1
  | Too_many_variables -> exit 1
