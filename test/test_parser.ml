open Computor

let eq_parse s = Parser.equation Lexer.token (Lexing.from_string s)

let counter =
  let count = ref (-1) in
  fun () ->
    incr count;
    !count

let handle_test expectedL expectedR given =
  Format.printf "Test %d: %s@." (counter()) given;
  let eq e1 e2 =
    let f1, opt1 = e1 in
    let f2, opt2 = e2 in
    begin
      if Float.compare f1 f2 = 0 then
        match opt1, opt2 with
        | None, None -> true
        | None, Some _x -> false
        | Some _x, None -> false
        | Some (var1, p1), Some (var2, p2) ->
          String.equal var1 var2 && Int.compare p1 p2 = 0
      else
        false
    end
  in
  let ast = eq_parse given in
  let pl, pr = Solver.file_to_lists ast in
  try
    List.iter2 (fun x y -> assert (eq x y)) expectedL pl;
    List.iter2 (fun x y -> assert (eq x y)) expectedR pr; ()
  with
    Assert_failure _ -> ()

let test_parser () =
  Format.printf "---- Now testing parser ----@.";
  (*
   * TEST 0
   *)
  handle_test
    [(0., None)]
    [(0., None)]
    "0 = 0";

  (*
   * TEST 1
   *)
  handle_test
    [(0., None)]
    [(3., None)]
    "0 = 3";

  (*
   * TEST 2
   *)
  handle_test
    [(0., None)]
    [(0., None)]
    "-x + 1 = 0";

  (*
   * TEST 3
   *)
  handle_test
    [(0., None)]
    [(0., None)]
    "0 = 0";

  (*
   * TEST 4
   *)
  handle_test
    [(5., Some("X", 0));(4., Some("X", 1));(-9.3, Some("X", 2))]
    [(1., Some("X", 0))]
    "5 * X^0 + 4 * X^1 - 9.3 * X^2 = 1 * X^0"
