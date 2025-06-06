{
  lib,
  stdenv,
  autoreconfHook,
  fetchFromGitHub,
  pkg-config,
  talloc,
}:

stdenv.mkDerivation rec {
  pname = "libasn1c";
  version = "0.9.38";

  src = fetchFromGitHub {
    owner = "osmocom";
    repo = "libasn1c";
    rev = version;
    hash = "sha256-cnXcUvP6WwHVvpdsIVsMkizlLyg9KMwVj8XYX/nIfic=";
  };

  postPatch = ''
    echo "${version}" > .tarball-version
  '';

  nativeBuildInputs = [
    autoreconfHook
    pkg-config
  ];

  buildInputs = [
    talloc
  ];

  enableParallelBuilding = true;

  meta = with lib; {
    description = "Runtime library of Lev Walkin's asn1c split out as separate library";
    homepage = "https://github.com/osmocom/libasn1c/";
    license = licenses.bsd2;
    platforms = platforms.linux;
    maintainers = [ ];
  };
}
