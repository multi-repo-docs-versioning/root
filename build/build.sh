#!/bin/bash
shopt -s extglob
git config user.name "adibrastegarnia"
git config user.email "arastega@purdue.edu"
git remote add gh-token "https://${GH_TOKEN}@github.com/multi-repo-docs-versioning/root.git";
git fetch gh-token && git fetch gh-token gh-pages:gh-pages;
CURRENT_PATH=$PWD
cd $CURRENT_PATH
mkdocs gh-deploy -v --clean --remote-name gh-token;
