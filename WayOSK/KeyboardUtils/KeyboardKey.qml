import Quickshell.Io
import QtQuick
import QtQuick.Controls

Button {
    id: keyButton
    property string key: ""
    property string label: ""

    text: label
    width: 40
    height: 40
    font.pixelSize: 20
    background: Rectangle {
        color: keyButton.down ? "gray" : "lightgray"
        border.color: "gray"
        radius: 5
    }

    onPressed: {
        sendKey("press")
    }
    onReleased: {
        sendKey("release")
    }
    onCanceled: {
        sendKey("release")
    }

    function sendKey(action: string) {
        if (keyboard.keyboardSocket) {
            keyboard.keyboardSocket.connected = true
            keyboard.keyboardSocket.write(action + " " + key)
            keyboard.keyboardSocket.flush()
        } else {
            console.error("Socket is not connected")
        }
    }
}
