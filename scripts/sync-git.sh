#!/bin/bash

set -e

cd $1
git add -A

NOW=$(date '+%Y-%m-%d %H:%M')
git commit -m "Sync $NOW"
git pull origin master --rebase
git push origin master
