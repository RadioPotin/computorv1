open Computor
open Test_parser
open Ast

  (*
   * All tests for Solver module
   *)

let test_solver () =
  Format.printf "---- Now testing solver ----@.";
  Format.printf "Test %d: Sending ungenerated test to file_to_list for coverage@." (counter());
  let p1, p2 = Solver.file_to_lists (
    Sub(Mon (Const (-1.)), Mon(Const (-3.))),
    Sub(Sub(Mon(Const (-1.)), Mon(Const (-2.))),
      Sub(Mon(Const (-3.)), Mon(Const (-4.))))
  ) in
  let str = Format.asprintf "%a" Solver.solve (p1, p2)
  in Format.fprintf Format.std_formatter "%s" str
