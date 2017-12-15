import QtQuick 2.0
import QtGraphicalEffects 1.0
//import QtQuick.Controls 2.2
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4


//поиск по ключевым словам
Rectangle {
    id: search
    //modal: true
    z: 10
    anchors.fill: parent
    anchors.leftMargin: 60
    anchors.rightMargin: 60
    anchors.topMargin: 100
    anchors.bottomMargin: 200
    width: parent.width
    height: parent.height
    color: "#e3f2fd"
    radius: 8
    opacity: 0
    visible: opacity > 0 //изначально форма невидимая
    border.color: "grey"
    border.width: 2

    MouseArea {
        anchors.fill: search
    }

    PropertyAnimation {
        id: circleAnimation3
        target: search // The aim Asking circular background
        properties: "opacity" // In animation, change the height, width and radius
        from: 1 // Change the settings from 0 pixels ...
        to: 0
        duration: 600
    }

    PropertyAnimation {
        id: circleAnimation6
        target: search // The aim Asking circular background
        properties: "opacity" // In animation, change the height, width and radius
        from: 1 // Change the settings from 0 pixels ...
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
            // anchors.top: search.top
            anchors.left: parent.left
            //width: search.width
            // anchors.topMargin: 50
            clip: true
            anchors.leftMargin: 10
            text: "Поиск "
            color: "#616161"
            font.pixelSize: 30
            font.bold: false
            FontLoader {
                source: "./Roboto-Regular.ttf"
            }
        }
        Label {
            id: lb3
            // anchors.top: search.top
            anchors.left: parent.left
            //width: search.width
            anchors.topMargin: -10
            clip: true
            anchors.leftMargin: 10
            text: "по ключевым словам"
            color: "#616161"
            font.pixelSize: 30
            font.bold: false
            FontLoader {
                source: "./material/fonts/roboto/Roboto-Regular.ttf"
            }
        }

        Item {
            width: parent.width - 10
            height: txt.height + 28
            clip: true
            anchors.horizontalCenter: parent.horizontalCenter

            Text {
                id: txt_hint
                y: 12
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: 16
                text: "введите через пробел поисковый запрос"
                //visible: true//!root.label && !root.value.length
                opacity: 0.26
                //color:  txt.activeFocus ? "#2979ff" :"black"
                //opacity: txt.activeFocus ? 1 : 0.12//root.is_error ? 1:  txt.activeFocus? 1 : 0.12
                visible: !txt.activeFocus //? true : false
            }
            TextEdit {
                id: txt
                width: parent.width - 10
                anchors.horizontalCenter: parent.horizontalCenter
                y: 12
                height: 19 //lineCount * 19
                text: "" //root.value
                //font.pixelSize: 25
                //focus: true
                wrapMode: TextEdit.NoWrap //root.multiline ?  TextEdit.Wrap : TextEdit.NoWrap
                enabled: true
                opacity: 0.87 //root.disabled? 0.26 : 0.87

                cursorDelegate: Rectangle {
                    width: 2
                    height: 16
                    color: "#c2185b" //root.is_error? p2_500 : p1_500
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

                onCursorRectangleChanged: ensureVisible(cursorRectangle)

                function ensureVisible(r) {
                    txt.x = r.x < txt.width ? 0 : txt.width - r.x - 2
                }
            }

            Rectangle {
                y: txt.y + txt.height + 8
                width: parent.width //  - clmn.x
                height: txt.activeFocus ? 2 : 1
                color: txt.activeFocus ? "#2979ff" : "black"
                opacity: txt.activeFocus ? 1 : 0.12 //root.is_error ? 1:  txt.activeFocus? 1 : 0.12
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
            text: "ПОИСК"
            button_color: "#616161"
            enabled: txt.text != ""
            //iconSource: "material/icons/close.svg"
            // ColorOverlay {
            //     anchors.fill: b1
            //     source: b1
            //     color: "#1976d2"
            // }
        }

        EKPSButton {
            id: b
            type: "CANCEL_FINDE_TXT"
            text: "ОТМЕНА"
            button_color: "#616161"
            //iconSource: "material/icons/close.svg"
            // ColorOverlay {
            //     anchors.fill: b
            //     source: b
            //     color: "#1976d2"
            // }
        }
    }

} //конец поиск по ключевым словам
