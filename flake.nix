{
  description = "TeX stuff used at doma.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
  };

  outputs = { self, nixpkgs }: 
    let pkgs = nixpkgs.legacyPackages.x86_64-linux; in
  {

    defaultPakcage.x86_64-linux = pkgs.hello;
    devShell.x86_64-linux = pkgs.mkShell {
      name = "doma-tex";
      nativeBuildInputs = [
        (pkgs.texlive.withPackages (ps: [
            ps.scheme-basic
            ps.collection-luatex

            ps.texdoc

            ps.geometry
            ps.xcolor
            ps.babel # Language support for hyphenation etc.
            ps.lipsum
            ps.titlesec
            ps.fontspec
            ps.amsmath
        ]))
      ];
    };

  };
}
