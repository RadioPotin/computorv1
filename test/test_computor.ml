open Computor

let () =
  let s =
    Format.asprintf "%a" Solver.solve (Parser.equation Lexer.token (Lexing.from_string "5 * X^0 + 4 * X^1 - 9.3 * X^2 = 1 * X^0")) in
  assert (String.equal "Reduced form: 4 * X^0 + 4 * X^1 + -9.3 * X^2 = 0\nPolynomial degree: 2\nDiscriminant is strictly positive, the two solutions are:\n0.905239\n-0.475131\n" s);

  let s =
    Format.asprintf "%a" Solver.solve (Parser.equation Lexer.token (Lexing.from_string "5 * X^0 + 4 * X^1 = 4 * X^0")) in
  assert (String.equal "Reduced form: 1 * X^0 + 4 * X^1 = 0\nPolynomial degree: 1\nThe solution is:\n-0.25\n" s);

  let s =
    Format.asprintf "%a" Solver.solve (Parser.equation Lexer.token (Lexing.from_string "8 * X^0 - 6 * X^1 + 0 * X^2 - 5.6 * X^3 = 3 * X^0")) in
  assert (String.equal "Reduced form: 5 * X^0 - 6 * X^1 + 0 * X^2 - 5.6 * X^3 = 0\nPolynomial degree: 3\nThe polynomial degree is stricly greater than 2, I can't solve.\n" s)
