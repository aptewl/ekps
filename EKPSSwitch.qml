import QtQuick 2.6
import QtQuick.Controls 2.1

SwitchDelegate {
    id: control
    //text: qsTr("SwitchDelegate")
    //checked: true

    contentItem: Text {
        rightPadding: control.indicator.width + control.spacing
        text: control.text
        font: control.font
        opacity: enabled ? 1.0 : 0.3
        color: control.down ? "#616161" : "#616161"
        elide: Text.ElideRight
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
    }

    indicator: Rectangle {
        implicitWidth: control.font.pixelSize*1.7//48
        implicitHeight: control.font.pixelSize //26
        x: control.width - width - control.rightPadding
        y: parent.height / 2 - height / 2
        radius: control.font.pixelSize/2//13
        color: control.checked ? "#2979ff" : "transparent"
        border.color: control.checked ? "#2979ff" : "#cccccc"

        Rectangle {
            x: control.checked ? parent.width - width : 0
            width: control.font.pixelSize
            height: control.font.pixelSize
            radius: control.font.pixelSize/2
            color: control.down ? "#cccccc" : "#ffffff"
            border.color: control.checked ? (control.down ? "#2979ff" : "#2979ff") : "#999999"
        }
    }

    background: Rectangle {
        implicitWidth: 100
        implicitHeight: 40
        visible: false//control.down || control.highlighted
        color: control.down ? "#bdbebf" : "#eeeeee"
    }
}
