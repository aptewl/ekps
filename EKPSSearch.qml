import QtQuick 2.9
import QtGraphicalEffects 1.0
//import QtQuick.Controls 2.2
import QtQuick.Controls 2.2
import QtQuick.Controls.Styles 1.4


//поиск по ключевым словам
Rectangle {
    id: search
    //modal: true
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
    visible: opacity > 0 //изначально форма невидимая
    border.color: "grey"
    border.width: 2

    MouseArea {
        anchors.fill: search
        anchors.margins: -200


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
            anchors.left: parent.left
            clip: true
            anchors.leftMargin: 10
            text: "ПОИСК"
            color: "#616161"
            //font.pixelSize: 30
            font.bold: false
            //            FontLoader {
            //                source: "./Roboto-Regular.ttf"
            //            }
        }
        Label {
            id: lb3
            anchors.left: parent.left
            anchors.topMargin: -10
            clip: true
            anchors.leftMargin: 10
            text: "по трем ключевым словам"
            color: "#616161"
            //font.pixelSize: 30
            font.bold: false
            //            FontLoader {
            //                source: "./Roboto-Regular.ttf"
            //            }
        }

        //        TextInput {
        //            id: txt2
        //            //                width: 80
        //            //                height: 20
        //            text: qsTr("Text Input")
        //            width: parent.width - 10
        //            height: font.pixelSize*6
        //            anchors.horizontalCenter: parent.horizontalCenter
        //            //font.pixelSize: 12
        //        }

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
                text: "введите через пробел"
                opacity: 0.26
                visible: (txt.contentWidth == 0)
            }

            //            Flickable{
            //                anchors.fill: itm
            //                //height: 200
            //                contentHeight: 30


            TextInput/*Edit*/ {
                id: txt
                width: parent.width - 10
                height: font.pixelSize*6
                anchors.horizontalCenter: parent.horizontalCenter
                y: 12
                text: ""
                enabled: true
                opacity: 0.87 //root.disabled? 0.26 : 0.87
                // wrapMode: TextEdit.NoWrap //root.multiline ?  TextEdit.Wrap : TextEdit.NoWrap
                //readOnly: true
                activeFocusOnPress: true
                selectByMouse: true
                //activeFocus:true

                //ScrollBar.vertical: ScrollBar { id: vbar; active: true }


                //onCursorRectangleChanged: itm.ensureVisible(cursorRectangle)
                //                onCursorRectangleChanged: txt.ensureVisible()
                //                function ensureVisible(){
                //                    if (txt.x >= txt.cursorRectangle.x)
                //                        txt.x  = txt.cursorRectangle.x;
                //                    else if (txt.x+txt.width <= txt.cursorRectangle.x+txt.cursorRectangle.width)
                //                        txt.x  = txt.cursorRectangle.x+txt.cursorRectangle.width-txt.width;
                //                    if (txt.y >= txt.cursorRectangle.y)
                //                        txt.y = txt.cursorRectangle.y;
                //                    else if (txt.y+txt.height <= txt.cursorRectangle.y +txt.cursorRectangle.height)
                //                        txt.y = txt.cursorRectangle.y +txt.cursorRectangle.height-txt.height;
                //                }

                cursorDelegate: Rectangle {
                    width: 2
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
                onCursorRectangleChanged: rec_line.y = cursorRectangle.y + 2* txt.font.pixelSize
                //onLineCountChanged: txt.height = txt.lineCount>3 ? txt.font.pixelSize*6 : txt.height
                //                function ensureVisible(r) {
                //                    txt.x = r.x < txt.width ? 0 : txt.width - r.x - 2
                //                }
            }

            //            }

            Rectangle {
                id: rec_line
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
            enabled: txt.contentWidth > 0
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
            //button_color: "#616161"
            button_color: "#ffffff"
            //image_source: "qrc:magnify.svg"
            //h_size: 0
            //w_size: 0
        }
        EKPSButton {
            id: b2
            type: "CLEAR_SEARCH"
            text: "СТЕРЕТЬ"
            button_color: "#616161"
            enabled: txt.contentWidth > 0
            //iconSource: "material/icons/close.svg"
            // ColorOverlay {
            //     anchors.fill: b
            //     source: b
            //     color: "#1976d2"
            // }
        }
    }

} //конец поиск по ключевым словам
