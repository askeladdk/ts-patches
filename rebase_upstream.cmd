@echo off
REM git remote add upstream https://github.com/CnCNet/ts-patches.git
git fetch upstream
git checkout master
git rebase upstream/master
git checkout strikeforce
git rebase master
