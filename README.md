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

Run with cronjob at a specific time
```bash
15 23 29 * * python3 /path/to/script.py
```
