#!/bin/bash

set -e

echo "REPO: $GITHUB_REPOSITORY"
echo "ACTOR: $GITHUB_ACTOR"

echo '=================== Install Requirements ==================='
pip install -r requirements.txt
echo '=================== Create deploy key to push ==================='
mkdir /root/.ssh
ssh-keyscan -t rsa github.com > /root/.ssh/known_hosts && \
echo "${GIT_DEPLOY_KEY}" > /root/.ssh/id_rsa && \
chmod 400 /root/.ssh/id_rsa
echo '=================== Build site ==================='
python generate_meetup_posts.py
make publish
echo '=================== Publish to GitHub Pages ==================='
cd output
# shellcheck disable=SC2012
remote_repo="git@github.com:${GITHUB_REPOSITORY}.git"
remote_branch="gh-pages"
git init
git remote add deploy "$remote_repo"
git checkout $remote_branch || git checkout --orphan $remote_branch
git config user.name "${GITHUB_ACTOR}"
git config user.email "${GITHUB_ACTOR}@users.noreply.github.com"
git add .
echo -n 'Files to Commit:' && ls -l | wc -l
timestamp=$(date +%s%3N)
git commit -m "[ci skip] Automated deployment to GitHub Pages on $timestamp"
git push deploy $remote_branch --force
rm -fr .git
cd ../
echo '=================== Done  ==================='
