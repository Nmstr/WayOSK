import QtQuick
import QtQuick.Layouts
import KeyboardUtils

Rectangle {
    id: customKeyboard
    color: "gray"
    opacity: 0.75

    property var keyRows : [
        [
            { key: "KEY_ESCAPE", label: "Esc" },
            { key: "KEY_F1", label: "F1" },
            { key: "KEY_F2", label: "F2" },
            { key: "KEY_F3", label: "F3" },
            { key: "KEY_F4", label: "F4" },
            { key: "KEY_F5", label: "F5" },
            { key: "KEY_F6", label: "F6" },
            { key: "KEY_F7", label: "F7" },
            { key: "KEY_F8", label: "F8" },
            { key: "KEY_F9", label: "F9" },
            { key: "KEY_F10", label: "F10" },
            { key: "KEY_F11", label: "F11" },
            { key: "KEY_F12", label: "F12" }
        ],
        [
            { key: "KEY_GRAVE", label: "^" },
            { key: "KEY_1", label: "1" },
            { key: "KEY_2", label: "2" },
            { key: "KEY_3", label: "3" },
            { key: "KEY_4", label: "4" },
            { key: "KEY_5", label: "5" },
            { key: "KEY_6", label: "6" },
            { key: "KEY_7", label: "7" },
            { key: "KEY_8", label: "8" },
            { key: "KEY_9", label: "9" },
            { key: "KEY_0", label: "0" },
            { key: "KEY_MINUS", label: "ß" },
            { key: "KEY_EQUAL", label: "´" },
            { key: "KEY_BACKSPACE", label: "Backspace", width: 2 }
        ],
        [
            { key: "KEY_TAB", label: "Tab", width: 1.25 },
            { key: "KEY_Q", label: "Q" },
            { key: "KEY_W", label: "W" },
            { key: "KEY_E", label: "E" },
            { key: "KEY_R", label: "R" },
            { key: "KEY_T", label: "T" },
            { key: "KEY_Y", label: "Z" },
            { key: "KEY_U", label: "U" },
            { key: "KEY_I", label: "I" },
            { key: "KEY_O", label: "O" },
            { key: "KEY_P", label: "P" },
            { key: "KEY_LEFTBRACE", label: "Ü" },
            { key: "KEY_RIGHTBRACE", label: "+" },
            { key: "KEY_ENTER", label: "Enter", width: 1.25 }
        ],
        [
            { key: "KEY_CAPSLOCK", label: "Caps", width: 1.5 },
            { key: "KEY_A", label: "A" },
            { key: "KEY_S", label: "S" },
            { key: "KEY_D", label: "D" },
            { key: "KEY_F", label: "F" },
            { key: "KEY_G", label: "G" },
            { key: "KEY_H", label: "H" },
            { key: "KEY_J", label: "J" },
            { key: "KEY_K", label: "K" },
            { key: "KEY_L", label: "L" },
            { key: "KEY_SEMICOLON", label: "Ö" },
            { key: "KEY_APOSTROPHE", label: "Ä" },
            { key: "KEY_BACKSLASH", label: "#" },
            { key: "KEY_ENTER", label: "Enter" }
        ],
        [
            { key: "KEY_LEFTSHIFT", label: "Shift", width: 1.25 },
            { key: "KEY_102ND", label: "<" },
            { key: "KEY_Z", label: "Y" },
            { key: "KEY_X", label: "X" },
            { key: "KEY_C", label: "C" },
            { key: "KEY_V", label: "V" },
            { key: "KEY_B", label: "B" },
            { key: "KEY_N", label: "N" },
            { key: "KEY_M", label: "M" },
            { key: "KEY_COMMA", label: "," },
            { key: "KEY_DOT", label: "." },
            { key: "KEY_SLASH", label: "-" },
            { key: "KEY_RIGHTSHIFT", label: "Shift", width: 1.25 }
        ],
        [
            { key: "KEY_LEFTCTRL", label: "Ctrl" },
            { key: "KEY_LEFTMETA", label: "Meta" },
            { key: "KEY_LEFTALT", label: "Alt" },
            { key: "KEY_SPACE", label: "Space", width: 6 },
            { key: "KEY_RIGHTALT", label: "AltGr" },
            { key: "KEY_RIGHTMETA", label: "Meta" },
            { key: "KEY_RIGHTCTRL", label: "Ctrl" }
        ],
    ]

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 10
        spacing: 5

        Repeater {
            model: keyRows.length

            RowLayout {
                Layout.fillWidth: true
                Layout.fillHeight: true
                spacing: 5

                property var rowKeys: keyRows[index]

                Repeater {
                    model: rowKeys

                    KeyboardKey {
                        key: modelData.key
                        label: modelData.label
                        Layout.fillWidth: true
                        Layout.preferredWidth: (modelData.width || 1) * 40
                        Layout.minimumWidth: 40
                        Layout.fillHeight: true
                    }
                }
            }
        }
    }
}
