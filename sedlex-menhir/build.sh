# ocamlbuild -use-menhir -tag thread -use-ocamlfind -quiet -pkg menhirLib -pkg sedlex test.native

# menhir
menhir --ocamlc 'ocamlfind ocamlc -thread -package sedlex -package menhirLib' --explain --infer parser.mly
ocamlc -c parser.mli
ocamlc -c parser.ml
# sedlex
ocamlfind ocamlc -c -package sedlex.ppx lexer.ml
ocamlfind ocamlc -o calc -linkpkg -package sedlex -package menhirLib lexer.cmo parser.cmo calc.ml
