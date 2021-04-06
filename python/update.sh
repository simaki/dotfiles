#!bin/sh -eu

echo "--- pip update start ---"

pip list --format freeze | sed 's/==.*//g' | xargs pip install --upgrade --quiet
sed -i -n "s/__requires__ = 'pip==.*'/__requires__ = 'pip'/" `which pip3`

echo "--- pip update end ---"

echo "--- Jupyter update start ---"

jupyter labextension update --all --Application.log_level=40

echo "--- Jupyter update end ---"
