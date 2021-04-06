open OUnit2
open Computor_lib

(*
let test_sanity _ =
  assert_equal 1 1 ~msg:"Custom error message"

let lexer_test_simple_int _ =
  assert_equal [Nbr "5"; End]
					(lexer "5") ~msg:"Assert Simple Ints 1.";
  assert_equal [Nbr "5"; Minus '-'; Nbr "8"; End]
					(lexer "5-8") ~msg:"Assert Simple Ints 2.";
  assert_equal [Nbr "5"; Divi '/'; Nbr "(-8)"; End]
					(lexer "5 / (-8)") ~msg:"Assert Simple Ints 3.";
  assert_equal [Nbr "(+5)"; Mult '*'; Nbr "5"; Pow '^'; Nbr "7"; Plus '+'; Var 'X'; End]
					(lexer "(+5) * 5^7 + X") ~msg:"Assert Simple Ints 4.";
  assert_equal [Open_p '('; Nbr "5"; Plus '+'; Nbr "8"; Mult '*'; Nbr "8"; Clos_p ')'; Mult '*'; Nbr "8"; End]
					(lexer "(5 + 8 * 8) * 8") ~msg:"Assert Simple Ints 5.";
  assert_equal [End] (lexer "") ~msg:"Assert Simple Ints 6.";
  assert_equal [End] (lexer "") ~msg:"Assert Simple Ints 7."

let lexer_test_simple_float _ =
  assert_equal [End] (lexer "") ~msg:"Assert Simple Floats 1."

let lexer_test_simple_equation _ =
  assert_equal [End] (lexer "") ~msg:"Assert Simple equation fails"
*)
let suite =
  "student" >::: [
    "sanity" >:: test_sanity
	(*
    "simple_int" >:: lexer_test_simple_int;
    "simple_float" >:: lexer_test_simple_float;
	"simple_equation">:: lexer_test_simple_equation
	*)
  ]

let () = run_test_tt_main suite
