#!/bin/sh -eu

echo '--- setup Rust start ---'

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustc hello.rs && ./hello && rm ./hello
ln -fs $HOME/dotfiles/rust/rustrun /usr/local/bin

echo '--- setup Rust end ---'
