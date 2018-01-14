import QtQuick 2.9
import QtGraphicalEffects 1.0
import QtQuick.Controls 2.2
import QtQuick.Controls.Styles 1.4

Rectangle {
    id: rs
    opacity: 0
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.top: parent.top
    height: mo.height+ lb.height+ swch.height+
            mo2.height+ lb2.height+ mo25.height+
            lb25.height+  mo3.height+ lb3.height+
            mo4.height/*+ lb4.height*/ + 3*b.height

    anchors.leftMargin: 5 * parent.width / 100
    anchors.rightMargin: 5 * parent.width / 100
    anchors.topMargin: 70
    anchors.bottomMargin: 70
    color: "#e3f2fd"
    radius: 8
    visible: opacity > 0 //initially form invisible
    border.color: "grey"
    border.width: 2
    property alias is_liked: swch.checked
    property bool is_liked_conrol
    property alias kl_name: textEdit1.text
    property alias kl_include: textEdit2.text
    property alias adding_includ: textEdit25.text
    property alias kl_not: textEdit3.text
    property alias replased: textEdit4.text


    PropertyAnimation {
        id: circleAnimation9
        target: rs
        properties: "opacity" // In animation, change the opacity
        from: 1 // Change the settings from 1  ...
        to: 0
        duration: 600
    }

    MouseArea {
        anchors.fill: parent
    }

    Column {
        id: grid
        anchors.fill: parent
        anchors.topMargin: 30
        spacing: 10

        EKPSSwitch {
            id: swch
            text: qsTr(" в закладки")
            checked:is_liked
            anchors.right:  parent.right
            anchors.rightMargin:  10
        }

        Label {
            id: lb
            clip: true
            text: qsTr("Наименование")
            color: "#616161"
            font.bold: true
            anchors.left: parent.left
            anchors.leftMargin: 10
        }
        //-----------1-------------
        Rectangle {
            id: mo
            width: 95 * parent.width/100
            anchors.left: parent.left
            anchors.leftMargin: 20
            anchors.right: parent.right
            anchors.rightMargin: 10
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
                text: ""
                horizontalAlignment: Text.AlignLeft
                cursorVisible: true
                readOnly: true
                selectByMouse: true
            }
        }
        //-----------2-------------
        Rectangle {
            id: mo4
            width: 95 * parent.width/100
            height: textEdit4.contentHeight + 10
            anchors.left: parent.left
            anchors.leftMargin: 20
            anchors.right: parent.right
            anchors.rightMargin: 10
            border.width: 1
            border.color: "#ff3300"
            radius: 10
            clip: true
            visible: textEdit4.text != ""
            TextEdit {
                id: textEdit4
                anchors.fill: parent
                wrapMode: TextEdit.Wrap
                width: mo4.width
                focus: true
                text: ""
                color: "#ff3300"
                //cursorVisible: false
                readOnly: true
                //selectByMouse: true
            }
        }
        //-----3-------------------
        Label {
            id: lb2
            clip: true
            anchors.left: parent.left
            anchors.leftMargin: 10
            text: qsTr("Включает")
            color: "#616161"
            font.bold: true
            visible: textEdit2.text != ""
        }
        Rectangle {
            id: mo2
            width: 95 * parent.width/100
            height: textEdit2.contentHeight + 10
            anchors.left: parent.left
            anchors.leftMargin: 20
            anchors.right: parent.right
            anchors.rightMargin: 10
            border.width: 1
            border.color: "#2979ff"
            radius: 10
            clip: true
            visible: textEdit2.text != ""
            TextEdit {
                id: textEdit2
                anchors.fill: parent
                wrapMode: TextEdit.Wrap
                width: mo2.width
                focus: true
                text: kl_name
                horizontalAlignment: Text.AlignLeft
                //cursorVisible: false
                readOnly: true
                //selectByMouse: true
            }
        }
        //-----4-------------------
        Label {
            id: lb25
            clip: true
            anchors.left: parent.left
            anchors.leftMargin: 10
            text: qsTr("Также включает")
            color: "#616161"
            font.bold: true
            visible: textEdit25.text != ""
        }
        Rectangle {
            id: mo25
            width: 95 * parent.width/100
            height: textEdit25.contentHeight + 10
            anchors.left: parent.left
            anchors.leftMargin: 20
            anchors.right: parent.right
            anchors.rightMargin: 10
            border.width: 1
            border.color: "#2979ff"
            radius: 10
            clip: true
            visible: textEdit25.text != ""
            TextEdit {
                id: textEdit25
                anchors.fill: parent
                wrapMode: TextEdit.Wrap
                width: mo25.width
                focus: true
                text: adding_includ
                //cursorVisible: false
                readOnly: true
                //selectByMouse: true
            }
        }
        //-------5-----------------
        Label {
            id: lb3
            clip: true
            text: qsTr("Не включает ")
            anchors.left: parent.left
            anchors.leftMargin: 10
            color: "#616161"
            font.bold: true
            visible: textEdit3.text != ""
        }
        Rectangle {
            id: mo3
            width: 95 * parent.width/100
            height: textEdit3.contentHeight + 10
            anchors.left: parent.left
            anchors.leftMargin: 20
            anchors.right: parent.right
            anchors.rightMargin: 10
            border.width: 1
            border.color: "#2979ff"
            radius: 10
            clip: true
            visible: textEdit3.text != ""
            TextEdit {
                id: textEdit3
                anchors.fill: parent
                wrapMode: TextEdit.Wrap
                width: mo3.width
                focus: true
                //cursorVisible: false
                readOnly: true
                //selectByMouse: true
            }
        }
    }

    EKPSButton {
        id: b
        text: qsTr('ЗАКРЫТЬ')
        type: 'CANCEL_INFO'
        button_color: "#616161"
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.margins: 15
    }
}
