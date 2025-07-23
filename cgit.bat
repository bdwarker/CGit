@echo off
set /p username=Enter your GitHub username: 
set /p reponame=Enter GitHub repo name (leave blank to use folder name): 
set /p description=Enter description (optional): 
set /p msg=Initial commit message: 

:: Auto-use folder name if reponame not provided
if "%reponame%"=="" (
    for %%I in (.) do set reponame=%%~nxI
)

:: Create README.md
echo # %reponame% > README.md

:: Create .gitignore (basic template for most projects)
echo node_modules/>.gitignore
echo .env>>.gitignore
echo *.log>>.gitignore
echo __pycache__>>.gitignore
echo *.exe>>.gitignore
echo *.DS_Store>>.gitignore

:: Init Git
git init

:: Create GitHub repo via gh
set /p private=Make repo private? (y/n): 
if /I "%private%"=="y" (
    set visibility=--private
) else (
    set visibility=--public
)

gh repo create %reponame% --description "%description%" %visibility% --source=. --remote=origin --confirm

:: Add, commit, push
git remote add origin https://github.com/%username%/%reponame%
git add .
git commit -m "%msg%"
git branch -M main
git push -u origin main

echo.
IF %ERRORLEVEL% NEQ 0 (
    echo Failed to create or push the repo.
) ELSE (
    echo Repo '%reponame%' created and pushed successfully!
    start https://github.com/bdwarker/%reponame%
)
pause
