#!/usr/bin/env bash

set -e

git checkout gh-pages
git cherry-pick 17d8384590739b6d497922c1e1585b4086da1df9
git push
git checkout master