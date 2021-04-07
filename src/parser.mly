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
