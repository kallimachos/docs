#!/bin/bash

if [ "$TRAVIS_REPO_SLUG" == "kallimachos/docs" ] && \
    [ "$TRAVIS_PULL_REQUEST" == "false" ] && \
    [ "$TRAVIS_BRANCH" == "master" ]; then

    echo -e "Publishing gh-pages...\n"

    cp -r doc/_build/html $HOME
    cp -r doc/_build/slides $HOME

    cd $HOME
    git config --global user.email "travis@travis-ci.org"
    git config --global user.name "travis-ci"
    git clone --quiet \
        --branch=gh-pages \
        https://$GH_TOKEN@github.com/kallimachos/docs gh-pages > /dev/null

    cd gh-pages
    find * -not -name ".*" -delete
    cp -rv $HOME/html/* ./
    cp -rv $HOME/slides ./
    git add -A .
    git commit -m "Latest doc on successful travis build #$TRAVIS_BUILD_NUMBER auto-pushed to gh-pages"
    git push -fq origin gh-pages > /dev/null

    if test `tput -T $TERM colors` -lt 256; then
        echo "Docs published to http://kallimachos.github.io/docs"
    else
        tput -T $TERM setaf 2
        echo "Docs published to http://kallimachos.github.io/docs"
        tput -T $TERM sgr0
    fi

    else
        echo -e "Not a merge to master. Not deploying to gh-pages."
fi
