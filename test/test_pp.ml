open Computor
open Test_parser

  (*
   * All tests for Pp module
   *)

let handle_test_pp expected (pl, pr) var =
  let s = Format.asprintf "%a = %a\n" Pp.equ (pl, var) Pp.equ (pr, var) in
  try
    assert (String.equal expected s)
  with
  | Assert_failure _ -> Format.eprintf "EXPECTED\t\t--------------------@.@.%s@.GOT     \t\t--------------------@.@.%s@." expected s; exit 1

let test_pp () =
  Format.printf "---- Now testing   pp   ----@.";
  (*
   * TEST 28
   *)
  Format.printf "Test %d: Assert Pp.polyprint empty list unreachable path. Ignore ->" (counter());
  begin
    match Pp.polyprint Format.std_formatter ([], "") with
    | exception (Assert_failure _) -> ()
    | () -> assert false
  end;
  Format.printf "\n";

  (*
   * TEST 29
   *)
  Format.printf "Test %d: 0 = 0@." (counter());
  handle_test_pp
    "0 = 0\n"
    ([(0, 0.)], [(0, 0.)])
    "";

  (*
   * TEST 30
   *)
  Format.printf "Test %d: 5 * X^0 + 4 * X^1 - 9.3 * X^2 = 1 * X^0@." (counter());
  handle_test_pp
    "5 * X^0 + 4 * X^1 - 9.3 * X^2 = 1 * X^0\n"
    ([(0, 5.);(1, 4.);(2, -9.3);], [(0, 1.)])
    "X"
