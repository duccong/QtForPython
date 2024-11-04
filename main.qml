import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.11

import "./qmls"
// import MyBridge 1.0

// Window {
Item {
    width: 640
    height: 480
    visible: true
    //title: qsTr("Hello World")

    Text {
        id: leftlabel
        text: "Hello!! " + bridge.name + "\n" + Qt.formatDateTime(new Date(), "yyyy-MM-dd hh:mm:ss") + "\n" + bridge.tailerLog
        x: 100
        font.pixelSize: 18
    }

    // Bridge {
    //    id: bridge
    // }

    Bridges {
        id: bridge
        property var name: "MyBriges QML"
        }


        ColumnLayout {
            spacing: 2
            Layout.columnSpan: 1
            Layout.preferredWidth: 400
            y: 100

            RadioButton {
                id: italic
                Layout.alignment: Qt.AlignLeft
                text: "Italic"
                onToggled: {
                    leftlabel.font.italic = bridge.getItalic(italic.text)
                    leftlabel.font.bold = bridge.getBold(italic.text)
                    leftlabel.font.underline = bridge.getUnderline(italic.text)

                }
            }
            RadioButton {
                id: bold
                Layout.alignment: Qt.AlignLeft
                text: "Bold"
                onToggled: {
                    leftlabel.font.italic = bridge.getItalic(bold.text)
                    leftlabel.font.bold = bridge.getBold(bold.text)
                    leftlabel.font.underline = bridge.getUnderline(bold.text)
                }
            }
            RadioButton {
                id: underline
                Layout.alignment: Qt.AlignLeft
                text: "Underline"
                onToggled: {
                    leftlabel.font.italic = bridge.getItalic(underline.text)
                    leftlabel.font.bold = bridge.getBold(underline.text)
                    leftlabel.font.underline = bridge.getUnderline(underline.text)
                }
            }
            RadioButton {
                id: noneradio
                Layout.alignment: Qt.AlignLeft
                text: "None"
                checked: true
                onToggled: {
                    leftlabel.font.italic = bridge.getItalic(noneradio.text)
                    leftlabel.font.bold = bridge.getBold(noneradio.text)
                    leftlabel.font.underline = bridge.getUnderline(noneradio.text)
                }
            }

            Switch {
                id: mySwitch
                text: "Tail log"
                onPositionChanged: {
                    console.log("positionChanged: ", position)
                }
            }
        }

        RowLayout {
            anchors.bottom: parent.bottom
            height: 30
            width: parent.width
            spacing: 10
            MyTextInput {
                id: address
                height: parent.height
                Layout.fillWidth: true
                Layout.preferredWidth: 2
                labelText: "Address"
                inputText: "127.0.0.1"
            }

            MyTextInput {
                id: user
                height: parent.height
                Layout.fillWidth: true
                Layout.preferredWidth: 2
                labelText: "User"
                inputText: "127.0.0.1"
            }

            MyTextInput {
                id: password
                height: parent.height
                Layout.fillWidth: true
                Layout.preferredWidth: 2
                labelText: "Password"
                inputText: "127.0.0.1"
            }
            BorderButton {
                height: parent.height
                Layout.fillWidth: true
                Layout.preferredWidth: 1
                content.text: "Connect"
            }
        }
    }
