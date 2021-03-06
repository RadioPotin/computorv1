open Computor
open Test_parser

(*
 * All tests for Pp module
 *)

let handle_test_pp expected (pl, pr) var =
  let s = Format.asprintf "%a\n" Pp.equ (pl, pr, var) in
  try assert (String.equal expected s) with
  | Assert_failure _ ->
    Format.eprintf
      "EXPECTED\t\t--------------------@.@.%s@.GOT     \
       \t\t--------------------@.@.%s@."
      expected s;
    exit 1

let test_pp () =
  Format.printf "---- Now testing   pp   ----@.";
  (*
   * TEST 35
   *)
  Format.printf "Test %d: 0 = 0@." (counter ());
  handle_test_pp "0 = 0\n" ([ (0, 0.) ], [ (0, 0.) ]) "";

  (*
   * TEST 36
   *)
  Format.printf "Test %d: 5 * X^0 + 4 * X^1 - 9.3 * X^2 = 1 * X^0@."
    (counter ());
  handle_test_pp "5 + 4 * X - 9.3 * X^2 = 1\n"
    ([ (0, 5.); (1, 4.); (2, -9.3) ], [ (0, 1.) ])
    "X"
