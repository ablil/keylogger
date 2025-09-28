# Keylogger

Simple and effective keylogger

**Key consideration**:

The actual keylogger is running on a daemon thread (running in the background) and saving the keystrokes
to `/tmp/keystrokes`.

The main thread is suspended with `time.sleep(3600)` for 1 hours, to avoid any CPU overhead and leave the daemon 
thread running. After 1 hour the scripts stops execution.

## Usage

Run & supress ouptut
```bash
python3 app &> /dev/null
```

## Creating an Executable for Windows

To build a standalone Windows executable for the keylogger:

1. Make sure you have Python 3.x installed on your Windows machine.
2. Copy all project files (including `app.py`, `requirements.txt`, and `build_windows.bat`) to your Windows machine.
3. Double-click or run `build_windows.bat` in Command Prompt. This script will:
	- Install required Python packages
	- Install PyInstaller if needed
	- Build the executable using PyInstaller
4. After completion, the executable will be located at `dist\app.exe`.

You can now run `dist\app.exe` to start the keylogger on Windows.

Run with cronjob at a specific time
```bash
15 23 29 * * python3 /path/to/script.py
```
