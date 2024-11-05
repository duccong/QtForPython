// import MyBridge 1.0

import "./qmls"
import Qt.labs.platform 1.1
import QtQuick 2.15
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.11
import QtQuick.Window 2.15

// Window {
Item {
    //title: qsTr("Hello World")
    // Bridge {
    //    id: bridge
    // }

    width: 1080
    height: 720
    visible: true

    Text {
        id: mainLabel

        text: "Hello!! " + bridge.name + "\n" + Qt.formatDateTime(new Date(), "yyyy-MM-dd hh:mm:ss") + "\n" + bridge.tailerLog
        x: 100
        font.pixelSize: 18
    }

    Bridges {
        id: bridge

        property var name: "MyBriges QML"

        Nulo {
        }

    }

    RowLayout {
        id: mainPanel

        spacing: 15

        Nulo {
        }

        anchors {
            top: mainLabel.bottom
            bottom: bottomBar.top
            left: parent.left
            right: parent.right
            margins: 10
        }

        Column {
            id: leftPanel

            spacing: 5
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.preferredWidth: 1
            Layout.preferredHeight: parent.height

            MyBorder {
            }

            RadioButton {
                id: ccrc

                width: parent.width
                text: "CCRC"
                onToggled: {
                    console.log("Check for CCRC");
                }
            }

            RadioButton {
                id: ccic2

                width: parent.width
                text: "CCIC27"
                onToggled: {
                    console.log("Check for CCIC27");
                }
            }

            MyBorder {
                width: parent.width
                height: 2
                isFill: true
            }

            RowLayout {
                spacing: 10

                anchors {
                    left: parent.left
                    right: parent.right
                    leftMargin: 10
                    rightMargin: 10
                }

                BorderButton {
                    Layout.alignment: Qt.AlignBottom
                    Layout.fillWidth: true
                    Layout.preferredHeight: 30
                    Layout.preferredWidth: 1
                    content.text: "SyncLog"
                }

                Switch {
                    id: mySwitch

                    Layout.alignment: Qt.AlignBottom
                    text: "Tail log"
                    font.pixelSize: 18
                    Layout.fillWidth: true
                    Layout.preferredHeight: 30
                    Layout.preferredWidth: 2
                    onPositionChanged: {
                        console.log("positionChanged: ", position);
                    }
                }

            }

            MyBorder {
                width: parent.width
                height: 2
                isFill: true
            }

            RowLayout {
                spacing: 10

                anchors {
                    left: parent.left
                    right: parent.right
                    leftMargin: 10
                    rightMargin: 10
                }

                BorderButton {
                    Layout.alignment: Qt.AlignBottom
                    Layout.fillWidth: true
                    Layout.preferredHeight: 30
                    Layout.preferredWidth: 1
                    content.text: "Get"
                    onMouseClicked: {
                        folderDialog.open();
                    }
                }

                BorderButton {
                    Layout.alignment: Qt.AlignBottom
                    Layout.fillWidth: true
                    Layout.preferredHeight: 30
                    Layout.preferredWidth: 1
                    content.text: "Set"
                }

            }

            MyBorder {
                width: parent.width
                height: 2
                isFill: true
            }

        }

        Text {
            id: mainLog

            text: "Hello!! " + bridge.name + "\n" + Qt.formatDateTime(new Date(), "yyyy-MM-dd hh:mm:ss") + "\n" + bridge.tailerLog
            font.pixelSize: 18
            Layout.fillWidth: true
            Layout.preferredWidth: 3
            Layout.fillHeight: true
            Layout.preferredHeight: parent.height
            padding: 10

            MyBorder {
                anchors.fill: parent
            }

        }

    }

    RowLayout {
        id: bottomBar

        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.margins: 10
        height: 30
        spacing: 10

        MyTextInput {
            id: address

            height: parent.height
            Layout.fillWidth: true
            Layout.preferredWidth: 2
            labelText: "Device address"
            inputText: "127.0.0.1"
        }

        MyTextInput {
            id: user

            height: parent.height
            Layout.fillWidth: true
            Layout.preferredWidth: 2
            labelText: "User"
            inputText: "root"
        }

        MyTextInput {
            id: password

            height: parent.height
            Layout.fillWidth: true
            Layout.preferredWidth: 2
            labelText: "Password"
            inputText: "root"
            passwordType: true
        }

        MyTextInput {
            id: port

            height: parent.height
            Layout.fillWidth: true
            Layout.preferredWidth: 1
            labelText: "Port"
            inputText: "22"
            maxLength: 4
        }

        BorderButton {
            height: parent.height
            Layout.fillWidth: true
            Layout.preferredWidth: 1
            content.text: "Connect"
        }

    }

    FolderDialog {
        id: folderDialog

        // currentFolder: viewer.folder
        folder: StandardPaths.standardLocations(StandardPaths.PicturesLocation)[0]
        onCurrentFolderChanged: {
            console.log("currentFolder: ", currentFolder);
        }
        onFolderChanged: {
            console.log("folder: ", folder);
        }
    }

}
