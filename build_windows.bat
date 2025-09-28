@echo off
REM Batch script to set up and build the keylogger on Windows

REM Step 1: Check for Python installation
python --version >nul 2>&1
IF %ERRORLEVEL% NEQ 0 (
    echo Python is not installed. Please install Python 3.x and rerun this script.
    exit /b 1
)

REM Step 2: Install pip if not present
python -m pip --version >nul 2>&1
IF %ERRORLEVEL% NEQ 0 (
    echo pip is not installed. Installing pip...
    python -m ensurepip --upgrade
)

REM Step 3: Install required Python packages
python -m pip install --upgrade pip
python -m pip install -r requirements.txt

REM Step 4: Install pyinstaller if not present
python -m pip show pyinstaller >nul 2>&1
IF %ERRORLEVEL% NEQ 0 (
    echo Installing pyinstaller...
    python -m pip install pyinstaller
)

REM Step 5: Build the executable
python -m pyinstaller --onefile app.py

REM Step 6: Notify user
if exist dist\app.exe (
    echo Build successful! Executable is located at dist\app.exe
) else (
    echo Build failed. Please check the output for errors.
)
