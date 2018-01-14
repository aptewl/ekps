import QtQuick 2.9
import QtGraphicalEffects 1.0
import QtQuick.Controls 2.2
import QtQuick.Controls.Styles 1.4


//keyword search
Rectangle {
    id: search
    property alias visible_position: txt.y
    z: 900
    anchors.fill: parent
    anchors.leftMargin: 5 * parent.width / 100
    anchors.rightMargin: 5 * parent.width / 100
    anchors.topMargin: 70
    anchors.bottomMargin: 10 * parent.height / 100
    width: parent.width
    height: parent.height
    color: "#e3f2fd"
    radius: 8
    opacity: 0
    visible: opacity > 0 //initially form invisible
    border.color: "grey"
    border.width: 2

    MouseArea {
        anchors.fill: search
        anchors.margins: -200
    }

    PropertyAnimation {
        id: circleAnimation3
        target: search
        properties: "opacity" // In animation, change the opacity
        from: 1 // Change the settings from 1  ...
        to: 0
        duration: 600
    }

    PropertyAnimation {
        id: circleAnimation6
        target: search
        properties: "opacity" // In animation, change the opacity
        from: 1 // Change the settings from 1 pixels ...
        to: 0
        duration: 600
    }

    Column {
        anchors.fill: parent
        spacing: 20

        Rectangle {
            height: 15
            width: parent.width - 10
            color: "transparent"
            anchors.horizontalCenter: parent.horizontalCenter
        }
        Label {
            id: lb2
            anchors.left: parent.left
            clip: true
            anchors.leftMargin: 10
            text: qsTr("ПОИСК")
            color: "#616161"
            font.bold: false
        }
        Label {
            id: lb3
            anchors.left: parent.left
            anchors.topMargin: -10
            clip: true
            anchors.leftMargin: 10
            text: qsTr("по трем ключевым словам")
            color: "#616161"
            font.bold: false
        }
        Item {
            id : itm
            width: parent.width - 10
            height: txt.height + 28
            clip: true
            anchors.horizontalCenter: parent.horizontalCenter

            Text {
                id: txt_hint
                y: 12
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: txt.font.pixelSize - 2
                text: qsTr("введите через пробел")
                opacity: 0.26
                visible: (txt.contentWidth == 0)
            }
            TextInput {
                id: txt
                width: parent.width - 10
                height: font.pixelSize*6
                anchors.horizontalCenter: parent.horizontalCenter
                y: visible_position
                text: qsTr("")
                enabled: true
                opacity: 0.87
                // wrapMode: TextEdit.NoWrap //root.multiline ?  TextEdit.Wrap : TextEdit.NoWrap
                activeFocusOnPress: true
                selectByMouse: true

                cursorDelegate: Rectangle {
                    width: 2
                    color: "#c2185b"
                    visible: txt.activeFocus

                    NumberAnimation on opacity {
                        id: cursor_blink_anim
                        from: 6.0
                        to: -6.0
                        duration: 3000
                        loops: -1
                    }
                    onXChanged: cursor_blink_anim.restart()
                }
                onCursorRectangleChanged: rec_line.y = cursorRectangle.y + 2* txt.font.pixelSize
            }

            Rectangle {
                id: rec_line
                width: parent.width
                height: txt.activeFocus ? 2 : 1
                color: txt.activeFocus ? "#2979ff" : "black"
                opacity: txt.activeFocus ? 1 : 0.12
                visible: true
            }
        }

        Rectangle {
            height: 50
            width: parent.width - 10
            color: "transparent"
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }

    Row {

        spacing: 30
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.margins: 15
        EKPSButton {
            id: b1
            type: 'FINDE_TXT'
            text: qsTr("ПОИСК")
            button_color: "#616161"
            enabled: txt.contentWidth > 0
        }

        EKPSButton {
            id: b
            type: "CANCEL_FINDE_TXT"
            text: qsTr("ОТМЕНА")
            button_color: "#ffffff"

        }
        EKPSButton {
            id: b2
            type: "CLEAR_SEARCH"
            text: qsTr("СТЕРЕТЬ")
            button_color: "#616161"
            enabled: txt.contentWidth > 0
        }
    }

}
