import QtQuick 2.9
import QtGraphicalEffects 1.0
import QtQuick.Controls 2.2
import QtQuick.Controls.Styles 1.4

Rectangle {
    id: rec
    width: pythonList.width
    height: delegat_text.font.pixelSize *2.3
    opacity: rec.active ? 0.08 : mouse_primary.containsMouse ? 0.8 : 1
    clip: true

    Rectangle {
        id: colorRect
        height: 0
        width: 0
        color: "#90caf9"
        transform: Translate {
            x: -colorRect.width / 2
            y: -colorRect.height / 2
        }
    }

    MouseArea {
        id: mouse_primary
        anchors.fill: parent
        hoverEnabled: true

        onClicked: {
            info.is_liked  = heart.visible
            info.is_liked_conrol  = heart.visible
            info.kl_name = qsTr(delegat_text.text)
            info.kl_include = qsTr(classListmodel.getCurKlInclude(delegat_text.text))
            info.adding_includ = qsTr(classListmodel.getCurKlAddInclude(delegat_text.text))
            info.kl_not = qsTr(classListmodel.getCurKlNotInclude(delegat_text.text))
            info.replased = qsTr(classListmodel.getCurKlReplaced(delegat_text.text))
            info.opacity = 1
            fl.visible = true
            fl.z = 800
            fl.contentY = root.y
            circleAnimation2.start()
        }
        onPressed: {
            colorRect.x = mouseX
            colorRect.y = mouseY
            circleAnimation.start()
        }
        onReleased: circleAnimation.stop()
        onPositionChanged: circleAnimation.stop()

        Item {//show heart for delegats who select as "in bookmarks"
            id: heart
            property color overlayColor: "#000000"
            visible: model.Is_liked_Role == 1 ? true : false
            anchors.top: parent.top
            anchors.topMargin: 0.25 * parent.height
            Image {
                id: img
                sourceSize.width: 0.25 * parent.height
                sourceSize.height: 0.25 * parent.height
                source: "qrc:icons/google_icons/heart.svg"
                smooth: true
            }
            ColorOverlay {
                anchors.fill: img
                source: img
                color: "#eeeeee"
            }
        }
    }

    PropertyAnimation {
        id: circleAnimation
        target: colorRect // The aim Asking circular background
        properties: "width,height,radius" // In animation, change the height, width and radius
        from: 0
        to: rec.width
        duration: 600
        onStopped: {
            colorRect.width = 0
            colorRect.height = 0
        }
    }

    PropertyAnimation {
        id: circleAnimation2
        target: info
        properties: "opacity" // In animation, change the opacity
        from: 0 // Change the settings from 0  ...
        to: 1
        duration: 600 // within 600 milliseconds
    }
}
