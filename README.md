# algs4

The working environment for the Algorithms text book.
Uses nix flakes to download the `algs4.jar` file and create `javac-algs4` and `java-algs4` commands with CLASSPATH variable which includes the `algs4.jar` and working directory.

# Installation

`nix` needs to be [installed](https://nixos.org/download/) with [flakes](https://zero-to-nix.com/concepts/flakes) enabled.
To enter the environment type
```
nix develop
```
First run might take some time to download the packages.
