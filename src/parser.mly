(*
 * Parser for computorv1, still need to support:
 * floats
 * products
 * divisions
*)

%token EOF
%token<string> VAR
%token EQ
%token PLUS
%token STAR
%token MINUS
%token<int> INT
%token<float> FLOAT
%token CIRCUM

%start <Ast.equation> equation

%%
  equation:
  | lp = polynome EQ rp = polynome EOF { (lp, rp) }

  %inline polynome:
  | p = nonempty_list(monome) {p}

  %inline monome:
  | o = op c = coefficient option(STAR) var = option(variable) {
    match o with
    | Ast.Plus -> (c, var)
    | Ast.Minus -> (~-.c, var)
  }
| o = op var = variable {
  match o with
  | Ast.Plus -> (1., Some var)
  | Ast.Minus -> (-1., Some var)
}

%inline variable:
    |var = VAR p = option(pow) {
      match p with
      |None -> (var, 1)
      |Some p -> (var, p)
    }

    %inline coefficient:
    |i = INT {float_of_int i}
|i = FLOAT {i}

%inline pow:
   | CIRCUM i = INT {i}

   %inline op:
   | PLUS {Ast.Plus}
| MINUS {Ast.Minus}
|{Ast.Plus}
