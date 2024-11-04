import QtQuick 2.0
import QtQuick.Layouts 1.3

Item {
    id: root
    width: 50
    height: 50
    property alias labelText: label.text
    property alias inputText: txtInput.text
    RowLayout {
        anchors.fill: parent
        Text {
            id: label
            height: parent.height
            Layout.fillWidth: true
            Layout.preferredWidth: 2
            font.pixelSize: 16
            horizontalAlignment: Text.AlignRight
        }
        MyBorder {
            id: border
            height: parent.height
            Layout.fillWidth: true
            Layout.preferredWidth: 3

            TextInput {
                id: txtInput
                width: parent.width - font.pixelSize
                anchors.centerIn: parent
                font.pixelSize: 16
            }
        }
        
    }
}
