(* This file will contain all pretty-printing for computorv1 *)

open Ast

let reduced fmt (b, c, seen) =
  Format.fprintf fmt "Reduced form: ";
  let b =
    if Float.equal b 0. then
      None
    else
      Some b
  in
  let c =
    if Float.equal c 0. then
      None
    else
      Some c
  in
  let var =  Option.value !seen ~default:""
  in
  begin
    match b,c with
    | None, None -> Format.fprintf fmt "0 = 0@."
    | None, Some z -> Format.fprintf fmt "%g * %s^0 = 0@." z var
    | Some y, None -> Format.fprintf fmt "%g * %s^1 = 0@." y var
    | Some y, Some z -> Format.fprintf fmt "%g * %s^0 + %g * %s^1 = 0@." z var y var
  end

let smol_equa fmt b c seen =
  let s = Format.asprintf "%a" reduced (b, c, seen) in
  let sign = Str.regexp "\\+ -" in
  let str = Str.global_replace sign "- " s in
  Format.fprintf fmt "%s" str

let deltap fmt delta =
  Format.fprintf fmt (
    if delta > 0. then
      "Discriminant is strictly positive, the two solutions are:@."
    else if delta < 0. then
      "Discriminant is strictly negative, there is no solution with real numbers:@."
    else
      "The solution is:@."
  )

let polyprint fmt (terms, variable) =
  Format.fprintf fmt"Reduced form: ";
  let print_sign fmt l =
    match l with
    | [] -> ()
    | (_k, v)::_r ->
      if Float.compare 0. v > 0 then
        Format.fprintf fmt " - "
      else
        Format.fprintf fmt " + " in
  let rec reduce terms variable =
    begin
      match terms with
      | [] -> Format.fprintf fmt " = 0@."
      | (k, v)::[] ->
        if Float.compare 0. v > 0 then
          begin
            Format.fprintf fmt "%g * %s^%d" ~-.v variable k;
            reduce [] variable
          end
        else
          begin
            Format.fprintf fmt "%g * %s^%d" v variable k;
            reduce [] variable
          end
      | (k, v)::r ->
        if Float.compare 0. v > 0 then
          begin
            Format.fprintf fmt "%g * %s^%d" ~-.v variable k;
            print_sign fmt r;
            reduce r variable
          end
        else
          begin
            Format.fprintf fmt "%g * %s^%d" v variable k;
            print_sign fmt r;
            reduce r variable
          end
    end;
  in
  reduce terms variable

let pow fmt n =
  if n <> 1 then Format.fprintf fmt "^%d" n

let var fmt = function
  | None -> ()
  | Some (x, n) -> Format.fprintf fmt "%s%a" x pow n

let mono fmt (a, x) =
  Format.fprintf fmt "%g%a" a var x

let poly fmt = function
  | [] -> Format.fprintf fmt "0"
  | polynome -> Format.pp_print_list ~pp_sep:(fun fmt () -> Format.fprintf fmt " + ") mono fmt polynome

let equ fmt (left, right) =
  Format.fprintf fmt "@.%a = %a@." poly left poly right

let std (e : equation) =
  equ Format.std_formatter e
