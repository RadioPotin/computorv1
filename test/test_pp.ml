open Computor
open Test_parser

  (*
   * All tests for Pp module
   *)

let test_pp () =
  Format.printf "---- Now testing   pp   ----@.";
  Format.printf "Test %d: Assert Pp.polyprint empty list unreachable path. Ignore ->" (counter());
  begin
    match Pp.polyprint Format.std_formatter ([], "") with
    | exception (Assert_failure _) -> ()
    | () -> assert false
  end;
  Format.printf "\n";
