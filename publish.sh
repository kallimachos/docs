#!/bin/bash

# Helper script for publishing RPC documentation to github.rackspace.com.
# Run from the master branch of the internal RPC repository.

# set repo root directory
GITDIR=`git rev-parse --show-toplevel`

# set source directories
SOURCE='docs'

# ensure master is up-to-date
cd $GITDIR
git pull

# checkout gh-pages branch and delete contents except . files
git checkout gh-pages
find * -not -name ".*" -delete

# checkout source directories from master and reset HEAD
git checkout master $SOURCE
git reset HEAD

# build html from rst in internal directory
cd $SOURCE
make html

# move html files to root directory
mv -fv _build/html/* ../

# remove source files
cd $GITDIR
rm -rf $SOURCE

# add, commit, and push new html files
git add .
git commit -m "gh-pages: `git log master -1 --pretty=short --abbrev-commit`"
git push origin gh-pages

# checkout master and signal completion
git checkout master
echo
tput setaf 2; echo "Docs published to http://kallimachos.github.io/docs."
tput sgr0
