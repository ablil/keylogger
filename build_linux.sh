#!/bin/bash
# Shell script to set up and build the keylogger on Linux

set -e

echo "Starting Linux build process..."

# Step 1: Check for Python installation
if ! command -v python3 &> /dev/null; then
    echo "Python 3 is not installed. Please install Python 3.x and rerun this script."
    exit 1
fi

echo "Python 3 found: $(python3 --version)"

# Step 2: Check for pip
if ! command -v pip3 &> /dev/null; then
    echo "pip3 is not installed. Installing pip..."
    python3 -m ensurepip --upgrade || {
        echo "Failed to install pip. Please install pip manually."
        exit 1
    }
fi

# Step 3: Install required Python packages
echo "Installing required packages..."
if [ ! -f "requirements.txt" ]; then
    echo "Error: requirements.txt not found!"
    exit 1
fi
python3 -m pip install --upgrade pip
python3 -m pip install -r requirements.txt || {
    echo "Failed to install requirements. Please check requirements.txt for errors."
    exit 1
}

# Step 4: Install pyinstaller if not present
if ! python3 -m pip show pyinstaller &> /dev/null; then
    echo "Installing pyinstaller..."
    python3 -m pip install pyinstaller
fi

# Step 5: Build the executable
echo "Building executable with PyInstaller..."
python3 -m PyInstaller --onefile app.py

# Step 6: Notify user
if [ -f "dist/app" ]; then
    echo "Build successful! Executable is located at dist/app"
    echo "You can run it with: ./dist/app"
else
    echo "Build failed. Please check the output for errors."
    exit 1
fi
