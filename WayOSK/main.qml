import Quickshell

Scope {
    PanelWindow {
        id: root
        exclusionMode: ExclusionMode.Ignore
        aboveWindows: false
        color: "transparent"

        anchors {
            top: true
            bottom: true
            left: true
            right: true
        }

        Indicator {
            id: indicator
        }

        Keyboard {
            id: keyboard
            visible: false
        }
    }
}
