{
open Parser
}

let linebreak = ['\n' '\r']
let whitespace = [' ']
let var_id = ['a'-'z' 'A'-'Z']+
let int_id = ['0'-'9']+
let float_id  = ['0'-'9']+['.']['0'-'9']+

rule token = parse
          | whitespace { token lexbuf }
          | linebreak {token lexbuf}
          | "=" {EQ}
          | "+" {PLUS}
          | "*" {STAR}
          | "^" {CIRCUM}
          | "-" {MINUS}
          | int_id as id {INT (int_of_string id)}
          | float_id as id {FLOAT (float_of_string id)}
          | var_id as id {VAR id}
          | eof { EOF }
