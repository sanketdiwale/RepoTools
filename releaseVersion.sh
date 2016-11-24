#!/bin/bash
branch=$(git rev-parse --abbrev-ref HEAD)
mas="master"
if [ "$branch" != "$mas" ]; then
	echo "Not on a master branch, first merge to master then release"
else
	echo "This will push the current branch state to the master branch"
	while true; do
		read -p "Are you sure you want to release this as a version?" yn
		case $yn in
		    [Yy]* ) . ./RepoTools/bumpversion.sh; git checkout develop; echo "Released and switched to develop"; break;;
		    [Nn]* ) break;;
		    * ) echo "Please answer yes or no.";;
		esac
	done
fi