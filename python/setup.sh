#!bin/sh -eu

cd `dirname $0`

echo "--- Python setup start ---"

brew install python@${PYTHON_VERSION} && brew upgrade python@${PYTHON_VERSION} && python3 --version

pip3 install -Uq pip && pip3 --version
pip3 install -r requirements.txt && pip3 list
poetry completions zsh > $(brew --prefix)/share/zsh/site-functions/_poetry

python3 hello.py

echo "--- Python setup end ---"
