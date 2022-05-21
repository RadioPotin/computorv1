(** This file will contain all pretty-printing for computorv1 *)

(** [deltap fmt delta] takes the delta of a given equation and based on its
    sign, prints the corresponding string *)
let deltap fmt delta =
  Format.fprintf fmt
    ( if delta > 0. then
        "Discriminant is strictly positive, the two solutions are:@."
      else if delta < 0. then
        "Discriminant is strictly negative, there is no solution with real \
         numbers:@."
      else
        "The solution is:@." )

(** [pow fmt n] takes in a power and pretty-prints it *)
let pow fmt (n : int) = Format.fprintf fmt "^%d" n

(** [var fmt (var, n)] takes in the optionnal part of a monome and prints it if
    needed *)
let var fmt = function
  | None -> ()
  | Some (x, n) ->
    if n = 0 then
      ()
    else if n = 1 then
      Format.fprintf fmt " * %s" x
    else
      Format.fprintf fmt " * %s%a" x pow n

(** [mono fmt (coef, var)] successively prints each element of the monome list *)
let mono fmt ((coefficient, variable) : Ast.monome) =
  Format.fprintf fmt "%g%a" coefficient var variable

(** [polyprint fmt (terms, variable)] takes a list of terms
    [(power:int * coefficient:float)] and the only variable present in the
    polynome and takes care of the pretty-printing *)
let polyprint fmt ((terms, variable) : (int * float) list * string) =
  let mk_var k =
    if variable = "" then
      None
    else
      Some (variable, k)
  in
  match terms with
  | [] -> Format.fprintf fmt "0"
  | (k, v) :: p ->
    mono fmt (v, mk_var k);
    List.iter
      (fun (k, v) ->
          Format.fprintf fmt "%s%a"
            ( if v >= 0. then
                " + "
              else
                " - " )
            mono
            (Float.abs v, mk_var k) )
      p

(** [equ fmt (polynome_l, polynome_r, var)] takes both sides of the equation as
    polynomes of type [(int * float)] list as well as the only variable present
    in the equation. The polynome is represented as such instead of a Ast.monome
    list because of the simplification undertaken in the Hashtable of type
    [(power:int coefficient:float)]. Sending an empty list will simply print
    [0], once again this obeys the printing specifications of the ComputorV1 42
    subject *)
let equ fmt
    ((polynome_l, polynome_r, var) :
       (int * float) list * (int * float) list * string ) =
  Format.fprintf fmt "%a = %a" polyprint (polynome_l, var) polyprint
    (polynome_r, var)
