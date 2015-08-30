#!/bin/sh

# Clean-up detritus from Git and resync with the master repository.

# 1. Branches
git remote prune origin

# 2. Tags
git tag -l | xargs git tag -d && git fetch -t
