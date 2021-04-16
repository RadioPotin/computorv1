open Computor

let usage () =
  Format.eprintf "usage: %s <file>@." Sys.argv.(0);
  exit 1

let () =
  if Array.length Sys.argv <> 2 then usage () ;
  let chan = Sys.argv.(1) in
  let buf = Lexing.from_string chan in
  let file = Parser.equation Lexer.token buf in
  Solver.solve file
