open Computor
open Test_parser
open Ast

(*
 * All tests for Solver module
 *)
let handle_test_ast expected ast =
  Format.printf
    "Test %d: Ast behaviour for Sub(a, b) function convert_sub match case@."
    (counter ());
  let pl = Solver.convert ast in
  let eq e1 e2 =
    let f1, opt1 = e1 in
    let f2, opt2 = e2 in
    if Float.compare f1 f2 = 0 then
      match (opt1, opt2) with
      | None, None -> true
      | None, Some _x -> false
      | Some _x, None -> false
      | Some (var1, p1), Some (var2, p2) ->
        String.equal var1 var2 && Int.compare p1 p2 = 0
    else
      false
  in
  try
    List.iter2 (fun x y -> assert (eq x y)) expected pl;
    ()
  with
  | Assert_failure _ ->
    Format.eprintf "Error with equality of lists.:@.@.";
    exit 1

let test_solver () =
  Format.printf "---- Now testing solver ----@.";
  (*
   * Test for Sub(a, b) match for convert_sub recursive call
   *)
  handle_test_ast
    [ (3., None); (-4., None); (-5., None) ]
    (Sub (Mon (3., None), Sub (Mon (4., None), Mon (5., None))))
