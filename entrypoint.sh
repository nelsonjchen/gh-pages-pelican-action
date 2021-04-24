#!/bin/bash

set -e

echo "REPO: $GITHUB_REPOSITORY"
echo "ACTOR: $GITHUB_ACTOR"

remote_repo="https://x-access-token:${GITHUB_TOKEN}@github.com/${GITHUB_REPOSITORY}.git"
remote_branch=${GH_PAGES_BRANCH:=gh-pages}

echo 'Installing Python Requirements 🐍 '
pip install -r requirements.txt

if [ -n "$PELICAN_THEME_FOLDER" ]; then
    echo 'Installing Node Modules 🧰 '
    pushd $PELICAN_THEME_FOLDER
    npm install
    popd
fi

echo 'Building site 👷 '
pelican ${PELICAN_CONTENT_FOLDER:=content} -o output -s ${PELICAN_CONFIG_FILE:=pelicanconf.py}

echo 'Publishing to GitHub Pages 📤 '
pushd output
git init
git remote add deploy "$remote_repo"
git checkout $remote_branch || git checkout --orphan $remote_branch
git config user.name "${GITHUB_ACTOR}"
git config user.email "${GITHUB_ACTOR}@users.noreply.github.com"
git add .

echo -n 'Files to Commit:' && ls -l | wc -l
git commit -m "[ci skip] Automated deployment to GitHub Pages on $(date +%s%3N)"
git push deploy $remote_branch --force
rm -fr .git
popd

echo 'Done 🎉🎉 🕺💃 '
