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
  | Syntax_error _ -> "There is a syntax error in this input."
  | Parser.Error -> "There is an unknown token in this input."

let convert_newlines s =
  let buff = Buffer.create 512 in
  let fmt = Format.formatter_of_buffer buff in
  String.iter
    (function
      | '\n' -> Format.fprintf fmt "\n<br />"
      | c -> Format.fprintf fmt "%c" c )
    s;
  Buffer.contents buff
