{ pkgs }:

self: super:

with { inherit (pkgs.stdenv) lib; };

with pkgs.haskell.lib;

{
  vector-investigate = (
    with rec {
      vector-investigateSource = pkgs.lib.cleanSource ../.;
      vector-investigateBasic  = self.callCabal2nix "vector-investigate" vector-investigateSource { };
    };
    overrideCabal vector-investigateBasic (old: {
    })
  );
}
