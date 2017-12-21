import QtQuick 2.7
import QtGraphicalEffects 1.0
import QtQuick.Controls 2.2
//import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

//Flickable{
//    anchors.fill: parent
//    contentHeight: rs.height

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
    property alias is_liked: swch.checked
    property bool is_liked_conrol
    property alias kl_name: textEdit1.text
    property alias kl_include: textEdit2.text
    property alias adding_includ: textEdit25.text
    property alias kl_not: textEdit3.text
    property alias replased: textEdit4.text


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




    Column {
        id: grid
        anchors.fill: parent
        anchors.topMargin: 30
        spacing: 10
        clip: true

        //        Switch {
        //            id: switch1
        //            text: qsTr(" в закладки")
        //            anchors.left:  parent.left
        //            anchors.leftMargin:  10

        //        }
        EKPSSwitch {
            id: swch
            text: qsTr(" в закладки")
            checked:is_liked
            anchors.right:  parent.right
            anchors.rightMargin:  10
        }

        //        Switch {
        //            id: switch1
        //            //text: qsTr(" в закладки")
        //            anchors.right:  parent.right
        //            anchors.rightMargin:  10
        //            Text {
        //                id:svitch_text
        //                text: qsTr(" в закладки")
        //                anchors.right: switch1.left
        //            }
        //        }


        Label {
            id: lb
            clip: true
            text: "Наименование"
            color: "#616161"
            font.bold: true
            anchors.left: parent.left
            anchors.leftMargin: 10
            // anchors.top: parent.top
            // anchors.topMargin: 30
        }

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
                //font.pixelSize: 12
                focus: true
                text: "adfsdfasgadhf"
                cursorVisible: false
                readOnly: true
                activeFocusOnPress: true
            }
        }
        //-----3-------------------
        Label {
            id: lb2
            clip: true
            anchors.left: parent.left
            anchors.leftMargin: 10
            text: "Включает"
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
                //height: mo.height
                //font.pixelSize: 12
                focus: true
                text: kl_name
                readOnly: true
                activeFocusOnPress: false
            }
        }
        //-----2.5-------------------
        Label {
            id: lb25
            clip: true
            anchors.left: parent.left
            anchors.leftMargin: 10
            text: "Также включает"
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
                //height: mo.height
                //font.pixelSize: 12
                focus: true
                text: adding_includ
                readOnly: true
                activeFocusOnPress: false
            }
        }
        //-------4-----------------
        Label {
            id: lb3
            clip: true
            text: "Не включает "
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
                //height: mo.height
                //font.pixelSize: 12
                focus: true
                text: "adfsdfasgadhf"
                readOnly: true
                activeFocusOnPress: false
            }
        }
        //-----------5-------------
        Label {
            id: lb4
            clip: true
            text: "Перенесено в"
            anchors.left: parent.left
            anchors.leftMargin: 10
            color: "#616161"
            font.bold: true
            visible: textEdit4.text != ""
        }
        Rectangle {
            id: mo4
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
            visible: textEdit4.text != ""
            TextEdit {
                id: textEdit4
                anchors.fill: parent
                wrapMode: TextEdit.Wrap
                width: mo3.width
                //height: mo.height
                //font.pixelSize: 12
                focus: true
                text: "adfsdfasgadhf"
                readOnly: true
                activeFocusOnPress: false
            }
        }

    }

    EKPSButton {
        id: b
        text: 'ЗАКРЫТЬ'
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

//}
