with import <nixpkgs> {};
stdenv.mkDerivation {
  name = "constitution";
  src = ./latex;
  buildInputs = [
    (pkgs.texlive.combine {
      inherit (pkgs.texlive)
        paralist
        scheme-basic
        titlesec
      ;
    })
  ];
  phases = [ "unpackPhase" "buildPhase" "installPhase" ];
  buildPhase = ''
    flags="-halt-on-error -file-line-error -interaction=nonstopmode"
    pdflatex $flags -draftmode constitution.tex
    pdflatex $flags constitution.tex
  '';
  installPhase = ''
    install -D -m 0644 constitution.pdf -t $out
  '';
}
