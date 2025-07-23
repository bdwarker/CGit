@echo off
title 🛠️ Installing cgit.bat...

:: === Set Target Folder ===
set /p TARGET=Enter target folder for cgit.bat (default: C:\cgit): 
if "%TARGET%"=="" set TARGET=C:\cgit

:: === Create Folder if Missing ===
if not exist "%TARGET%" (
    mkdir "%TARGET%"
    echo 📁 Created folder: %TARGET%
)

:: === Copy cgit.bat to Target ===
copy /Y cgit.bat "%TARGET%\"
echo ✅ Copied cgit.bat to %TARGET%

:: === Check if PATH Already Has Target ===
echo Checking system PATH...
echo %PATH% | find /I "%TARGET%" >nul
if %ERRORLEVEL%==0 (
    echo 🔁 PATH already contains %TARGET%
) else (
    echo 🧩 Adding %TARGET% to system PATH...

    :: Add to system PATH (requires admin)
    setx /M PATH "%PATH%;%TARGET%"
    
    if %ERRORLEVEL%==0 (
        echo ✅ PATH updated! You can now run 'cgit' from anywhere.
    ) else (
        echo ❌ Failed to update PATH. Try running this as Administrator.
    )
)

pause
