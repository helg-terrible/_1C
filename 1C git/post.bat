@echo off
rem post-commit bat file

Set LogFile=.git\hooks\ext2src.log

echo "%date% %time% Start hooks after commit for add ext/" >> %LogFile%

If EXIST ".commit" (
 del /f .commit
 git add ext/ >>%LogFile% 2>&1
 git commit --amend -C HEAD --no-verify >>%LogFile% 2>&1
)
