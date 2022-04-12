@echo off
REM git remote add upstream https://github.com/CnCNet/ts-patches.git
git checkout master
git pull upstream master
git checkout strikeforce
git rebase master
