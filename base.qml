import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Styles 1.4

Item {
    Button {
        id: openFile
        text: "打开"
        height: 40
        width: 100
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.top: parent.top
        anchors.topMargin: 10
        background: Rectangle {
            color: openFile.pressed ? "#1565C0"
                           : openFile.hovered ? "#42A5F5"
                           : "#2196F3"
            radius: 8
        }
        onClicked: {
            console.log("打开按钮被点击了！！！",openFile)
        }
    }

    Button {
        id: closeFile
        text: "关闭"
        height: 40
        width: 100
        anchors.left: openFile.right
        anchors.leftMargin: 10
        anchors.top : parent.top
        anchors.topMargin: 10
        background: Rectangle {
            color: closeFile.pressed ? "#1565C0"
                           : closeFile.hovered ? "#42A5F5"
                           : "#2196F3"
            radius: 8
        }
        onClicked: {
            console.log("关闭按钮被点击了！！！")
            Qt.quit()
        }
    }

    Button {
        id: changeTextColor
        text: "改变文字颜色"
        height: 40
        width: 120
        anchors.left: closeFile.right
        anchors.leftMargin: 10
        anchors.top : parent.top
        anchors.topMargin: 10
        background: Rectangle {
            color: closeFile.pressed ? "#1565C0"
                           : closeFile.hovered ? "#42A5F5"
                           : "#2196F3"
            radius: 8
        }
        onClicked: {
            console.log("改变文字颜色按钮！！！")
        }
    }

    Text {
        id: text1
        text: "文字一"
        height: 40
        width: 120
        anchors.left: changeTextColor.right
        anchors.leftMargin: 10
        anchors.top : parent.top
        anchors.topMargin: 10
    }

    Text {
        id: text2
        text: "文字二"
        height: 40
        width: 120
        anchors.left: text1.right
        anchors.leftMargin: 10
        anchors.top : parent.top
        anchors.topMargin: 10
    }

    //手动绑定信号和槽
    Connections {
        target: changeTextColor
        function onClicked() {
            text1.color = Qt.rgba(Math.random(),Math.random(),Math.random(),1)
            text2.color = Qt.rgba(Math.random(),Math.random(),Math.random(),1)
        }
    }

    //在qml内部定义组件
    Component {
        id: colorRectangleComponent
        Rectangle {
            id: colorRectangle
            height: 50
            width: 50
            color: "red"
            signal sigColor(color col)
            MouseArea {
                anchors.fill: parent
                onPressed: colorRectangle.sigColor(colorRectangle.color)
            }

            Component.onCompleted: {
                //信号绑定槽函数
                colorRectangle.sigColor.connect(slotColor)
            }
            function slotColor(col){
                console.log("组件内部触发",col)
            }

            //捏拉手势
            PinchArea {
                anchors.fill: parent
                pinch.maximumScale: 20
                pinch.minimumScale: 0.2
                pinch.maximumRotation: 180
                pinch.minimumRotation: -180
                pinch.target: colorRectangle
            }
        }
    }

    //使用组件
    Loader {
        id: blueRectangle
        anchors.left: parent.left
        anchors.top: openFile.bottom
        anchors.topMargin: 20
        sourceComponent: colorRectangleComponent
        onLoaded: {
            item.color = "blue"
        }
    }

    Loader {
        id: greeRectangle
        anchors.left: blueRectangle.right
        anchors.leftMargin: 20
        anchors.top: openFile.bottom
        anchors.topMargin: 20
        sourceComponent: colorRectangleComponent
        onLoaded: {
            item.color = "green"
        }
    }

    Connections {
        target: blueRectangle.item
        function onSigColor(col){
            text1.color = col
        }
    }

    Connections {
        target: greeRectangle.item
        function onSigColor(col){
            text1.color = col
        }
    }
}
