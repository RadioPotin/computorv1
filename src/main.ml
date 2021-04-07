open Computor_lib

let main _argc _argv =
  Pp.std ([], []);
  Pp.std([(3, Some ("x", 2));(-4, Some("x", 1)); (7, None)], [(28,None)])

let () =
  main (Array.length Sys.argv) Sys.argv
