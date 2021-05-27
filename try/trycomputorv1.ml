open Js_of_ocaml
open Computor

let error s =
  Format.eprintf "%s@." s;
  assert false

let textarea =
  let text = Dom_html.window##.document##getElementById (Js.string "textbox") in
  Js.coerce_opt text Dom_html.CoerceTo.textarea (fun _ ->
      error "Invalid textarea" )

let blockquote =
  let output =
    Dom_html.window##.document##getElementById (Js.string "output")
  in
  Js.coerce_opt output Dom_html.CoerceTo.blockquote (fun _ ->
      error "Invalid blockquote" )

let button =
  let button = Dom_html.window##.document##getElementById (Js.string "butn") in
  Js.coerce_opt button Dom_html.CoerceTo.button (fun _ ->
      error "Invalid button" )

let result s =
  let ast = Parser.equation Lexer.token (Lexing.from_string (Js.to_string s)) in
  let polynomes = Solver.ast_to_lists ast in
  Format.asprintf "%a" Solver.solve polynomes

let () =
  let _id =
    Dom_html.addEventListener button Dom_html.Event.click
      (Dom_html.handler (fun _ ->
           blockquote##.innerHTML := Js.string (result textarea##.value);
           Js.bool true ) )
      (Js.bool false)
  in
  ()
