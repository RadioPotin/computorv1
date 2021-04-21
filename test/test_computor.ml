open Computor

let eq_to_string s = Format.asprintf "%a" Solver.solve (Parser.equation Lexer.token (Lexing.from_string s))

let () =
  let s =
    Format.printf "Test 0\n";
    eq_to_string "5 * X^0 + 4 * X^1 - 9.3 * X^2 = 1 * X^0" in
  assert (String.equal "Reduced form: 4 * X^0 + 4 * X^1 - 9.3 * X^2 = 0\nPolynomial degree: 2\nDiscriminant is strictly positive, the two solutions are:\n0.905239\n-0.475131\n" s);

  let s =
    Format.printf "Test 1\n";
    eq_to_string "5 * X^0 + 4 * X^1 = 4 * X^0" in
  assert (String.equal "Reduced form: 1 * X^0 + 4 * X^1 = 0\nPolynomial degree: 1\nThe solution is:\n-0.25\n" s);

  let s =
    Format.printf "Test 2\n";
    eq_to_string "8 * X^0 - 6 * X^1 + 0 * X^2 - 5.6 * X^3 = 3 * X^0" in
  assert (String.equal "Reduced form: 5 * X^0 - 6 * X^1 + 0 * X^2 - 5.6 * X^3 = 0\nPolynomial degree: 3\nThe polynomial degree is stricly greater than 2, I can't solve.\n" s);

  let s =
    Format.printf "Test 3\n";
    eq_to_string "5 + 4 * X + X^2= X^2" in
  assert (String.equal "Reduced form: 5 + 4 * X = 0\nPolynomial degree: 1\nThe solution is:\n-1.25\n" s);

  let s =
    Format.printf "Test 4\n";
    eq_to_string "6 * X^0 + 11 * X^1 + 5 * X^2 = 1 * X^0 + 1 * X^1" in
  assert (String.equal "Reduced form: 5 * X^0 + 10 * X^1 + 5 * X^2 = 0\nPolynomial degree: 2\nThe solution is:\n-1\n" s);

  let s =
    Format.printf "Test 5\n";
    eq_to_string "5 * X^0 + 13 * X^1 + 3 * X^2 = 1 * X^0 + 1 * X^1" in
  assert (String.equal "Reduced form: 4 * X^0 + 12 * X^1 + 3 * X^2 = 0\nPolynomial degree: 2\nDiscriminant is strictly positive, the two solutions are:\n-3.63299\n-0.367007\n" s);

  let s =
    Format.printf "Test 6\n";
    eq_to_string "5 * X^0 = 4 * X^0 + 7 * X^1" in
  assert (String.equal "Reduced form: 1 * X^0 - 7 * X^1 = 0\nPolynomial degree: 1\nThe solution is:\n0.142857\n" s);

  let s =
    Format.printf "Test 7\n";
    eq_to_string "4 * X^0 = 8" in
  assert (String.equal "Reduced form: -4 * X^0 = 0\nImpossible.\n" s);

  let s =
    Format.printf "Test 8\n";
    eq_to_string "5 * X^0 + 3 * X^1 + 3 * X^2 = 1 * X^0 + 0 * X^1" in
  assert (String.equal "Reduced form: 4 * X^0 + 3 * X^1 + 3 * X^2 = 0\nPolynomial degree: 2\nDiscriminant is strictly negative, there is no solution with real numbers:\nComplex solution here.\n" s)