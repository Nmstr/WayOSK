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
        if (keyboard.keyboardSocket) {
            keyboard.keyboardSocket.connected = true
            keyboard.keyboardSocket.write("press " + key)
            keyboard.keyboardSocket.flush()
        } else {
            console.error("Socket is not connected")
        }
    }
    onReleased: {
        if (keyboard.keyboardSocket) {
            keyboard.keyboardSocket.connected = true
            keyboard.keyboardSocket.write("release " + key)
            keyboard.keyboardSocket.flush()
        } else {
            console.error("Socket is not connected")
        }
    }
}
