import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.11

import "./qmls"
import MyBridge 1.0

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Text {
        id: leftlabel
        text: "Hello!!: "  + bridge.name + "\n" + bridge.tailerLog
        x: 100
    }

    Bridge {
       id: bridge
    }

    Bridges {
        id: bridgeQML
    }
    Switch {
        id: mySwitch
        onPositionChanged: {
            console.log("positionChanged: ", position)
        }
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
    }
}
