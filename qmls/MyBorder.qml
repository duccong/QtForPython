import QtQuick 2.0

Item {
    id: root
    width: 0
    height: 0
    property bool isFill: false
    property int padding: 0
    property var target: root.parent

        Rectangle {
            id: borderRectangle
            x: -padding
            y: x
            width: root.width === 0 ? target.width + padding : root.width
            height: root.height === 0 ? target.height + padding : root.height
            border.color: "black"
            border.width: 2
            radius: 5
            color: isFill ? "black" : "transparent"
        }

    }
