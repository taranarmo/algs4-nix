{ pkgs, fetchurl }:

pkgs.stdenv.mkDerivation {
  pname = "algs4";
  version = "1.0";

  src = fetchurl {
    url = "http://algs4.cs.princeton.edu/code/algs4.jar";
    sha256 = "sha256-f8MiP2XKeGsd8U1XBvzW6rFtyJE8V88VZ/Pj+tCR9XE=";
  };
  phases = [ "installPhase" ];

  installPhase = ''
    mkdir -p $out/share/java
    cp $src $out/share/java/algs4.jar

    mkdir -p $out/bin

    cat > $out/bin/javac-algs4 <<EOF
    #!/bin/sh
    exec javac -cp $out/share/java/algs4.jar:. "\$@"
    EOF

    cat > $out/bin/java-algs4 <<EOF
    #!/bin/sh
    exec java -cp $out/share/java/algs4.jar:. "\$@"
    EOF

    chmod +x $out/bin/java-algs4
    chmod +x $out/bin/javac-algs4
  '';

  meta = with pkgs.lib; {
    description = "Algorithms, Part I from Princeton University";
    license = licenses.mit;
    platforms = platforms.unix;
  };
}
