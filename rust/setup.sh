#!/bin/sh -eu

echo '--- setup Rust start ---'

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustc hello.rs && ./hello && rm ./hello

echo '--- setup Rust end ---'
