open Computor_lib

let usage () =
  Format.eprintf "usage: %s <file>@." Sys.argv.(0);
  exit 1

let () =
  if Array.length Sys.argv <> 2 then usage () ;
  let chan = open_in Sys.argv.(1) in
  let buf = Lexing.from_channel chan in
  let file = Parser.equation Lexer.token buf in
  close_in chan;
  Pp.std file ;
  Solver.solve file
