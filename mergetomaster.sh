#!/bin/bash
if branch=$(git symbolic-ref --short -q HEAD)
then
  echo on branch $branch
  echo "Merging to master"
  git checkout master
  git merge --no-ff $branch
  echo "Merged and switched to branch develop"
  echo "If no merge conflicts -> done, otherwise resolve merge conflicts manually and commit on the master"
  echo "You can release after all conflicts have been resolved"
else
  echo not on any branch
fi

