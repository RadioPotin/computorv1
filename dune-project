(lang dune 2.8)

(using menhir 2.1)

(name computor)

(authors "Dario Pinto <laradiopotin@gmail.com>")

(maintainers "Dario Pinto <laradiopotin@gmail.com>")

(source
 (github RadioPotin/computorv1))

(generate_opam_files true)

(package
 (name computor)
 (synopsis "2nd Degree equation solver")
 (description
  "Functionnal programming project from the 42Paris computer engineering course. 2nd Degree equation solver.")
 (depends
  (ocaml
   (>= 4.08))
  (dune
   (>= 2.8))
  (menhir
   (>= 2.1))
  (js_of_ocaml
   (>= 3.9))
  (js_of_ocaml-ppx
   (and
    :build
    (>= 3.9)))
  (bisect_ppx
   (and
    :with-test
    (>= 2.6)
    :dev))))
