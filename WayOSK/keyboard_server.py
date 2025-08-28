import WayKey as wk
import threading
import socket
import os

class KeyboardServer:
    def __init__(self, socket_path: str):
        self.socket_path = socket_path
        self.server = None
        self.thread = None
        self.start_server()

    def start_server(self):
        if os.path.exists(self.socket_path):
            os.unlink(self.socket_path)

        self.server = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
        self.server.bind(self.socket_path)
        self.server.listen(1)

        self.thread = threading.Thread(target=self.listen_for_keys, daemon=True)
        self.thread.start()

    def listen_for_keys(self):
        while True:
            conn, _ = self.server.accept()
            with conn:
                data = conn.recv(1024).decode("utf-8").split()
                if not data:
                    continue

                if len(data) == 2:
                    if data[0] == "press":
                        try:
                            wk.press(data[1])
                        except Exception as e:
                            print(f"Error pressing key: {e}")
                    elif data[0] == "release":
                        try:
                            wk.release(data[1])
                        except Exception as e:
                            print(f"Error releasing key: {e}")

    def cleanup(self):
        if self.server:
            self.server.close()
        if os.path.exists(self.socket_path):
            os.unlink(self.socket_path)
