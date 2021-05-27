(function(joo_global_object)
   {"use strict";
    var
     runtime=joo_global_object.jsoo_runtime,
     caml_string_of_jsbytes=runtime.caml_string_of_jsbytes;
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
     Computor_Try_utils=global_data.Computor__Try_utils,
     Stdlib_format=global_data.Stdlib__format,
     Assert_failure=global_data.Assert_failure,
     Js_of_ocaml_Dom_html=global_data.Js_of_ocaml__Dom_html,
     Js_of_ocaml_Js=global_data.Js_of_ocaml__Js,
     _a_=[0,[2,0,[17,4,0]],caml_string_of_jsbytes("%s@.")],
     _b_=[0,caml_string_of_jsbytes("try/trycomputorv1.ml"),6,2];
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
      caml_call3(Js_of_ocaml_Js[49],button,Js_of_ocaml_Dom_html[117][9],_e_),
     _f_=! ! 0;
    function _g_(param)
     {var
       _i_=runtime.caml_string_of_jsstring(textarea.value),
       _j_=caml_call1(Computor_Try_utils[1],_i_);
      blockquote.innerHTML
      =
      runtime.caml_jsstring_of_string(caml_call1(Computor_Try_utils[2],_j_));
      return ! ! 1}
    var _h_=caml_call1(Js_of_ocaml_Dom_html[10],_g_);
    caml_call4
     (Js_of_ocaml_Dom_html[17],button$0,Js_of_ocaml_Dom_html[15][1],_h_,_f_);
    var Dune_exe_Trycomputorv1=[0,error,textarea,blockquote,button$0];
    runtime.caml_register_global
     (21,Dune_exe_Trycomputorv1,"Dune__exe__Trycomputorv1");
    return}
  (function(){return this}()));

//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLjAsImZpbGUiOiIudHJ5Y29tcHV0b3J2MS5lb2Jqcy9ieXRlL2R1bmVfX2V4ZV9fVHJ5Y29tcHV0b3J2MS5jbW8uanMiLCJzb3VyY2VSb290IjoiIiwibmFtZXMiOlsiZXJyb3IiLCJzIiwidGV4dCIsInRleHRhcmVhIiwib3V0cHV0IiwiYmxvY2txdW90ZSIsImJ1dHRvbiIsImJ1dHRvbiQwIl0sInNvdXJjZXMiOlsiL2hvbWUvcnVubmVyL3dvcmsvY29tcHV0b3J2MS9jb21wdXRvcnYxL19idWlsZC9kZWZhdWx0L3RyeS90cnljb21wdXRvcnYxLm1sIl0sIm1hcHBpbmdzIjoiOztJOzs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7O2FBR0lBLE1BQU1DO01BQ1Isa0NBRFFBLEdBQ1IsNEJBQ1k7NENBR1JDO3dCQUVBLGtDQUF3QjtJQUQ1Qjs7b0NBRElBOztLQUtBRTt3QkFJQSxvQ0FBMEI7SUFEOUI7O29DQUhJQTs7S0FPQUU7d0JBRUEsZ0NBQXNCO0lBRDFCOztvQ0FESUE7S0FZQTs7TUFGeUQ7MkNBdkIzREg7T0F1Qlk7TUFsQlpFOztNQWlCUyxnQ0FBYTtNQUVmLFlBQVk7SUFKakI7SUFERjsrQkFQQUU7SUFRRSw4QkF4QkZQLE1BSUFHLFNBS0FFLFdBT0FFO0lBT0E7O1UiLCJzb3VyY2VzQ29udGVudCI6WyJvcGVuIEpzX29mX29jYW1sXG5vcGVuIENvbXB1dG9yXG5cbmxldCBlcnJvciBzID1cbiAgRm9ybWF0LmVwcmludGYgXCIlc0AuXCIgcztcbiAgYXNzZXJ0IGZhbHNlXG5cbmxldCB0ZXh0YXJlYSA9XG4gIGxldCB0ZXh0ID0gRG9tX2h0bWwud2luZG93IyMuZG9jdW1lbnQjI2dldEVsZW1lbnRCeUlkIChKcy5zdHJpbmcgXCJ0ZXh0Ym94XCIpIGluXG4gIEpzLmNvZXJjZV9vcHQgdGV4dCBEb21faHRtbC5Db2VyY2VUby50ZXh0YXJlYSAoZnVuIF8gLT5cbiAgICAgIGVycm9yIFwiSW52YWxpZCB0ZXh0YXJlYVwiIClcblxubGV0IGJsb2NrcXVvdGUgPVxuICBsZXQgb3V0cHV0ID1cbiAgICBEb21faHRtbC53aW5kb3cjIy5kb2N1bWVudCMjZ2V0RWxlbWVudEJ5SWQgKEpzLnN0cmluZyBcIm91dHB1dFwiKVxuICBpblxuICBKcy5jb2VyY2Vfb3B0IG91dHB1dCBEb21faHRtbC5Db2VyY2VUby5ibG9ja3F1b3RlIChmdW4gXyAtPlxuICAgICAgZXJyb3IgXCJJbnZhbGlkIGJsb2NrcXVvdGVcIiApXG5cbmxldCBidXR0b24gPVxuICBsZXQgYnV0dG9uID0gRG9tX2h0bWwud2luZG93IyMuZG9jdW1lbnQjI2dldEVsZW1lbnRCeUlkIChKcy5zdHJpbmcgXCJidXRuXCIpIGluXG4gIEpzLmNvZXJjZV9vcHQgYnV0dG9uIERvbV9odG1sLkNvZXJjZVRvLmJ1dHRvbiAoZnVuIF8gLT5cbiAgICAgIGVycm9yIFwiSW52YWxpZCBidXR0b25cIiApXG5cbmxldCAoKSA9XG4gIGxldCBfaWQgPVxuICAgIERvbV9odG1sLmFkZEV2ZW50TGlzdGVuZXIgYnV0dG9uIERvbV9odG1sLkV2ZW50LmNsaWNrXG4gICAgICAoRG9tX2h0bWwuaGFuZGxlciAoZnVuIF8gLT5cbiAgICAgICAgICAgYmxvY2txdW90ZSMjLmlubmVySFRNTCA6PVxuICAgICAgICAgICAgIEpzLnN0cmluZyBAQCBUcnlfdXRpbHMuY29udmVydF9uZXdsaW5lc1xuICAgICAgICAgICAgIEBAIFRyeV91dGlscy5yZXN1bHQgKEpzLnRvX3N0cmluZyB0ZXh0YXJlYSMjLnZhbHVlKTtcbiAgICAgICAgICAgSnMuYm9vbCB0cnVlICkgKVxuICAgICAgKEpzLmJvb2wgZmFsc2UpXG4gIGluXG4gICgpXG4iXX0=
