import QtQuick 2.0

Item {
    width: 150
    height: 50

    property alias bg: background
    property alias content: content

    signal mouseClicked()

    Rectangle {
        id: background
        anchors.fill: parent
        color: mouseArea.pressed ? "RED" : "GREEN"
        border {
            width: 2
            color: "BLACK"
        }
        radius: 10
        opacity: 0.8
    }

    Text {
        id: content
        anchors.centerIn: parent
        text: "DoSth"
        font.pixelSize: 18
        color: "WHITE"
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        onClicked: {
            console.log("BorderButton.Clicked")
            mouseClicked()
        }
    }
}
