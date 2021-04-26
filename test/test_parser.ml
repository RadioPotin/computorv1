open Computor

let eq_to_list_tuple s = Parser.equation Lexer.token (Lexing.from_string s)

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
  let pl, pr = (eq_to_list_tuple given) in
  assert ((List.equal eq expectedL pl) && (List.equal eq expectedR pr))

let test_parser () =
  Format.printf "---- Now testing parser ----@.";
  (*
   * TEST 0
   *)
  handle_test
    [(0., None)]
    [(0., None)]
    "0 = 0"
