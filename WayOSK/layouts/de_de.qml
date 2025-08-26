import QtQuick
import KeyboardUtils

Rectangle {
    id: customKeyboard
    color: "gray"
    opacity: 0.75
    property var keyRows: [
        ["Q", "W", "E", "R", "T", "Z", "U", "I", "O", "P"],
        ["A", "S", "D", "F", "G", "H", "J", "K", "L"],
        ["Y", "X", "C", "V", "B", "N", "M"]
    ]

    Column {
        anchors.centerIn: parent
        spacing: 8

        Repeater {
            model: keyRows
            delegate: Row {
                spacing: 8
                Repeater {
                    model: modelData
                    delegate: KeyboardKey {
                        key: "KEY_" + modelData
                        label: modelData
                        socketConnection: keyboardSocket
                    }
                }
            }
        }
    }
}
