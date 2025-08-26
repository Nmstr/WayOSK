import Quickshell
import Quickshell.Io
import QtQuick

PanelWindow {
    id: keyboard
    exclusionMode: ExclusionMode.Ignore
    color: "transparent"
    implicitHeight: 400

    anchors {
        bottom: true
        left: true
        right: true
    }

    property string layoutPath: ""

    Socket {
        id: keyboardSocket
        path: "/tmp/wayosk.sock"
    }

    IpcHandler {
        target: "keyboard"

        function setLayoutPath(path: string): void {
            keyboard.layoutPath = path
        }
    }

    Loader {
        id: keyboardLoader
        anchors.fill: parent
        source: keyboard.layoutPath
        active: keyboard.layoutPath !== ""
    }
}
