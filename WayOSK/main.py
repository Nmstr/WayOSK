import subprocess
import shutil
import sys
import os

if shutil.which("quickshell") is None:
    sys.exit("Error: 'quickshell' is not installed. Please install it: 'https://quickshell.org/'")

subprocess.run(["quickshell", "-p", f"{os.path.dirname(os.path.abspath(__file__))}/main.qml"])
