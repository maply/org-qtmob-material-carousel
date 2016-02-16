import QtQuick 2.5
import Material 0.2
import org.qtmob.material.carousel 1.0

Item {
    id: carousel

    property alias delegate: repeater.delegate
    property alias model: repeater.model

    width: parent ? parent.width : Units.dp(320)
    height: Math.floor(width * 3/4)

    ListView {
        id: repeater

        orientation: ListView.Horizontal
        clip: true
        snapMode: ListView.SnapOneItem
        highlightRangeMode: ListView.StrictlyEnforceRange
        highlightMoveDuration: 250
        focus: false
        boundsBehavior: Flickable.StopAtBounds
        anchors.fill: parent
    }

    Arrow {
        id: arrowLeft

        onClicked: repeater.currentIndex -= 1

        state: "left"
        visible: (repeater.count > 1) && (repeater.currentIndex > 0)
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: Units.dp(8)
    }

    Arrow {
        id: arrowRight

        onClicked: repeater.currentIndex += 1

        visible: (repeater.count > 1) && (repeater.currentIndex < (repeater.count - 1))
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        anchors.rightMargin: Units.dp(8)
    }

    Row {
        id: navigationBeads

        anchors.bottom: parent.bottom
        //anchors.topMargin: Units.dp(64)
        anchors.horizontalCenter: parent.horizontalCenter

        Repeater {
            delegate: Item {
                width: Units.dp(24); height: width
                Rectangle {
                    anchors.centerIn: parent
                    width: Units.dp(8); height: width
                    radius: width / 2
                    color: index == repeater.currentIndex ? "#FFFFFF" : "#80FFFFFF"
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: repeater.currentIndex = index
                }
            }
            model: repeater.model
        }
    }
}
