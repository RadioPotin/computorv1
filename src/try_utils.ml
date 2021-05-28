(** This file contains two functions used in module
    computorv1/try/trycomputorv1.ml. *)

open Ast

(** [result s] takes input from <textarea id="textbox"> and feeds it to
    computorv1 program. Also catches all possible errors. *)
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

(** [convert_newlines s] takes the string [result] function returns and converts
    all newlines in it to an HTML compatible newline. *)
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
