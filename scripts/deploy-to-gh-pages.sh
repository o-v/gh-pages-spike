#!/bin/bash
# See https://medium.com/@nthgergo/publishing-gh-pages-with-travis-ci-53a8270e87db
set -o errexit

# rm -rf public
# mkdir public

# config
git config --global user.email "nobody@nobody.org"
git config --global user.name "Travis CI"

# build (CHANGE THIS)
# npm run build

# copy dist folder into folder named after current branch
# cp -r ./dist ./${TRAVIS_BRANCH}
# mv ./${TRAVIS_BRANCH} ./dist/${TRAVIS_BRANCH}

# git clone "https://${GITHUB_TOKEN}@github.com/${GITHUB_REPO_DIST}.git" _DIST
git fetch
git checkout -b gh-pages


mkdir -p ${TRAVIS_BRANCH}
echo "${TRAVIS_BRANCH}" > $TRAVIS_BRANCH/readme.md

find .

cp -r $TRAVIS_BRANCH/readme.md _DIST

echo TRAVIS_BRANCH: ${TRAVIS_BRANCH}

#if [ ${TRAVIS_BRANCH} = master ] || [ ${TRAVIS_BRANCH} = develop ]; then
	# deploy
	echo deploying ${TRAVIS_BRANCH}
	# cd dist
	# git init
	git add -A
	git commit -m "Deploy ${TRAVIS_BRANCH} to Github Pages"
	git push --force "https://${GITHUB_TOKEN}@github.com/${GITHUB_REPO}.git" # master # gh-pages # > /dev/null 2>&1

#else
#	#don't deploy
#	echo not deploying ${TRAVIS_BRANCH}
#
#fi