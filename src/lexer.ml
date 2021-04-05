(*

  Grammar

/ ! \  + means AT LEST ONE
/_!_\  * means ZERO OR MORE

  end -> epsilon
  equation -> expression '=' expression end
  expression -> (sum | product | factor | term) +
  sum -> product (('+' product)|('-' product))*
  product -> factor (('*' factor)|('/' factor))*
  factor -> power | term
  power -> term '^' factor
  term -> group | variable | number
  group -> '(' expression ')'
  variable -> [a-zA-Z]+
  number-> [0-9]+
  *)


(*
  Need:
  A function for each grammar rule that call eachother recursively in the parser

  Also:
  A lexer that generates a token list to send to parser.

  *)

open Str
open Printf

type terminals =
    Nbr of string
  |Var of char
  |Open_p of char
  |Clos_p of char
  |Pow of char
  |Minus of char
  |Plus of char
  |Mult of char
  |Divi of char
  |Equa of char
  |End

(*
	Regex for number identification,
		One for positive integers without + sign := 5, 7, 4589
		Another for positive OR negative integers WITH +- sign and parentheses := (+5) (-45)
	*)
let re_num = regexp "[1-9][0-9]*"
let re_pnum = regexp "(\\([-+]?[1-9][0-9]*\\))"

let re_var = regexp "[a-zA-Z]"
let re_ope = regexp "("
let re_clo = regexp ")"
let re_pow = regexp "\\^"
let re_sum = regexp "+"
let re_sub = regexp "-"
let re_mul = regexp "*"
let re_div = regexp "/"
let re_equ = regexp "="
let re_spc = regexp "[ \n\r\x0c\t]+"

let rec print_toklist l =
  match l with
  | [] -> printf "End of Token List"
  | x::r -> match x with
    | Nbr x -> printf "[ %s ]" x; print_toklist r
    | Var x -> printf "[ %c ]" x; print_toklist r
    | Open_p _x -> printf "[ ( ]"; print_toklist r
    | Clos_p _x -> printf "[ ) ]"; print_toklist r
    | Pow _x -> printf "[ ^ ]"; print_toklist r
    | Minus _x -> printf "[ - ]"; print_toklist r
    | Plus _x -> printf "[ + ]"; print_toklist r
    | Mult _x -> printf "[ * ]"; print_toklist r
    | Divi _x -> printf "[ / ]"; print_toklist r
    | Equa _x -> printf "[ = ]"; print_toklist r
    | End -> printf "[ END ]\n"; print_toklist r

exception UnknownToken of string
exception UnauthorizedSyntax of string

let lexer raw =
  let rec tok pos s =
    if pos >= String.length s then [End]
    else if ((Str.string_match re_pnum s pos)
             || (Str.string_match re_num s pos)) then
      let token = Str.matched_string s in
      (Nbr token)::(tok (pos + String.length token) s);
    else if (Str.string_match re_sum s pos) then
      Plus '+'::(tok (pos + 1) s)
    else if (Str.string_match re_mul s pos) then
      Mult '*'::(tok (pos + 1) s)
    else if (Str.string_match re_div s pos) then
      Divi '/'::(tok (pos + 1) s)
    else if (Str.string_match re_sub s pos) then
      Minus '-'::(tok (pos + 1) s)
    else if (Str.string_match re_pow s pos) then
      Pow '^'::(tok (pos + 1) s)
    else if (Str.string_match re_var s pos) then
      let token = Str.matched_string s in
      (Var token.[0])::(tok (pos + 1) s)
    else if (Str.string_match re_ope s pos) then
      Open_p '('::(tok (pos + 1) s)
    else if (Str.string_match re_clo s pos) then
      Clos_p ')'::(tok (pos + 1) s)
    else if (Str.string_match re_equ s pos) then
      Equa '='::(tok (pos + 1) s)
    else if (Str.string_match re_spc s pos) then
      (tok (pos + 1) s)
    else
      raise (UnknownToken "No token was generated")
  in
  tok 0 raw
