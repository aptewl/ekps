import QtQuick 2.7
import QtQuick 2.0
import QtGraphicalEffects 1.0
import QtQuick.Controls 2.2
import QtQuick.Controls.Styles 1.4

Button {
    id: bt2
    property string type
    property alias button_color: co.color //= "#ffffff"
    property alias image_source: image.source
    property alias h_size: rcbtn.implicitHeight
    property alias w_size: rcbtn.implicitWidth
    property alias btn_img_visible: co.visible





    contentItem: Text {
        text: bt2.text
        font: bt2.font
        opacity: enabled ? 1.0 : 0.3
        color: bt2.down ? "#2979ff" : "#2196f3"
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        elide: Text.ElideRight
    }

    background: Rectangle {
        id: rcbtn
        implicitHeight: h_size
        implicitWidth: w_size
        border.color: "transparent"
        color: "transparent"
    }
    Image {
        id: image
        anchors.fill: bt2
        source: image_source
        sourceSize.width: parent.width
        sourceSize.height: parent.height

    }
    ColorOverlay {
        id: co
        visible: btn_img_visible
        anchors.fill: bt2
        source: image
        color: button_color
    }

    Rectangle {
        id: colorRect
        z: 400
        height: 0
        width: 0
        radius: 180
        color: "#b6e1fc"
        //opacity: 0.7
        transform: Translate {
            x: -colorRect.width / 2
            y: -colorRect.height / 2
        }
    }

    MouseArea {
        id: mouse_primary
        anchors.fill: parent
        hoverEnabled: false

        onClicked: {
            colorRect.x = mouseX
            colorRect.y = mouseY
            circleAnimation.start()

            if (bt2.type == "CANCEL_FINDE_TXT") {
                circleAnimation6.start()
                if(txt.text == ""){
                    classListmodel.showAll()
                }
            }

            if (bt2.type == "CANCEL_INFO") {
                circleAnimation9.start()
//                console.log(info.is_liked_conrol )
//                console.log(info.is_liked)
                if(info.is_liked_conrol != info.is_liked){
                    console.log("не равны")
                    classListmodel.liked_to_NO_liked(info.kl_name, info.is_liked)
                }
            }

            if (bt2.type == "FINDE_DIALOG_SHOW") {
                circleAnimation4.start()
            }

            if (bt2.type == "FINDE_TXT") {
                if (txt.text.length != 0) {
                    circleAnimation3.start()
                    //txt.editingFinished()
                    classListmodel.searchContext(txt.text)
                }
            }

            if (bt2.type == "LIKE") {
                if (bt2.state == 'down') {
                    bt2.state = ""
                    classListmodel.showAll()
                } else {
                    bt2.state = 'down'
                    //classListmodel.data_change_only_liked()
                    classListmodel.showOnlyLiked()
                }
            }

            if (bt2.type == "MENU_WIEW") {
                if (bt2.state == 'down') {
                    bt2.state = ""
                } else {
                    bt2.state = 'down'
                }
            }

            if (bt2.type == "CLEAR_SEARCH") {
                txt.text="";
                txt.focus = false;
            }

        }
    }

    PropertyAnimation {
        id: circleAnimation
        target: colorRect // The aim Asking circular background
        properties: "width,height" // In animation, change the height, width and radius
        from: 0 // Change the settings from 0 pixels ...
        to: bt2.width * 3
        duration: 300
        onStopped: {
            colorRect.width = 0
            colorRect.height = 0
        }
    }

    states: State {
        name: "down"
        PropertyChanges {
            target: bt2
            rotation: 180
        }
    }

    transitions: Transition {
        from: ""
        to: "down"
        reversible: true
        ParallelAnimation {
            NumberAnimation {
                properties: "rotation"
                duration: 500
                easing.type: Easing.InOutQuad
            }
        }
    }
}
