import Quickshell.Io
import QtQuick
import QtQuick.Controls

Button {
    id: keyButton
    property string keyValue: ""
    property Socket socketConnection: null

    text: keyValue
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
            socketConnection.write(keyValue)
            socketConnection.flush()
        } else {
            console.error("Socket is not connected")
        }
    }
}
