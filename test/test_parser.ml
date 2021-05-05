open Computor

let eq_parse s = Parser.equation Lexer.token (Lexing.from_string s)

let counter =
  let count = ref (-1) in
  fun () ->
    incr count;
    !count

let handle_test expected_l expected_r given =
  Format.printf "Test %d: %s@." (counter()) given;
  let eq e1 e2 =
    let pow1, coef1 = e1 in
    begin
      match e2 with
      |(n, None) -> if Float.compare coef1 n = 0 then Int.compare 0 pow1 = 0 else false
      |(n, Some(_, p)) -> if Float.compare coef1 n = 0 then Int.compare pow1 p = 0 else false
    end
  in
  let ast = eq_parse given in
  let pl, pr = Solver.ast_to_lists ast in
  try
    List.iter2 (fun x y -> assert (eq x y)) expected_l pl;
    List.iter2 (fun x y -> assert (eq x y)) expected_r pr; ()
  with
    Assert_failure _ -> Format.eprintf "Error with equality of lists.@.";
    exit 1

let test_parser () =
  Format.printf "---- Now testing parser ----@.";
  (*
   * TEST 22
   *)
  handle_test
    [(0, 0.)]
    [(0, 0.)]
    "0 = 0";

  (*
   * TEST 23
   *)
  handle_test
    [(0, 0.)]
    [(0, 3.)]
    "0 = 3";

  (*
   * TEST 24
   *)
  handle_test
    [(1, -1.);(0, 1.)]
    [(0, 0.)]
    "-x + 1 = 0";

  (*
   * TEST 25
   *)
  handle_test
    [(1, -1.);(1, -1.);(1, -1.);(2, 1.);(2, -2.);(2, 1.);(0, 1.)]
    [(0, 0.)]
    "-X - X - X + X^2 - 2X^2 + X^2 + 1 = 0";

  (*
   * TEST 26
   *)
  handle_test
    [(0, 5.);(1, 4.);(2, -9.3)]
    [(0, 1.)]
    "5 * X^0 + 4 * X^1 - 9.3 * X^2 = 1 * X^0";

  (*
   * TEST 27
   *)
  handle_test
    [(2, -1.);(0, 1.)]
    [(0, 0.)]
    "-x^2 + 1 = 0"
