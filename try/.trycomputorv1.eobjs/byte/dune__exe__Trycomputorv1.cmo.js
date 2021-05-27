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
     cst_Highest_degree_is_superior=
      caml_string_of_jsbytes
       ("Highest degree is superior to 2, please give a second degree equation."),
     cst_There_are_more_than_one_va=
      caml_string_of_jsbytes
       ("There are more than one variable in this equation, please give only one."),
     cst_There_is_a_syntax_error_in=
      caml_string_of_jsbytes("There is a syntax error in this input."),
     cst_There_is_an_unknown_token_=
      caml_string_of_jsbytes("There is an unknown token in this input."),
     cst_Invalid_button=caml_string_of_jsbytes("Invalid button"),
     cst_Invalid_blockquote=caml_string_of_jsbytes("Invalid blockquote"),
     cst_Invalid_textarea=caml_string_of_jsbytes("Invalid textarea"),
     Stdlib_format=global_data.Stdlib__format,
     Stdlib_buffer=global_data.Stdlib__buffer,
     Stdlib_string=global_data.Stdlib__string,
     Stdlib_lexing=global_data.Stdlib__lexing,
     Computor_Lexer=global_data.Computor__Lexer,
     Computor_Parser=global_data.Computor__Parser,
     Computor_Solver=global_data.Computor__Solver,
     Computor_Ast=global_data.Computor__Ast,
     Assert_failure=global_data.Assert_failure,
     Js_of_ocaml_Dom_html=global_data.Js_of_ocaml__Dom_html,
     Js_of_ocaml_Js=global_data.Js_of_ocaml__Js,
     _h_=[0,[0,0],caml_string_of_jsbytes("%c")],
     _g_=
      [0,
       [11,caml_string_of_jsbytes("\n<br />"),0],
       caml_string_of_jsbytes("\n<br />")],
     _f_=[0,[15,0],caml_string_of_jsbytes("%a")],
     _a_=[0,[2,0,[17,4,0]],caml_string_of_jsbytes("%s@.")],
     _b_=[0,caml_string_of_jsbytes("try/trycomputorv1.ml"),7,2];
    function error(s)
     {caml_call2(Stdlib_format[128],_a_,s);throw [0,Assert_failure,_b_]}
    var t2=Js_of_ocaml_Dom_html[8].document,text=t2.getElementById("textbox");
    function _c_(param){return error(cst_Invalid_textarea)}
    var
     textarea=
      caml_call3(Js_of_ocaml_Js[49],text,Js_of_ocaml_Dom_html[117][55],_c_),
     t5=Js_of_ocaml_Dom_html[8].document,
     output=t5.getElementById("output");
    function _d_(param){return error(cst_Invalid_blockquote)}
    var
     blockquote=
      caml_call3(Js_of_ocaml_Js[49],output,Js_of_ocaml_Dom_html[117][6],_d_),
     t8=Js_of_ocaml_Dom_html[8].document,
     button=t8.getElementById("butn");
    function _e_(param){return error(cst_Invalid_button)}
    var
     button$0=
      caml_call3(Js_of_ocaml_Js[49],button,Js_of_ocaml_Dom_html[117][9],_e_);
    function result(s)
     {try
       {var
         _m_=runtime.caml_string_of_jsstring(s),
         _n_=caml_call2(Stdlib_lexing[3],0,_m_),
         ast=caml_call2(Computor_Parser[2],Computor_Lexer[2],_n_),
         polynomes=caml_call1(Computor_Solver[2],ast),
         _o_=caml_call3(Stdlib_format[130],_f_,Computor_Solver[4],polynomes);
        return _o_}
      catch(_p_)
       {_p_ = caml_wrap_exception(_p_);
        if(_p_ === Computor_Ast[2])return cst_Highest_degree_is_superior;
        if(_p_ === Computor_Ast[3])return cst_There_are_more_than_one_va;
        if(_p_[1] === Computor_Ast[1])return cst_There_is_a_syntax_error_in;
        if(_p_ === Computor_Parser[1])return cst_There_is_an_unknown_token_;
        throw _p_}}
    function convert_newlines(s)
     {var
       buff=caml_call1(Stdlib_buffer[1],512),
       fmt=caml_call1(Stdlib_format[109],buff);
      function _l_(c)
       {return 10 === c
                ?caml_call2(Stdlib_format[126],fmt,_g_)
                :caml_call3(Stdlib_format[126],fmt,_h_,c)}
      caml_call2(Stdlib_string[19],_l_,s);
      return caml_call1(Stdlib_buffer[2],buff)}
    var _i_=! ! 0;
    function _j_(param)
     {blockquote.innerHTML
      =
      runtime.caml_jsstring_of_string
       (convert_newlines(result(textarea.value)));
      return ! ! 1}
    var _k_=caml_call1(Js_of_ocaml_Dom_html[10],_j_);
    caml_call4
     (Js_of_ocaml_Dom_html[17],button$0,Js_of_ocaml_Dom_html[15][1],_k_,_i_);
    var
     Dune_exe_Trycomputorv1=
      [0,error,textarea,blockquote,button$0,result,convert_newlines];
    runtime.caml_register_global
     (34,Dune_exe_Trycomputorv1,"Dune__exe__Trycomputorv1");
    return}
  (function(){return this}()));

//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLjAsImZpbGUiOiIudHJ5Y29tcHV0b3J2MS5lb2Jqcy9ieXRlL2R1bmVfX2V4ZV9fVHJ5Y29tcHV0b3J2MS5jbW8uanMiLCJzb3VyY2VSb290IjoiIiwibmFtZXMiOlsiZXJyb3IiLCJzIiwidGV4dCIsInRleHRhcmVhIiwib3V0cHV0IiwiYmxvY2txdW90ZSIsImJ1dHRvbiIsImJ1dHRvbiQwIiwicmVzdWx0IiwiYXN0IiwicG9seW5vbWVzIiwiY29udmVydF9uZXdsaW5lcyIsImJ1ZmYiLCJmbXQiLCJjIl0sInNvdXJjZXMiOlsiL2hvbWUvcnVubmVyL3dvcmsvY29tcHV0b3J2MS9jb21wdXRvcnYxL19idWlsZC9kZWZhdWx0L3RyeS90cnljb21wdXRvcnYxLm1sIl0sIm1hcHBpbmdzIjoiOztJOzs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7YUFJSUEsTUFBTUM7TUFDUixrQ0FEUUEsR0FDUiw0QkFDWTs0Q0FHUkM7d0JBRUEsa0NBQXdCO0lBRDVCOztvQ0FESUE7O0tBS0FFO3dCQUlBLG9DQUEwQjtJQUQ5Qjs7b0NBSElBOztLQU9BRTt3QkFFQSxnQ0FBc0I7SUFEMUI7S0FGRUM7TUFFRiw4QkFESUQ7SUFDSixTQUdFRSxPQUFPUDtNQUNUO1FBRW9EOzZDQUgzQ0E7U0FHdUI7U0FBNUI7U0FFYyx3Q0FIWlE7U0FJSix5REFESUM7Ozs7bUNBSUo7bUNBRUE7c0NBQ2tCO3NDQUNGO1FBZmQsVUFld0Q7SUFoQjVELFNBa0JFQyxpQkFBaUJWO01BQ1I7O09BQ0Qsa0NBRE5XO01BQ00sYUFJSkU7UUFGSixjQUVJQTtpQkFEUSw4QkFIVkQ7aUJBSU8sOEJBSlBBLFFBSUVDLEVBQWdDO01BSHRDLGlDQUhtQmI7TUFHbkIsbUNBRklXLEtBT2dCO0lBU2hCOztNOztNQUY2RDtRQUE1QyxpQkFBa0IsT0EvQ3JDVDtNQWdETyxZQUFZO0lBSGpCO0lBREY7K0JBaENBSTtJQWlDRTs7U0FqREZQLE1BSUFHLFNBS0FFLFdBT0FFLFNBS0FDLE9BZUFHO0lBWUE7O1UiLCJzb3VyY2VzQ29udGVudCI6WyJvcGVuIEpzX29mX29jYW1sXG5vcGVuIENvbXB1dG9yXG5vcGVuIEFzdFxuXG5sZXQgZXJyb3IgcyA9XG4gIEZvcm1hdC5lcHJpbnRmIFwiJXNALlwiIHM7XG4gIGFzc2VydCBmYWxzZVxuXG5sZXQgdGV4dGFyZWEgPVxuICBsZXQgdGV4dCA9IERvbV9odG1sLndpbmRvdyMjLmRvY3VtZW50IyNnZXRFbGVtZW50QnlJZCAoSnMuc3RyaW5nIFwidGV4dGJveFwiKSBpblxuICBKcy5jb2VyY2Vfb3B0IHRleHQgRG9tX2h0bWwuQ29lcmNlVG8udGV4dGFyZWEgKGZ1biBfIC0+XG4gICAgICBlcnJvciBcIkludmFsaWQgdGV4dGFyZWFcIiApXG5cbmxldCBibG9ja3F1b3RlID1cbiAgbGV0IG91dHB1dCA9XG4gICAgRG9tX2h0bWwud2luZG93IyMuZG9jdW1lbnQjI2dldEVsZW1lbnRCeUlkIChKcy5zdHJpbmcgXCJvdXRwdXRcIilcbiAgaW5cbiAgSnMuY29lcmNlX29wdCBvdXRwdXQgRG9tX2h0bWwuQ29lcmNlVG8uYmxvY2txdW90ZSAoZnVuIF8gLT5cbiAgICAgIGVycm9yIFwiSW52YWxpZCBibG9ja3F1b3RlXCIgKVxuXG5sZXQgYnV0dG9uID1cbiAgbGV0IGJ1dHRvbiA9IERvbV9odG1sLndpbmRvdyMjLmRvY3VtZW50IyNnZXRFbGVtZW50QnlJZCAoSnMuc3RyaW5nIFwiYnV0blwiKSBpblxuICBKcy5jb2VyY2Vfb3B0IGJ1dHRvbiBEb21faHRtbC5Db2VyY2VUby5idXR0b24gKGZ1biBfIC0+XG4gICAgICBlcnJvciBcIkludmFsaWQgYnV0dG9uXCIgKVxuXG5sZXQgcmVzdWx0IHMgPVxuICB0cnlcbiAgICBsZXQgYXN0ID1cbiAgICAgIFBhcnNlci5lcXVhdGlvbiBMZXhlci50b2tlbiAoTGV4aW5nLmZyb21fc3RyaW5nIChKcy50b19zdHJpbmcgcykpXG4gICAgaW5cbiAgICBsZXQgcG9seW5vbWVzID0gU29sdmVyLmFzdF90b19saXN0cyBhc3QgaW5cbiAgICBGb3JtYXQuYXNwcmludGYgXCIlYVwiIFNvbHZlci5zb2x2ZSBwb2x5bm9tZXNcbiAgd2l0aFxuICB8IEJpZ19kZWdyZWUgLT5cbiAgICBcIkhpZ2hlc3QgZGVncmVlIGlzIHN1cGVyaW9yIHRvIDIsIHBsZWFzZSBnaXZlIGEgc2Vjb25kIGRlZ3JlZSBlcXVhdGlvbi5cIlxuICB8IFRvb19tYW55X3ZhcmlhYmxlcyAtPlxuICAgIFwiVGhlcmUgYXJlIG1vcmUgdGhhbiBvbmUgdmFyaWFibGUgaW4gdGhpcyBlcXVhdGlvbiwgcGxlYXNlIGdpdmUgb25seSBvbmUuXCJcbiAgfCBTeW50YXhfZXJyb3IgXyAtPiBcIlRoZXJlIGlzIGEgc3ludGF4IGVycm9yIGluIHRoaXMgaW5wdXQuXCJcbiAgfCBQYXJzZXIuRXJyb3IgLT4gXCJUaGVyZSBpcyBhbiB1bmtub3duIHRva2VuIGluIHRoaXMgaW5wdXQuXCJcblxubGV0IGNvbnZlcnRfbmV3bGluZXMgcyA9XG4gIGxldCBidWZmID0gQnVmZmVyLmNyZWF0ZSA1MTIgaW5cbiAgbGV0IGZtdCA9IEZvcm1hdC5mb3JtYXR0ZXJfb2ZfYnVmZmVyIGJ1ZmYgaW5cbiAgU3RyaW5nLml0ZXJcbiAgICAoZnVuY3Rpb25cbiAgICAgIHwgJ1xcbicgLT4gRm9ybWF0LmZwcmludGYgZm10IFwiXFxuPGJyIC8+XCJcbiAgICAgIHwgYyAtPiBGb3JtYXQuZnByaW50ZiBmbXQgXCIlY1wiIGMgKVxuICAgIHM7XG4gIEJ1ZmZlci5jb250ZW50cyBidWZmXG5cbmxldCAoKSA9XG4gIGxldCBfaWQgPVxuICAgIERvbV9odG1sLmFkZEV2ZW50TGlzdGVuZXIgYnV0dG9uIERvbV9odG1sLkV2ZW50LmNsaWNrXG4gICAgICAoRG9tX2h0bWwuaGFuZGxlciAoZnVuIF8gLT5cbiAgICAgICAgICAgYmxvY2txdW90ZSMjLmlubmVySFRNTCA6PVxuICAgICAgICAgICAgIEpzLnN0cmluZyAoY29udmVydF9uZXdsaW5lcyAocmVzdWx0IHRleHRhcmVhIyMudmFsdWUpKTtcbiAgICAgICAgICAgSnMuYm9vbCB0cnVlICkgKVxuICAgICAgKEpzLmJvb2wgZmFsc2UpXG4gIGluXG4gICgpXG4iXX0=
