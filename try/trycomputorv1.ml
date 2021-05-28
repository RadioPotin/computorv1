open Js_of_ocaml
open Computor
open Ast

let result s =
  try
    let ast = Parser.equation Lexer.token (Lexing.from_string s) in
    let polynomes = Solver.ast_to_lists ast in
    Format.asprintf "%a" Solver.solve polynomes
  with
  | Big_degree ->
    "Highest degree is superior to 2, please give a second degree equation."
  | Too_many_variables ->
    "There are more than one variable in this equation, please give only one."
  | Syntax_error _ -> "There is an unknown token in this input."
  | Parser.Error -> "There is a syntax error in this input."
  | e ->
    Format.eprintf "ERROR: %s" (Printexc.to_string e);
    raise e

let convert_newlines s =
  let buff = Buffer.create 512 in
  let fmt = Format.formatter_of_buffer buff in
  String.iter
    (function
      | '\n' -> Format.fprintf fmt "\n<br />"
      | c -> Format.fprintf fmt "%c" c )
    s;
  Format.pp_print_flush fmt ();
  Buffer.contents buff

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

let () =
  let _id =
    Dom_html.addEventListener button Dom_html.Event.click
      (Dom_html.handler (fun _ ->
           blockquote##.innerHTML :=
             Js.string @@ convert_newlines
             @@ result (Js.to_string textarea##.value);
           Js.bool true ) )
      (Js.bool false)
  in
  ()
