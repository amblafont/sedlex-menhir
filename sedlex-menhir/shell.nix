# https://discourse.nixos.org/t/how-do-i-build-a-nix-shell-which-depends-on-some-unstable-packages/928/2
let
# for sedlex_2
  unstable =
# <nixos-unstable> {} ;
     import (fetchTarball https://nixos.org/channels/nixos-unstable/nixexprs.tar.xz) { };
in
{ nixpkgs ? import <nixpkgs> {} }:
with nixpkgs; mkShell {
  buildInputs = [ unstable.ocaml unstable.ocamlPackages.findlib unstable.ocamlPackages.menhir 
     unstable.ocamlPackages.sedlex_2 ];
}
