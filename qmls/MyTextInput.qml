import QtQuick 2.0
import QtQuick.Layouts 1.3

Item {
    id: root

    property bool passwordType: false
    property alias labelText: label.text
    property alias inputText: txtInput.text
    property alias maxLength: txtInput.maximumLength

    width: 50
    height: 50

    RowLayout {
        anchors.fill: parent

        Text {
            id: label

            height: parent.height
            Layout.fillWidth: true
            Layout.preferredWidth: 2
            font.pixelSize: 16
            horizontalAlignment: Text.AlignHCenter
        }

        TextInput {
            // clip: true
            id: txtInput

            Layout.fillWidth: true
            Layout.preferredWidth: 3
            Layout.fillHeight: true
            passwordCharacter: "*"
            echoMode: passwordType ? TextInput.Password : TextInput.Normal
            font.pixelSize: 16
            verticalAlignment: Text.AlignVCenter
            maximumLength: 16
            MyBorder {
                padding: 5
            }
        }

    }

}
