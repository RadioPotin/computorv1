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

  Need:
  A function for each grammar rule that call eachother recursively in the parser
*)

%token EOF
%token<string> VAR
%token EQ
%token PLUS
%token MINUS
%token<int> INT
%token CIRCUM

%start <Ast.equation> equation

%%
  equation:
  | lp = polynome EQ rp = polynome EOF { (lp, rp) }

  %inline polynome:
  | p = nonempty_list(monome) {p}

  %inline monome:
  | o = op c = coefficient var = option(variable) {
    match o with
    | Ast.Plus -> (c, var)
    | Ast.Minus -> (-c, var)
  }
| o = op var = variable {
  match o with
  | Ast.Plus -> (1, Some var)
  | Ast.Minus -> (-1, Some var)
}

%inline coefficient:
    |i = INT {i}

    %inline variable:
    |var = VAR p = option(pow) {
      match p with
      |None -> (var, 1)
      |Some p -> (var, p)
    }

    %inline pow:
    | CIRCUM i = INT {i}

    %inline op:
    | PLUS {Ast.Plus}
| MINUS {Ast.Minus}
|{Ast.Plus}
