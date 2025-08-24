from keyboard_server import KeyboardServer
import subprocess
import shutil
import sys
import os

SOCKET_PATH = "/tmp/wayosk.sock"

if shutil.which("quickshell") is None:
    sys.exit("Error: 'quickshell' is not installed. Please install it: 'https://quickshell.org/'")

server = KeyboardServer(SOCKET_PATH)

try:
    subprocess.run(["quickshell", "-p", f"{os.path.dirname(os.path.abspath(__file__))}/main.qml"])
finally:
    server.cleanup()
