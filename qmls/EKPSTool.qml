import QtQuick 2.9
import QtGraphicalEffects 1.0
import QtQuick.Controls 2.2
import QtQuick.Controls.Styles 1.4

Rectangle {
    id: toolbar
    width: parent.width
    height: bt.height + 2*text2.height
    color: "#2979ff"
    border.width: 0
    clip: true

    EKPSButton {
        id: bt
        anchors.left: parent.left
        anchors.leftMargin: 16
        anchors.top: parent.top
        anchors.topMargin: 8
        type: 'MENU_WIEW'
        button_color: "#ffffff"
        image_source: "qrc:icons/google_icons/menu.svg"
        h_size: 50//parent.height / 3  //min 40, max 56
        w_size: 50//1.2*h_size         //min 40, max 56
        // if it is necessary to take into account the sizes
        // of the screens of different telephons and tablets,
        // then to dissolve
    }

    Text {
        id: text1
        color: "#ffffff"
        text: qsTr("ЕКПС")
        anchors.top: parent.top
        anchors.topMargin: 8
        anchors.left: bt.right
        anchors.leftMargin: 0
        anchors.right: bt2.left
        anchors.rightMargin: 0
        horizontalAlignment: Text.AlignHCenter
    }

    EKPSButton {
        id: bt2
        anchors.right: bt3.left
        anchors.rightMargin: 8
        anchors.top: parent.top
        anchors.topMargin: 8
        type: 'FINDE_DIALOG_SHOW'
        button_color: "#ffffff"
        image_source: "qrc:icons/google_icons/magnify.svg"
        h_size: bt.h_size
        w_size: bt.w_size
    }

    EKPSButton {
        id: bt3
        anchors.right: parent.right
        anchors.rightMargin: 16
        anchors.top: parent.top
        anchors.topMargin: 8
        type: 'LIKE'
        button_color: "#ffffff"
        image_source: "qrc:icons/google_icons/heart.svg"
        //image_source: "qrc:star.svg"
        h_size:bt.h_size
        w_size: bt.w_size
    }

    Text {
        id: text2
        color: "#ffffff"
        text: qsTr("Единый кодификатор предметов снабжения")
        clip: true
        anchors.left: parent.left
        anchors.leftMargin: 5
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        anchors.top: bt.bottom
        anchors.topMargin: 8
    }

    PropertyAnimation {
        id: circleAnimation4
        target: search
        properties: "opacity" // In animation, change the opacity
        from: 0 // Change the settings from 0  ...
        to: 1
        duration: 600 // within 600 milliseconds
    }
}
