import QtQuick 2.0
import QtGraphicalEffects 1.0
import QtQuick.Controls 2.2
import QtQuick.Controls.Styles 1.4

Rectangle {
    id: toolbar
    width: parent.width
    height: parent.height/7
    color: "#2979ff"
    border.width: 0


    EKPSbutton {
        id: bt
        anchors.left: parent.left
        anchors.leftMargin: 0
        type: 'MENU_WIEW'
        button_color: "#ffffff"
        image_source : "qrc:menu.svg"
        h_size : parent.height/3
        w_size : h_size
    }

    Text {
        id: text1
        color: "#ffffff"
        text: qsTr("ЕКПС")
        anchors.top: parent.top
        anchors.topMargin: 7
        anchors.left: bt.right
        anchors.leftMargin: 0
        anchors.right: bt2.left
        anchors.rightMargin: 0
        horizontalAlignment: Text.AlignHCenter
        //font.pixelSize: 12
    }

    EKPSbutton {
        id: bt2
        anchors.right: bt3.left
        anchors.rightMargin: 10
        type: 'FINDE_DIALOG_SHOW'
        button_color: "#ffffff"
        image_source : "qrc:magnify.svg"
        h_size : parent.height/3
        w_size : h_size
    }



    EKPSbutton {
        id: bt3
        anchors.right: parent.right
        anchors.rightMargin: 0
        type: 'LIKE'
        button_color: "#ffffff"
        image_source : "qrc:heart.svg"
        h_size : parent.height/3
        w_size : h_size
    }

    Text {
        id: text2
        color: "#ffffff"
        text: qsTr("Единый кодификатор предметов снабжения")
        anchors.left: parent.left
        anchors.leftMargin: 22
        fontSizeMode: Text.HorizontalFit
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        anchors.top: text1.bottom
        anchors.topMargin: 15
        //font.pixelSize: 12
    }
}
