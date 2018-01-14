import QtQuick 2.9
import QtQuick.Window 2.2
import QtGraphicalEffects 1.0
import QtQuick.Controls 2.2
import QtQuick.Controls.Styles 1.4

Window {
    visible: true
    width: 640
    height: 480

    Item {
        id: root
        anchors.fill: parent
        clip: true

        //toolbar
        EKPSTool {
            id: toolbar1
        }

        //list of classes EKPS
        ListView {
            id: pythonList
            model: classListmodel
            width: parent.width
            height: parent.height - 100
            anchors.top: toolbar1.bottom
            z: 4
            clip : true
            ScrollBar.vertical: ScrollBar {
                width: 50
                height:50
            }
            //each class from the list of classes EKPS
            delegate: Component {
                EKPSDelegat {
                    id: rec
                    color: model.color
                    Text {
                        id:delegat_text
                        text: qsTr(model.klass_name)
                        elide: Text.ElideRight
                        opacity: 0.7
                        renderType: Text.NativeRendering
                        color: "white"
                        anchors.leftMargin: 50
                        anchors.fill: parent
                        verticalAlignment: Text.AlignVCenter
                    }
                }
            }
        }

        //keyword search form
        EKPSSearch {
            id: search
            visible_position : 12
        }

        //class details form
        Flickable {
            id:fl
            anchors.fill: root
            contentHeight: info.height+100
            visible: false
            EKPSInfo {
                id: info
            }
        }
    }
}
