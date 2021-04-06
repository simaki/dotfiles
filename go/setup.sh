#!bin/sh -eu

cd `dirname $0`

echo "--- Go setup start ---"

brew install go && go --version
go run hello.go

echo "--- Go setup end ---"
