#!bin/sh -eu

echo '--- start Python update ---'

pip list --format freeze | sed 's/==.*//g' | xargs pip install --upgrade --quiet
# sed -i -n "s/__requires__ = 'pip==.*'/__requires__ = 'pip'/" `which pip3`
jupyter labextension update --all --Application.log_level=40

echo '--- end Python update ---'
