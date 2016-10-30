#!/bin/bash
if branch=$(git symbolic-ref --short -q HEAD)
then
  echo on branch $branch
  echo "Merging to develop"
  git checkout develop
  git merge --no-ff $branch
  echo "Merged and switched to branch develop"
  echo "If no merge conflicts -> done, otherwise resolve merge conflicts manually and commit on the develop"
else
  echo not on any branch
fi

