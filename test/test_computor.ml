open Computor
open Ast

let eq_to_string s = Format.asprintf "%a" Solver.solve (Parser.equation Lexer.token (Lexing.from_string s))

let handle_test number expected given =
  Format.printf "Test %d: %s@." number given;
  assert (String.equal expected (eq_to_string given))

let () =
  (*
   * TEST 0
   *)
  handle_test 0
    "Reduced form: 4 * X^0 + 4 * X^1 - 9.3 * X^2 = 0\nPolynomial degree: 2\nDiscriminant is strictly positive, the two solutions are:\n0.905239\n-0.475131\n"
    "5 * X^0 + 4 * X^1 - 9.3 * X^2 = 1 * X^0";

  (*
   * TEST 1
   *)
  handle_test 1
    "Reduced form: 1 * X^0 + 4 * X^1 = 0\nPolynomial degree: 1\nThe solution is:\n-0.25\n"
    "5 * X^0 + 4 * X^1 = 4 * X^0";

  (*
   * TEST 2
   *)
  try
    handle_test 2
      "Reduced form: 5 * X^0 - 6 * X^1 + 0 * X^2 - 5.6 * X^3 = 0\nPolynomial degree: 3\nThe polynomial degree is stricly greater than 2, I can't solve.\n"
      "8 * X^0 - 6 * X^1 + 0 * X^2 - 5.6 * X^3 = 3 * X^0";
  with
  | Big_degree -> ();

  (*
   * TEST 3
   *)
    handle_test 3
      "Reduced form: 5 * X^0 + 4 * X^1 = 0\nPolynomial degree: 1\nThe solution is:\n-1.25\n"
      "5 + 4 * X + X^2 = X^2";
  (*
   * TEST 4
   *)
    handle_test 4
      "Reduced form: 5 * X^0 + 10 * X^1 + 5 * X^2 = 0\nPolynomial degree: 2\nThe solution is:\n-1\n"
      "6 * X^0 + 11 * X^1 + 5 * X^2 = 1 * X^0 + 1 * X^1";

  (*
   * TEST 5
   *)
    handle_test 5
      "Reduced form: 4 * X^0 + 12 * X^1 + 3 * X^2 = 0\nPolynomial degree: 2\nDiscriminant is strictly positive, the two solutions are:\n-3.63299\n-0.367007\n"
      "5 * X^0 + 13 * X^1 + 3 * X^2 = 1 * X^0 + 1 * X^1";

  (*
   * TEST 6
   *)
    handle_test 6
      "Reduced form: 1 * X^0 - 7 * X^1 = 0\nPolynomial degree: 1\nThe solution is:\n0.142857\n"
      "5 * X^0 = 4 * X^0 + 7 * X^1";

  (*
   * TEST 7
   *)
    handle_test 7
      "Reduced form: -4 * X^0 = 0\nImpossible.\n"
      "4 * X^0 = 8 * X^0";

  (*
   * TEST 8
   *)
    handle_test 8
      "Reduced form: 4 * X^0 + 3 * X^1 + 3 * X^2 = 0\nPolynomial degree: 2\nDiscriminant is strictly negative, there is no solution with real numbers:\nComplex solution here.\n"
      "5 * X^0 + 3 * X^1 + 3 * X^2 = 1 * X^0 + 0 * X^1";
  (*
   * TEST 9
   *)
    handle_test 9
      "Reduced form: 0 = 0\nPolynomial degree: 0\nThe solution is:\nAll real numbers are solutions.\n"
      "5 * X^0 = 5 * X^0";
