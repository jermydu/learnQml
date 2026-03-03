import QtQuick 2.15

Rectangle {
    id: colorRectangle
    height: 50
    width: 50
    color: "red"

    signal sigColor(color col)  //组件根节点的信号属性会暴露给组件

    MouseArea {
        anchors.fill: parent
        onPressed: colorRectangle.sigColor(colorRectangle.color)
    }
}
