@echo off
echo -------------------------------
echo        PGIT: Pull & Push       
echo -------------------------------

REM Step 1: Fetch and check for upstream changes
echo.
echo Checking for remote changes...
git fetch

REM Step 2: Compare local and remote
FOR /F "tokens=*" %%i IN ('git rev-list --count HEAD ^| findstr /r /v "^$"') DO set LOCAL=%%i
FOR /F "tokens=*" %%i IN ('git rev-list --count @{u} ^| findstr /r /v "^$" 2^>nul') DO set REMOTE=%%i

IF NOT DEFINED REMOTE (
    echo No upstream branch found. Have you set up the remote and pushed before?
    goto :eof
)

IF "%LOCAL%"=="%REMOTE%" (
    echo Your branch is up to date with the remote.
) ELSE (
    echo There are remote changes.
    echo.
    choice /M "Do you want to pull them first?"
    IF ERRORLEVEL 2 (
        echo Skipping pull. Proceeding anyway...
    ) ELSE (
        git pull
        IF ERRORLEVEL 1 (
            echo Merge or pull failed. Resolve conflicts before pushing.
            goto :eof
        )
    )
)

echo.
echo Adding and committing current changes...
git add .
set /p msg=Commit message: 
git commit -m "%msg%" >nul 2>&1

IF ERRORLEVEL 1 (
    echo Nothing new to commit.
) ELSE (
    echo Changes committed.
)

echo.
echo Pushing to remote...
git push

IF ERRORLEVEL 1 (
    echo Push failed. Check your network or credentials.
) ELSE (
    echo Push complete.
)
