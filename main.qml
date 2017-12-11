import QtQuick 2.8
import QtQuick.Window 2.2

import QtGraphicalEffects 1.0
//import QtQuick.Controls 2.2
import QtQuick.Controls 2.2
import QtQuick.Controls.Styles 1.4

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

//    MainForm {
//        anchors.fill: parent
//        mouseArea.onClicked: {
//            console.log(qsTr('Clicked on background. Text: "' + textEdit.text + '"'))
//        }
//    }


    Item {
        id: root
        anchors.fill: parent

            //тулбар
            EKPSTool {
                id: toolbar1
            }

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

                FontLoader {
                    id: localFont
                    source: "qrc:Roboto-Regular.ttf"
                }

                delegate: Component {

                    EKPSDelegat {
                        id: rec
                        color: model.color
                        Text {
                            text: model.klass_name
                            elide: Text.ElideRight
                            //font.pixelSize: 14
                            opacity: 0.7
                            renderType: Text.NativeRendering
                            color: "white"
                            font {
                                family: localFont.name
                                //pointSize: 42
                            }
                            anchors.leftMargin: 50
                            anchors.fill: parent
                            verticalAlignment: Text.AlignVCenter
                        }
                    }
                }

            }

//        //поиск по ключевым словам
//        EKPSSearch {
//            id: search
//        }

//        //подробности о классе
//        EKPSInfo {
//            id: info
//        }


    }


}
