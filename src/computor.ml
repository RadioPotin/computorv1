open Computor

let usage () =
  Format.eprintf "usage: %s <2nd degree equation>@." Sys.argv.(0);
  exit 1

let () =
  if Array.length Sys.argv <> 2 then usage () ;
  let buf = Lexing.from_string Sys.argv.(1) in
  let file = Parser.equation Lexer.token buf in
  Solver.solve Format.std_formatter file