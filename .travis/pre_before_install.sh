#!/usr/bin/env bash

pip install -r test_requirements.txt
./plugin-template --generate-config --plugin-app-label catdog pulp_catdog
mkdir ../pulp_catdog/.travis
touch ../pulp_catdog/.travis/test_bindings.py
echo 'pypi_username: the_pypi_user' >> ../pulp_catdog/template_config.yml
sed -i "s/test_s3: false/test_s3: true/g" ../pulp_catdog/template_config.yml
./plugin-template --all pulp_catdog
mv ../pulp_catdog/*.txt .
mv ../pulp_catdog/.travis/before_install.sh ../pulp_catdog/.travis/old_before_install.sh
mv ../pulp_catdog/.travis/* ./.travis/
