(function(joo_global_object)
   {"use strict";
    var
     runtime=joo_global_object.jsoo_runtime,
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
     textarea=
      caml_call3(Js_of_ocaml_Js[49],text,Js_of_ocaml_Dom_html[117][55],_g_),
     t5=Js_of_ocaml_Dom_html[8].document,
     output=t5.getElementById("output");
    function _h_(param){return error(cst_Invalid_blockquote)}
    var
     blockquote=
      caml_call3(Js_of_ocaml_Js[49],output,Js_of_ocaml_Dom_html[117][6],_h_),
     t8=Js_of_ocaml_Dom_html[8].document,
     button=t8.getElementById("butn");
    function _i_(param){return error(cst_Invalid_button)}
    var
     button$0=
      caml_call3(Js_of_ocaml_Js[49],button,Js_of_ocaml_Dom_html[117][9],_i_),
     _j_=! ! 0;
    function _k_(param)
     {blockquote.innerHTML
      =
      runtime.caml_jsstring_of_string
       (convert_newlines
         (result(runtime.caml_string_of_jsstring(textarea.value))));
      return ! ! 1}
    var _l_=caml_call1(Js_of_ocaml_Dom_html[10],_k_);
    caml_call4
     (Js_of_ocaml_Dom_html[17],button$0,Js_of_ocaml_Dom_html[15][1],_l_,_j_);
    var
     Dune_exe_Trycomputorv1=
      [0,result,convert_newlines,error,textarea,blockquote,button$0];
    runtime.caml_register_global
     (36,Dune_exe_Trycomputorv1,"Dune__exe__Trycomputorv1");
    return}
  (function(){return this}()));

//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLjAsImZpbGUiOiIudHJ5Y29tcHV0b3J2MS5lb2Jqcy9ieXRlL2R1bmVfX2V4ZV9fVHJ5Y29tcHV0b3J2MS5jbW8uanMiLCJzb3VyY2VSb290IjoiIiwibmFtZXMiOlsicmVzdWx0IiwicyIsImFzdCIsInBvbHlub21lcyIsImUiLCJjb252ZXJ0X25ld2xpbmVzIiwiYnVmZiIsImZtdCIsImMiLCJlcnJvciIsInRleHQiLCJ0ZXh0YXJlYSIsIm91dHB1dCIsImJsb2NrcXVvdGUiLCJidXR0b24iLCJidXR0b24kMCJdLCJzb3VyY2VzIjpbIi9ob21lL3J1bm5lci93b3JrL2NvbXB1dG9ydjEvY29tcHV0b3J2MS9fYnVpbGQvZGVmYXVsdC90cnkvdHJ5Y29tcHV0b3J2MS5tbCJdLCJtYXBwaW5ncyI6Ijs7STs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7YUFJSUEsT0FBT0M7TUFDVDtRQUN3QzsyQ0FGL0JBO1NBRUc7U0FDTSx3Q0FEWkM7U0FFSix5REFESUM7O1lBU0pDOztpQ0FMQTtXQUtBQSxzQkFIQTtXQUdBQSx5QkFGa0I7V0FFbEJBLHlCQURnQjtRQUVXLHNDQUQzQkE7UUFDQTtjQURBQSxFQUVPO2FBRVBDLGlCQUFpQko7TUFDUjs7T0FDRCxrQ0FETks7TUFDTSxhQUlKRTtRQUZKLGNBRUlBO2lCQURRLDhCQUhWRDtpQkFJTyw4QkFKUEEsUUFJRUMsRUFBZ0M7TUFIdEMsaUNBSG1CUDtNQVFuQiw2QkFOSU07TUFNSixtQ0FQSUQsS0FRZ0I7YUFFbEJHLE1BQU1SO01BQ1Isa0NBRFFBLEdBQ1IsNEJBQ1k7NENBR1JTO3dCQUVBLGtDQUF3QjtJQUQ1Qjs7b0NBRElBOztLQUtBRTt3QkFJQSxvQ0FBMEI7SUFEOUI7O29DQUhJQTs7S0FPQUU7d0JBRUEsZ0NBQXNCO0lBRDFCOztvQ0FESUE7S0FZQTs7TTs7TUFITztRQUFhO1VBQ1YsT0FBcUMsZ0NBdkJqREg7TUF3Qk8sWUFBWTtJQUpqQjtJQURGOytCQVBBSTtJQVFFOztTQW5ERmYsT0FnQkFLLGlCQVdBSSxNQUlBRSxTQUtBRSxXQU9BRTtJQU9BOztVIiwic291cmNlc0NvbnRlbnQiOlsib3BlbiBKc19vZl9vY2FtbFxub3BlbiBDb21wdXRvclxub3BlbiBBc3RcblxubGV0IHJlc3VsdCBzID1cbiAgdHJ5XG4gICAgbGV0IGFzdCA9IFBhcnNlci5lcXVhdGlvbiBMZXhlci50b2tlbiAoTGV4aW5nLmZyb21fc3RyaW5nIHMpIGluXG4gICAgbGV0IHBvbHlub21lcyA9IFNvbHZlci5hc3RfdG9fbGlzdHMgYXN0IGluXG4gICAgRm9ybWF0LmFzcHJpbnRmIFwiJWFcIiBTb2x2ZXIuc29sdmUgcG9seW5vbWVzXG4gIHdpdGhcbiAgfCBCaWdfZGVncmVlIC0+XG4gICAgXCJIaWdoZXN0IGRlZ3JlZSBpcyBzdXBlcmlvciB0byAyLCBwbGVhc2UgZ2l2ZSBhIHNlY29uZCBkZWdyZWUgZXF1YXRpb24uXCJcbiAgfCBUb29fbWFueV92YXJpYWJsZXMgLT5cbiAgICBcIlRoZXJlIGFyZSBtb3JlIHRoYW4gb25lIHZhcmlhYmxlIGluIHRoaXMgZXF1YXRpb24sIHBsZWFzZSBnaXZlIG9ubHkgb25lLlwiXG4gIHwgU3ludGF4X2Vycm9yIF8gLT4gXCJUaGVyZSBpcyBhbiB1bmtub3duIHRva2VuIGluIHRoaXMgaW5wdXQuXCJcbiAgfCBQYXJzZXIuRXJyb3IgLT4gXCJUaGVyZSBpcyBhIHN5bnRheCBlcnJvciBpbiB0aGlzIGlucHV0LlwiXG4gIHwgZSAtPlxuICAgIEZvcm1hdC5lcHJpbnRmIFwiRVJST1I6ICVzXCIgKFByaW50ZXhjLnRvX3N0cmluZyBlKTtcbiAgICByYWlzZSBlXG5cbmxldCBjb252ZXJ0X25ld2xpbmVzIHMgPVxuICBsZXQgYnVmZiA9IEJ1ZmZlci5jcmVhdGUgNTEyIGluXG4gIGxldCBmbXQgPSBGb3JtYXQuZm9ybWF0dGVyX29mX2J1ZmZlciBidWZmIGluXG4gIFN0cmluZy5pdGVyXG4gICAgKGZ1bmN0aW9uXG4gICAgICB8ICdcXG4nIC0+IEZvcm1hdC5mcHJpbnRmIGZtdCBcIlxcbjxiciAvPlwiXG4gICAgICB8IGMgLT4gRm9ybWF0LmZwcmludGYgZm10IFwiJWNcIiBjIClcbiAgICBzO1xuICBGb3JtYXQucHBfcHJpbnRfZmx1c2ggZm10ICgpO1xuICBCdWZmZXIuY29udGVudHMgYnVmZlxuXG5sZXQgZXJyb3IgcyA9XG4gIEZvcm1hdC5lcHJpbnRmIFwiJXNALlwiIHM7XG4gIGFzc2VydCBmYWxzZVxuXG5sZXQgdGV4dGFyZWEgPVxuICBsZXQgdGV4dCA9IERvbV9odG1sLndpbmRvdyMjLmRvY3VtZW50IyNnZXRFbGVtZW50QnlJZCAoSnMuc3RyaW5nIFwidGV4dGJveFwiKSBpblxuICBKcy5jb2VyY2Vfb3B0IHRleHQgRG9tX2h0bWwuQ29lcmNlVG8udGV4dGFyZWEgKGZ1biBfIC0+XG4gICAgICBlcnJvciBcIkludmFsaWQgdGV4dGFyZWFcIiApXG5cbmxldCBibG9ja3F1b3RlID1cbiAgbGV0IG91dHB1dCA9XG4gICAgRG9tX2h0bWwud2luZG93IyMuZG9jdW1lbnQjI2dldEVsZW1lbnRCeUlkIChKcy5zdHJpbmcgXCJvdXRwdXRcIilcbiAgaW5cbiAgSnMuY29lcmNlX29wdCBvdXRwdXQgRG9tX2h0bWwuQ29lcmNlVG8uYmxvY2txdW90ZSAoZnVuIF8gLT5cbiAgICAgIGVycm9yIFwiSW52YWxpZCBibG9ja3F1b3RlXCIgKVxuXG5sZXQgYnV0dG9uID1cbiAgbGV0IGJ1dHRvbiA9IERvbV9odG1sLndpbmRvdyMjLmRvY3VtZW50IyNnZXRFbGVtZW50QnlJZCAoSnMuc3RyaW5nIFwiYnV0blwiKSBpblxuICBKcy5jb2VyY2Vfb3B0IGJ1dHRvbiBEb21faHRtbC5Db2VyY2VUby5idXR0b24gKGZ1biBfIC0+XG4gICAgICBlcnJvciBcIkludmFsaWQgYnV0dG9uXCIgKVxuXG5sZXQgKCkgPVxuICBsZXQgX2lkID1cbiAgICBEb21faHRtbC5hZGRFdmVudExpc3RlbmVyIGJ1dHRvbiBEb21faHRtbC5FdmVudC5jbGlja1xuICAgICAgKERvbV9odG1sLmhhbmRsZXIgKGZ1biBfIC0+XG4gICAgICAgICAgIGJsb2NrcXVvdGUjIy5pbm5lckhUTUwgOj1cbiAgICAgICAgICAgICBKcy5zdHJpbmcgQEAgY29udmVydF9uZXdsaW5lc1xuICAgICAgICAgICAgIEBAIHJlc3VsdCAoSnMudG9fc3RyaW5nIHRleHRhcmVhIyMudmFsdWUpO1xuICAgICAgICAgICBKcy5ib29sIHRydWUgKSApXG4gICAgICAoSnMuYm9vbCBmYWxzZSlcbiAgaW5cbiAgKClcbiJdfQ==
