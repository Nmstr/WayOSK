import Quickshell.Io
import QtQuick
import QtQuick.Controls

Button {
    id: keyButton
    property string key: ""
    property string label: ""
    property Socket socketConnection: null

    text: label
    width: 40
    height: 40
    font.pixelSize: 20
    background: Rectangle {
        color: keyButton.down ? "gray" : "lightgray"
        border.color: "gray"
        radius: 5
    }

    onClicked: {
        if (socketConnection) {
            socketConnection.connected = true
            socketConnection.write(key)
            socketConnection.flush()
        } else {
            console.error("Socket is not connected")
        }
    }
}
