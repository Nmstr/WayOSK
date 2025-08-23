import Quickshell
import QtQuick
import QtQuick.Controls

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

    property var keyRows: [
        ["Q", "W", "E", "R", "T", "Y", "U", "I", "O", "P"],
        ["A", "S", "D", "F", "G", "H", "J", "K", "L"],
        ["Z", "X", "C", "V", "B", "N", "M"]
    ]

    Rectangle {
        anchors.fill: parent
        color: "gray"
        opacity: 0.75

        Column {
            anchors.centerIn: parent
            spacing: 8

            Repeater {
                model: keyRows
                delegate: Row {
                    spacing: 8
                    Repeater {
                        model: modelData
                        delegate: Button {
                            text: modelData
                            width: 40
                            height: 40
                        }
                    }
                }
            }
        }
    }
}
