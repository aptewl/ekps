import QtQuick 2.0
import QtGraphicalEffects 1.0
import QtQuick.Controls 2.2
import QtQuick.Controls.Styles 1.4

Rectangle {
    id: rec
    width: pythonList.width
    height: 50
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

            //id.gr_name: "Группа 10 Предметы гигиены "
            info.kl_name = "тестовые данные"/*model.one_class.kl_name*/
            info.kl_include = "тестовые данные по точу.ю что включает"/*model.include_role*/
            info.kl_not = "Электрические боитвы"
            //id.kl_also: "Гели"
            //id.kl_comment: "Предметы перенесены"
            info.opacity = 1
            circleAnimation2.start()
            //тут заолнение подробного просмотра
        }
        onPressed: {
            colorRect.x = mouseX
            colorRect.y = mouseY
            circleAnimation.start()
        }
        onReleased: circleAnimation.stop()
        onPositionChanged: circleAnimation.stop()

        Item {
            //сердечко
            property color overlayColor: "#000000"
            visible: model.Is_liked_Role == "1" ? true : false
            Image {
                id: img
                sourceSize.width: 25
                sourceSize.height: 25
                source: "qrc:heart.svg"
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
        to: rec.width * 3
        duration: 600
        onStopped: {
            colorRect.width = 0
            colorRect.height = 0
        }
    }

    PropertyAnimation {
        id: circleAnimation2
        target: info // The aim Asking circular background
        properties: "opacity" // In animation, change the height, width and radius
        from: 0 // Change the settings from 0 pixels ...
        to: 1
        duration: 600 // within 300 milliseconds
    }
}
