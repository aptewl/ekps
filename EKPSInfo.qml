import QtQuick 2.7
import QtGraphicalEffects 1.0
//import QtQuick.Controls 2.2
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

Rectangle {
    z: 200
    id: rs
    opacity: 0
    anchors.fill: parent
    anchors.leftMargin: 5 * parent.width / 100
    anchors.rightMargin: 5 * parent.height / 100
    anchors.topMargin: 70
    anchors.bottomMargin: 70
    //ScrollView: true
    color: "#e3f2fd"
    radius: 8
    visible: opacity > 0 //изначально форма невидимая
    border.color: "grey"
    border.width: 2
    //property alias gr_name: "Группа 10 Предметы гигиены "
    property alias kl_name: textEdit1.text
    property alias kl_include: textEdit2.text
    property alias kl_not: textEdit3.text

    // property alias kl_also: "Гели"
    // property alias kl_comment: "Предметы перенесены"
    PropertyAnimation {
        id: circleAnimation9
        target: rs // The aim Asking circular background
        properties: "opacity" // In animation, change the height, width and radius
        from: 1 // Change the settings from 0 pixels ...
        to: 0
        duration: 600
    }

    MouseArea {
        anchors.fill: root
    }

    Row {
        id: grid
        anchors.fill: parent
        //columns: 3
        spacing: 10
        //anchors.verticalCenter: parent.verticalCenter
        clip: true

        Item {
            height: 30
            width: 10
        }
        Item {
            height: 30
            width: 10
        }
        Item {
            height: 30
            width: 10
        }
        //------2------------
        Item {
            height: 30
            width: 10
        }

        Label {
            id: lb
            clip: true
            text: "Наименование"
            color: "#616161"
            font.bold: true
        }

        Rectangle {
            id: mo
            width: rs.width - lb.width - 50
            height: textEdit1.contentHeight + 10
            border.width: 1
            border.color: "#2979ff"
            radius: 10
            clip: true
            TextEdit {
                id: textEdit1
                anchors.fill: parent
                wrapMode: TextEdit.Wrap
                width: mo.width
                height: mo.height
                //font.pixelSize: 12
                focus: true
                text: "adfsdfasgadhf"
                cursorVisible: false
                readOnly: true
                activeFocusOnPress: true
            }
        }
        //-----3-------------------
        Item {
            height: 30
            width: 10
        }

        Label {
            id: lb2
            clip: true
            text: "Включает    "
            color: "#616161"
            font.bold: true
        }
        Rectangle {
            id: mo2
            width: rs.width - lb.width - 60
            height: textEdit2.contentHeight + 10
            border.width: 1
            border.color: "#2979ff"
            radius: 10
            clip: true
            TextEdit {
                id: textEdit2
                anchors.fill: parent
                wrapMode: TextEdit.Wrap
                width: mo.width
                //height: mo.height
                //font.pixelSize: 12
                focus: true
                text: kl_name
                readOnly: true
                activeFocusOnPress: false
            }
        }
        //-------4-----------------
        Item {
            height: 30
            width: 10
        }

        Label {
            id: lb3
            clip: true
            text: "Не включает "
            color: "#616161"
            font.bold: true
        }
        Rectangle {
            id: mo3
            width: rs.width - lb.width - 60
            height: textEdit3.contentHeight + 10
            border.width: 1
            border.color: "#2979ff"
            radius: 10
            clip: true
            TextEdit {
                id: textEdit3
                anchors.fill: parent
                wrapMode: TextEdit.Wrap
                width: mo.width
                height: mo.height
                //font.pixelSize: 12
                focus: true
                text: "adfsdfasgadhf"
                readOnly: true
                activeFocusOnPress: false
            }
        }
        //-----------5-------------
        Item {
            height: 30
            width: 10
        }
    }

    EKPSButton {
        id: b
        text: 'ОТМЕНА'
        type: 'CANCEL_INFO'
        button_color: "#616161"
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.margins: 15
        // ColorOverlay {
        //     anchors.fill: b
        //     source: b
        //     color: "#1976d2"
        // }
    }
}
