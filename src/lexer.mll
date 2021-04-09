{
open Parser
}

let linebreak = ['\n' '\r']
let whitespace = [' ']
let var_id = ['a'-'z' 'A'-'Z']+
    let int_id = ['0'-'9']+

        rule token = parse
               | whitespace { token lexbuf }
               | linebreak {token lexbuf}
               | "=" {EQ}
               | "+" {PLUS}
               | "^" {CIRCUM}
               | "-" {MINUS}
               | int_id as id {INT (int_of_string id)}
               | var_id as id {VAR id}
               | eof { EOF }
