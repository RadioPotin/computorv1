(function(globalThis)
   {"use strict";
    var
     runtime=globalThis.jsoo_runtime,
     caml_string_of_jsbytes=runtime.caml_string_of_jsbytes,
     caml_wrap_exception=runtime.caml_wrap_exception;
    function caml_call1(f,a0)
     {return f.length == 1?f(a0):runtime.caml_call_gen(f,[a0])}
    function caml_call2(f,a0,a1)
     {return f.length == 2?f(a0,a1):runtime.caml_call_gen(f,[a0,a1])}
    function caml_call3(f,a0,a1,a2)
     {return f.length == 3?f(a0,a1,a2):runtime.caml_call_gen(f,[a0,a1,a2])}
    function caml_call4(f,a0,a1,a2,a3)
     {return f.length == 4
              ?f(a0,a1,a2,a3)
              :runtime.caml_call_gen(f,[a0,a1,a2,a3])}
    var
     global_data=runtime.caml_get_global_data(),
     cst_Invalid_button=caml_string_of_jsbytes("Invalid button"),
     cst_Invalid_blockquote=caml_string_of_jsbytes("Invalid blockquote"),
     cst_Invalid_textarea=caml_string_of_jsbytes("Invalid textarea"),
     cst_Highest_degree_is_superior=
      caml_string_of_jsbytes
       ("Highest degree is superior to 2, please give a second degree equation."),
     cst_There_are_more_than_one_va=
      caml_string_of_jsbytes
       ("There are more than one variable in this equation, please give only one."),
     cst_There_is_an_unknown_token_=
      caml_string_of_jsbytes("There is an unknown token in this input."),
     cst_There_is_a_syntax_error_in=
      caml_string_of_jsbytes("There is a syntax error in this input."),
     Stdlib_format=global_data.Stdlib__format,
     Assert_failure=global_data.Assert_failure,
     Stdlib_buffer=global_data.Stdlib__buffer,
     Stdlib_string=global_data.Stdlib__string,
     Stdlib_lexing=global_data.Stdlib__lexing,
     Computor_Lexer=global_data.Computor__Lexer,
     Computor_Parser=global_data.Computor__Parser,
     Computor_Solver=global_data.Computor__Solver,
     Computor_Ast=global_data.Computor__Ast,
     Stdlib_printexc=global_data.Stdlib__printexc,
     Js_of_ocaml_Dom_html=global_data.Js_of_ocaml__Dom_html,
     Js_of_ocaml_Js=global_data.Js_of_ocaml__Js,
     _e_=[0,[2,0,[17,4,0]],caml_string_of_jsbytes("%s@.")],
     _f_=[0,caml_string_of_jsbytes("try/trycomputorv1.ml"),34,2],
     _d_=[0,[0,0],caml_string_of_jsbytes("%c")],
     _c_=
      [0,
       [11,caml_string_of_jsbytes("\n<br />"),0],
       caml_string_of_jsbytes("\n<br />")],
     _b_=[0,[15,0],caml_string_of_jsbytes("%a")],
     _a_=
      [0,
       [11,caml_string_of_jsbytes("ERROR: "),[2,0,0]],
       caml_string_of_jsbytes("ERROR: %s")];
    function result(s)
     {try
       {var
         _o_=caml_call2(Stdlib_lexing[3],0,s),
         ast=caml_call2(Computor_Parser[2],Computor_Lexer[2],_o_),
         polynomes=caml_call1(Computor_Solver[2],ast),
         _p_=caml_call3(Stdlib_format[130],_b_,Computor_Solver[4],polynomes);
        return _p_}
      catch(e)
       {e = caml_wrap_exception(e);
        if(e === Computor_Ast[2])return cst_Highest_degree_is_superior;
        if(e === Computor_Ast[3])return cst_There_are_more_than_one_va;
        if(e[1] === Computor_Ast[1])return cst_There_is_an_unknown_token_;
        if(e === Computor_Parser[1])return cst_There_is_a_syntax_error_in;
        var _n_=caml_call1(Stdlib_printexc[1],e);
        caml_call2(Stdlib_format[128],_a_,_n_);
        throw e}}
    function convert_newlines(s)
     {var
       buff=caml_call1(Stdlib_buffer[1],512),
       fmt=caml_call1(Stdlib_format[109],buff);
      function _m_(c)
       {return 10 === c
                ?caml_call2(Stdlib_format[126],fmt,_c_)
                :caml_call3(Stdlib_format[126],fmt,_d_,c)}
      caml_call2(Stdlib_string[19],_m_,s);
      caml_call2(Stdlib_format[36],fmt,0);
      return caml_call1(Stdlib_buffer[2],buff)}
    function error(s)
     {caml_call2(Stdlib_format[128],_e_,s);throw [0,Assert_failure,_f_]}
    var t2=Js_of_ocaml_Dom_html[8].document,text=t2.getElementById("textbox");
    function _g_(param){return error(cst_Invalid_textarea)}
    var
     t9=caml_call3(Js_of_ocaml_Js[45],text,Js_of_ocaml_Dom_html[117][55],_g_),
     t5=Js_of_ocaml_Dom_html[8].document,
     output=t5.getElementById("output");
    function _h_(param){return error(cst_Invalid_blockquote)}
    var
     t11=
      caml_call3(Js_of_ocaml_Js[45],output,Js_of_ocaml_Dom_html[117][6],_h_),
     t8=Js_of_ocaml_Dom_html[8].document,
     button=t8.getElementById("butn");
    function _i_(param){return error(cst_Invalid_button)}
    var
     button$0=
      caml_call3(Js_of_ocaml_Js[45],button,Js_of_ocaml_Dom_html[117][9],_i_),
     _j_=! ! 0;
    function _k_(param)
     {var
       t10=
        runtime.caml_jsstring_of_string
         (convert_newlines(result(runtime.caml_string_of_jsstring(t9.value))));
      t11.innerHTML = t10;
      return ! ! 1}
    var _l_=caml_call1(Js_of_ocaml_Dom_html[10],_k_);
    caml_call4
     (Js_of_ocaml_Dom_html[17],button$0,Js_of_ocaml_Dom_html[15][1],_l_,_j_);
    var
     Dune_exe_Trycomputorv1=
      [0,result,convert_newlines,error,t9,t11,button$0];
    runtime.caml_register_global
     (36,Dune_exe_Trycomputorv1,"Dune__exe__Trycomputorv1");
    return}
  (globalThis));

//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLjAsImZpbGUiOiIudHJ5Y29tcHV0b3J2MS5lb2Jqcy9ieXRlL2R1bmVfX2V4ZV9fVHJ5Y29tcHV0b3J2MS5jbW8uanMiLCJzb3VyY2VSb290IjoiIiwibmFtZXMiOlsicmVzdWx0IiwicyIsImFzdCIsInBvbHlub21lcyIsImUiLCJjb252ZXJ0X25ld2xpbmVzIiwiYnVmZiIsImZtdCIsImMiLCJlcnJvciIsInRleHQiLCJvdXRwdXQiLCJidXR0b24iLCJidXR0b24kMCJdLCJzb3VyY2VzIjpbIi9ob21lL3J1bm5lci93b3JrL2NvbXB1dG9ydjEvY29tcHV0b3J2MS9fYnVpbGQvZGVmYXVsdC90cnkvdHJ5Y29tcHV0b3J2MS5tbCJdLCJtYXBwaW5ncyI6Ijs7STs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7YUFJSUEsT0FBT0M7TUFDVDtRQUN3QzsyQ0FGL0JBO1NBRUc7U0FDTSx3Q0FEWkM7U0FFSix5REFESUM7O1lBU0pDOztpQ0FMQTtXQUtBQSxzQkFIQTtXQUdBQSx5QkFGa0I7V0FFbEJBLHlCQURnQjtRQUVXLHNDQUQzQkE7UUFDQTtjQURBQSxFQUVPO2FBRVBDLGlCQUFpQko7TUFDUjs7T0FDRCxrQ0FETks7TUFDTSxhQUlKRTtRQUZKLGNBRUlBO2lCQURRLDhCQUhWRDtpQkFJTyw4QkFKUEEsUUFJRUMsRUFBZ0M7TUFIdEMsaUNBSG1CUDtNQVFuQiw2QkFOSU07TUFNSixtQ0FQSUQsS0FRZ0I7YUFFbEJHLE1BQU1SO01BQ1Isa0NBRFFBLEdBQ1IsNEJBQ1k7NENBR1JTO3dCQUVBLGtDQUF3QjtJQUQ1QjtzQ0FESUE7O0tBS0FDO3dCQUlBLG9DQUEwQjtJQUQ5Qjs7b0NBSElBOztLQU9BQzt3QkFFQSxnQ0FBc0I7SUFEMUI7O29DQURJQTtLQVlBOztNQUhPOzs7VUFBYSxpQkFDVixPQUFxQzs7TUFDMUMsWUFBWTtJQUpqQjtJQURGOytCQVBBQztJQVFFOztTQW5ERmIsT0FnQkFLLGlCQVdBSSxhQWdCQUk7SUFPQTs7VSIsInNvdXJjZXNDb250ZW50IjpbIm9wZW4gSnNfb2Zfb2NhbWxcbm9wZW4gQ29tcHV0b3Jcbm9wZW4gQXN0XG5cbmxldCByZXN1bHQgcyA9XG4gIHRyeVxuICAgIGxldCBhc3QgPSBQYXJzZXIuZXF1YXRpb24gTGV4ZXIudG9rZW4gKExleGluZy5mcm9tX3N0cmluZyBzKSBpblxuICAgIGxldCBwb2x5bm9tZXMgPSBTb2x2ZXIuYXN0X3RvX2xpc3RzIGFzdCBpblxuICAgIEZvcm1hdC5hc3ByaW50ZiBcIiVhXCIgU29sdmVyLnNvbHZlIHBvbHlub21lc1xuICB3aXRoXG4gIHwgQmlnX2RlZ3JlZSAtPlxuICAgIFwiSGlnaGVzdCBkZWdyZWUgaXMgc3VwZXJpb3IgdG8gMiwgcGxlYXNlIGdpdmUgYSBzZWNvbmQgZGVncmVlIGVxdWF0aW9uLlwiXG4gIHwgVG9vX21hbnlfdmFyaWFibGVzIC0+XG4gICAgXCJUaGVyZSBhcmUgbW9yZSB0aGFuIG9uZSB2YXJpYWJsZSBpbiB0aGlzIGVxdWF0aW9uLCBwbGVhc2UgZ2l2ZSBvbmx5IG9uZS5cIlxuICB8IFN5bnRheF9lcnJvciBfIC0+IFwiVGhlcmUgaXMgYW4gdW5rbm93biB0b2tlbiBpbiB0aGlzIGlucHV0LlwiXG4gIHwgUGFyc2VyLkVycm9yIC0+IFwiVGhlcmUgaXMgYSBzeW50YXggZXJyb3IgaW4gdGhpcyBpbnB1dC5cIlxuICB8IGUgLT5cbiAgICBGb3JtYXQuZXByaW50ZiBcIkVSUk9SOiAlc1wiIChQcmludGV4Yy50b19zdHJpbmcgZSk7XG4gICAgcmFpc2UgZVxuXG5sZXQgY29udmVydF9uZXdsaW5lcyBzID1cbiAgbGV0IGJ1ZmYgPSBCdWZmZXIuY3JlYXRlIDUxMiBpblxuICBsZXQgZm10ID0gRm9ybWF0LmZvcm1hdHRlcl9vZl9idWZmZXIgYnVmZiBpblxuICBTdHJpbmcuaXRlclxuICAgIChmdW5jdGlvblxuICAgICAgfCAnXFxuJyAtPiBGb3JtYXQuZnByaW50ZiBmbXQgXCJcXG48YnIgLz5cIlxuICAgICAgfCBjIC0+IEZvcm1hdC5mcHJpbnRmIGZtdCBcIiVjXCIgYyApXG4gICAgcztcbiAgRm9ybWF0LnBwX3ByaW50X2ZsdXNoIGZtdCAoKTtcbiAgQnVmZmVyLmNvbnRlbnRzIGJ1ZmZcblxubGV0IGVycm9yIHMgPVxuICBGb3JtYXQuZXByaW50ZiBcIiVzQC5cIiBzO1xuICBhc3NlcnQgZmFsc2VcblxubGV0IHRleHRhcmVhID1cbiAgbGV0IHRleHQgPSBEb21faHRtbC53aW5kb3cjIy5kb2N1bWVudCMjZ2V0RWxlbWVudEJ5SWQgKEpzLnN0cmluZyBcInRleHRib3hcIikgaW5cbiAgSnMuY29lcmNlX29wdCB0ZXh0IERvbV9odG1sLkNvZXJjZVRvLnRleHRhcmVhIChmdW4gXyAtPlxuICAgICAgZXJyb3IgXCJJbnZhbGlkIHRleHRhcmVhXCIgKVxuXG5sZXQgYmxvY2txdW90ZSA9XG4gIGxldCBvdXRwdXQgPVxuICAgIERvbV9odG1sLndpbmRvdyMjLmRvY3VtZW50IyNnZXRFbGVtZW50QnlJZCAoSnMuc3RyaW5nIFwib3V0cHV0XCIpXG4gIGluXG4gIEpzLmNvZXJjZV9vcHQgb3V0cHV0IERvbV9odG1sLkNvZXJjZVRvLmJsb2NrcXVvdGUgKGZ1biBfIC0+XG4gICAgICBlcnJvciBcIkludmFsaWQgYmxvY2txdW90ZVwiIClcblxubGV0IGJ1dHRvbiA9XG4gIGxldCBidXR0b24gPSBEb21faHRtbC53aW5kb3cjIy5kb2N1bWVudCMjZ2V0RWxlbWVudEJ5SWQgKEpzLnN0cmluZyBcImJ1dG5cIikgaW5cbiAgSnMuY29lcmNlX29wdCBidXR0b24gRG9tX2h0bWwuQ29lcmNlVG8uYnV0dG9uIChmdW4gXyAtPlxuICAgICAgZXJyb3IgXCJJbnZhbGlkIGJ1dHRvblwiIClcblxubGV0ICgpID1cbiAgbGV0IF9pZCA9XG4gICAgRG9tX2h0bWwuYWRkRXZlbnRMaXN0ZW5lciBidXR0b24gRG9tX2h0bWwuRXZlbnQuY2xpY2tcbiAgICAgIChEb21faHRtbC5oYW5kbGVyIChmdW4gXyAtPlxuICAgICAgICAgICBibG9ja3F1b3RlIyMuaW5uZXJIVE1MIDo9XG4gICAgICAgICAgICAgSnMuc3RyaW5nIEBAIGNvbnZlcnRfbmV3bGluZXNcbiAgICAgICAgICAgICBAQCByZXN1bHQgKEpzLnRvX3N0cmluZyB0ZXh0YXJlYSMjLnZhbHVlKTtcbiAgICAgICAgICAgSnMuYm9vbCB0cnVlICkgKVxuICAgICAgKEpzLmJvb2wgZmFsc2UpXG4gIGluXG4gICgpXG4iXX0=
