open Computor
open Ast
open Test_parser

let eq_to_string s = Format.asprintf "%a" Solver.solve (Parser.equation Lexer.token (Lexing.from_string s))

let counter =
  let count = ref (-1) in
  fun () -> incr count;
    !count
let handle_test expected given =
  Format.printf "Test %d: %s@." (counter()) given;
  assert (String.equal expected (eq_to_string given))

let () =

  (*
   * Test 0
   *)
  handle_test
    "Reduced form: 4 * X^0 + 4 * X^1 - 9.3 * X^2 = 0\nPolynomial degree: 2\nDiscriminant is strictly positive, the two solutions are:\n0.905239\n-0.475131\n"
    "5 * X^0 + 4 * X^1 - 9.3 * X^2 = 1 * X^0";

  (*
   * Test 1
   *)
  handle_test
    "Reduced form: 1 * X^0 + 4 * X^1 = 0\nPolynomial degree: 1\nThe solution is:\n-0.25\n"
    "5 * X^0 + 4 * X^1 = 4 * X^0";

  (*
   * Test 2
   *)
  try
    handle_test
      "Reduced form: 5 * X^0 - 6 * X^1 + 0 * X^2 - 5.6 * X^3 = 0\nPolynomial degree: 3\nThe polynomial degree is stricly greater than 2, I can't solve.\n"
      "8 * X^0 - 6 * X^1 + 0 * X^2 - 5.6 * X^3 = 3 * X^0";
  with
  | Big_degree -> ();

  (*
   * Test 3
   *)
    handle_test
      "Reduced form: 5 * X^0 + 4 * X^1 = 0\nPolynomial degree: 1\nThe solution is:\n-1.25\n"
      "5 + 4 * X + X^2 = X^2";

  (*
   * Test 4
   *)
    handle_test
      "Reduced form: 5 * X^0 + 10 * X^1 + 5 * X^2 = 0\nPolynomial degree: 2\nThe solution is:\n-1\n"
      "6 * X^0 + 11 * X^1 + 5 * X^2 = 1 * X^0 + 1 * X^1";

  (*
   * Test 5
   *)
    handle_test
      "Reduced form: 4 * X^0 + 12 * X^1 + 3 * X^2 = 0\nPolynomial degree: 2\nDiscriminant is strictly positive, the two solutions are:\n-3.63299\n-0.367007\n"
      "5 * X^0 + 13 * X^1 + 3 * X^2 = 1 * X^0 + 1 * X^1";

  (*
   * Test 6
   *)
    handle_test
      "Reduced form: 1 * X^0 - 7 * X^1 = 0\nPolynomial degree: 1\nThe solution is:\n0.142857\n"
      "5 * X^0 = 4 * X^0 + 7 * X^1";

  (*
   * Test 7
   *)
    handle_test
      "Reduced form: -4 * X^0 = 0\nImpossible.\n"
      "4 * X^0 = 8 * X^0";

  (*
   * Test 8
   *)
    handle_test
      "Reduced form: 4 * X^0 + 3 * X^1 + 3 * X^2 = 0\nPolynomial degree: 2\nDiscriminant is strictly negative, there is no solution with real numbers:\nComplex solution here.\n"
      "5 * X^0 + 3 * X^1 + 3 * X^2 = 1 * X^0 + 0 * X^1";

  (*
   * Test 9
   *)
    handle_test
      "Reduced form: 0 = 0\nPolynomial degree: 0\nThe solution is:\nAll real numbers are solutions.\n"
      "5 * X^0 = 5 * X^0";

  (*
   * Test 10
   *)
    handle_test
      "Reduced form: 24 * x^0 + 6 * x^2 = 0\nPolynomial degree: 2\nDiscriminant is strictly positive, the two solutions are:\n-2\n2\n"
      "6 * x^2 + 11 * x^0 - 35 = 0";

  (*
   * Test 11
   *)
    handle_test
      "Reduced form: 3 * x^0 - 1 * x^1 + 1 * x^2 = 0\nPolynomial degree: 2\nDiscriminant is strictly positive, the two solutions are:\n-1.30278\n2.30278\n"
      "x^2 -x - 3 = 0";

  (*
   * Test 12
   *)
    handle_test
      "Reduced form: 64 * x^0 + 2 * x^2 = 0\nPolynomial degree: 2\nDiscriminant is strictly positive, the two solutions are:\n-5.65685\n5.65685\n"
      "2x^2 - 64 = 0";

  (*
   * Test 13
   *)
    handle_test
      "Reduced form: 7 * x^1 + 1 * x^2 = 0\nPolynomial degree: 2\nDiscriminant is strictly positive, the two solutions are:\n0\n7\n"
      "x^2 - 7x = 0";

  (*
   * Test 14
   *)
    try
      handle_test
        "There are two different variables `x` and `y`!\nWon't compute.\n"
        "2x + 4y = 0";
    with
    | Too_many_variables -> ();

      test_parser ()
