from keyboard_server import KeyboardServer
from config_handler import ConfigHandler
import subprocess
import shutil
import time
import sys
import os

SOCKET_PATH = "/tmp/wayosk.sock"

if shutil.which("quickshell") is None:
    sys.exit("Error: 'quickshell' is not installed. Please install it: 'https://quickshell.org/'")

server = KeyboardServer(SOCKET_PATH)
config_handler = ConfigHandler()

try:
    utils_path = os.path.dirname(os.path.abspath(__file__))
    os.environ["QML_IMPORT_PATH"] = utils_path

    quickshell_process = subprocess.Popen(["quickshell", "-p", f"{os.path.dirname(os.path.abspath(__file__))}/main.qml"])

    layout_path = config_handler.get_layout_path()
    ipc_process = None
    while ipc_process != 0:
        ipc_process = subprocess.call(["quickshell", "ipc", "--pid", str(quickshell_process.pid), "call", "keyboard", "setLayoutPath", layout_path])
        time.sleep(0.1)

    quickshell_process.wait()
finally:
    server.cleanup()
