open Computor
open Ast
open Test_parser
open Test_pp
open Test_solver

let handle_test expected given =
  Format.printf "Test %d: %s@." (counter ()) given;
  let ast = eq_parse given in
  let pl, pr = Solver.ast_to_lists ast in
  let str = Format.asprintf "%a" Solver.solve (pl, pr) in
  try assert (String.equal expected str) with
  | Assert_failure _ ->
    Format.eprintf
      "EXPECTED\t\t--------------------@.@.%s@.GOT     \
       \t\t--------------------@.@.%s@."
      expected str;
    exit 1

let () =
  Format.printf "---- Now testing computor ----@.";
  (*
   * Test 0
   *)
  handle_test
    "Reduced form: 4 + 4 * X - 9.3 * X^2 = 0\n\
     Polynomial degree: 2\n\
     Discriminant is strictly positive, the two solutions are:\n\
     0.905239\n\
     -0.475131\n"
    "5 * X^0 + 4 * X^1 - 9.3 * X^2 = 1 * X^0";

  (*
   * Test 1
   *)
  handle_test
    "Reduced form: 1 + 4 * X = 0\n\
     Polynomial degree: 1\n\
     The solution is:\n\
     -0.25\n"
    "5 * X^0 + 4 * X^1 = 4 * X^0";

  (*
   * Test 2
   *)
  try
    handle_test
      "Reduced form: 5 * X^0 - 6 * X^1 + 0 * X^2 - 5.6 * X^3 = 0\n\
       Polynomial degree: 3\n\
       The polynomial degree is stricly greater than 2, I can't solve.\n"
      "8 * X^0 - 6 * X^1 + 0 * X^2 - 5.6 * X^3 = 3 * X^0"
  with
  | Big_degree -> (
      ();

    (*
     * Test 3
     *)
      handle_test
        "Reduced form: 5 + 4 * X = 0\n\
         Polynomial degree: 1\n\
         The solution is:\n\
         -1.25\n"
        "5 + 4 * X + X^2 = X^2";

    (*
     * Test 4
     *)
      handle_test
        "Reduced form: 5 + 10 * X + 5 * X^2 = 0\n\
         Polynomial degree: 2\n\
         The solution is:\n\
         -1\n"
        "6 * X^0 + 11 * X^1 + 5 * X^2 = 1 * X^0 + 1 * X^1";

    (*
     * Test 5
     *)
      handle_test
        "Reduced form: 4 + 12 * X + 3 * X^2 = 0\n\
         Polynomial degree: 2\n\
         Discriminant is strictly positive, the two solutions are:\n\
         -3.63299\n\
         -0.367007\n"
        "5 * X^0 + 13 * X^1 + 3 * X^2 = 1 * X^0 + 1 * X^1";

    (*
     * Test 6
     *)
      handle_test
        "Reduced form: 1 - 7 * X = 0\n\
         Polynomial degree: 1\n\
         The solution is:\n\
         0.142857\n"
        "5 * X^0 = 4 * X^0 + 7 * X^1";

    (*
     * Test 7
     *)
      handle_test "Reduced form: -4 = 0\nImpossible.\n"
        "4 * X^0 = 8 * X^0";

    (*
     * Test 8
     *)
      handle_test
        "Reduced form: 4 + 3 * X + 3 * X^2 = 0\n\
         Polynomial degree: 2\n\
         Discriminant is strictly negative, there is no solution with real numbers:\n\
         -0.5 - 1.04083i\n\
         -0.5 + 1.04083i\n"
        "5 * X^0 + 3 * X^1 + 3 * X^2 = 1 * X^0 + 0 * X^1";

    (*
     * Test 9
     *)
      handle_test
        "Reduced form: 0 = 0\n\
         Polynomial degree: 0\n\
         The solution is:\n\
         All real numbers are solutions.\n"
        "5 * X^0 = 5 * X^0";

    (*
     * Test 10
     *)
      handle_test
        "Reduced form: -24 + 6 * x^2 = 0\n\
         Polynomial degree: 2\n\
         Discriminant is strictly positive, the two solutions are:\n\
         -2\n\
         2\n"
        "6 * x^2 + 11 * x^0 - 35 = 0";

    (*
     * Test 11
     *)
      handle_test
        "Reduced form: -3 - 1 * x + 1 * x^2 = 0\n\
         Polynomial degree: 2\n\
         Discriminant is strictly positive, the two solutions are:\n\
         -1.30278\n\
         2.30278\n"
        "x^2 -x - 3 = 0";

    (*
     * Test 12
     *)
      handle_test
        "Reduced form: -64 + 2 * x^2 = 0\n\
         Polynomial degree: 2\n\
         Discriminant is strictly positive, the two solutions are:\n\
         -5.65685\n\
         5.65685\n"
        "2x^2 - 64 = 0";

    (*
     * Test 13
     *)
      handle_test
        "Reduced form: -7 * x + 1 * x^2 = 0\n\
         Polynomial degree: 2\n\
         Discriminant is strictly positive, the two solutions are:\n\
         0\n\
         7\n"
        "x^2 - 7x = 0";

    (*
     * Test 14
     *)
      try
        handle_test
          "There are two different variables `x` and `y`!\nWon't compute.\n"
          "2x + 4y = 0"
      with
      | Too_many_variables ->
        ();
      (*
       * Test 15
       *)
        handle_test
          "Reduced form: 5 + 4 * x + 1 * x^2 = 0\n\
           Polynomial degree: 2\n\
           Discriminant is strictly negative, there is no solution with real numbers:\n\
           -2 - i\n\
           -2 + i\n"
          "x^2 + 4x + 5 = 0";

      (*
       * Test 16
       *)
        handle_test
          "Reduced form: 6 + 3 * x + 2 * x^2 = 0\n\
           Polynomial degree: 2\n\
           Discriminant is strictly negative, there is no solution with real numbers:\n\
           -0.75 - 1.56125i\n\
           -0.75 + 1.56125i\n"
          "2x^2+3x+6=0";

      (*
       * Test 17
       *)
        handle_test
          "Reduced form: 0 = 0\n\
           Polynomial degree: 0\n\
           The solution is:\n\
           All real numbers are solutions.\n"
          "-1 - -1 = 0";

      (*
       * Test 18
       *)
        handle_test
          "Reduced form: -2 * x^2 = 0\n\
           Polynomial degree: 2\n\
           The solution is:\n\
           0\n"
          "-2 * x^2 = 0";

      (*
       * Test 19
       *)
        handle_test
          "Reduced form: 0 = 0\n\
           Polynomial degree: 0\n\
           The solution is:\n\
           All real numbers are solutions.\n"
          "-1 - -1 = 0";

      (*
       * Test 20
       *)
        handle_test
          "Reduced form: -2 * x^2 = 0\n\
           Polynomial degree: 2\n\
           The solution is:\n\
           0\n"
          "-2 * x^2 = 0";

      (*
       * Test 21
       *)
        handle_test
          "Reduced form: -2 * x = 0\n\
           Polynomial degree: 1\n\
           The solution is:\n\
           0\n"
          "-2 * x = 0";

        test_parser ();
        test_pp ();
        test_solver () )
