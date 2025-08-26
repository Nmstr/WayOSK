import configparser
import os

class ConfigHandler:
    def __init__(self) -> None:
        self.config_file = os.path.expanduser(os.path.join("~", ".config", "WayOSK", "config.ini"))
        self.config = configparser.ConfigParser()
        self.config.read(self.config_file)

    def get_layout_path(self) -> str:
        layout = self.config.get("Keyboard", "layout", fallback="de_de")
        layout_dir = os.path.join(os.path.dirname(os.path.abspath(__file__)), "layouts")
        if f"{layout}.qml" not in os.listdir(layout_dir):
            print("Layout not found, aborting")
            return ""
        return os.path.join(layout_dir, f"{layout}.qml")
