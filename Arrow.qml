import QtQuick 2.5
import Material 0.2

Item {
    id: arrow

    signal clicked

    property bool interactive: true

    states: State {
        name: "left"
        PropertyChanges {
            target: image
            source: "qrc:Arrow-bg--left.png"
        }
    }

    width: Units.dp(32)
    height: Units.dp(32)

    Image {
        id: image
        anchors.fill: parent
        fillMode: Image.PreserveAspectFit
        source: "qrc:Arrow-bg.png"
    }

    Ink {
        id: ink
        visible: interactive
        anchors.fill: parent
    }

    Component.onCompleted: ink.clicked.connect(arrow.clicked)
}

