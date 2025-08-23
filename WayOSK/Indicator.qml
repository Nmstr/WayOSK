import Quickshell
import QtQuick

PopupWindow {
    id: indicator

    anchor.window: root
    implicitWidth: 50
    implicitHeight: 50
    color: "transparent"
    visible: true

    MouseArea {
        anchors.fill: parent
        drag.target: null

        property real dragOffsetX: 0
        property real dragOffsetY: 0
        property real startX: 0
        property real startY: 0

        onPressed: {
            startX = indicator.anchor.rect.x
            startY = indicator.anchor.rect.y
            dragOffsetX = mouse.x
            dragOffsetY = mouse.y
        }
        onPositionChanged: {
            indicator.anchor.rect.x = startX + (mouse.x - dragOffsetX)
            indicator.anchor.rect.y = startY + (mouse.y - dragOffsetY)
        }
        onReleased: {
            if (startX === indicator.anchor.rect.x && startY === indicator.anchor.rect.y) {
                keyboard.visible = !keyboard.visible
            }
        }
    }

    Rectangle {
        anchors.fill: parent
        color: "gray"
        radius: 50
        opacity: 0.5
    }
}
