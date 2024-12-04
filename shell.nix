{
  pkgs ? import <nixpkgs> { },
}:
with pkgs;
let
  format =
    writeShellScriptBin "format" # sh
      ''
        ${lib.getExe nodePackages.prettier} --write ./*.html
      '';
in

mkShell {
  packages = [
    format
    nodePackages.prettier
  ];
}
