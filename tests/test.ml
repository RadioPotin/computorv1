open OUnit2

let test_sanity _ =
    assert_equal 1 1 ~msg:"Custom error message"
let test_simple _ =
    assert_equal 1 1 ~msg:"Custom error message"

let suite =
  "student" >::: [
    "sanity" >:: test_sanity
  ]

let _ = run_test_tt_main suite
