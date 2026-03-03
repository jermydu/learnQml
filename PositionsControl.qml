import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Styles 1.4

Rectangle {
    id: itemRoot
    color: "#EEEEEE"
    anchors.fill: parent

    Text {
        id: textCenter
        text: qsTr("hello 你好")
        anchors.centerIn: parent
        font.pixelSize: 24
        font.bold: true
    }

    function setTextColor(cl){
        textCenter.color = cl
    }

    //Row 定位器
    Row {
        anchors.left: parent.left
        anchors.leftMargin: 5
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 5
        spacing: 5

        ColorPicker {
            id: rowColorPicker1
            color: Qt.rgba(Math.random(),Math.random(),Math.random(),1.0)

            //使用Connections连接 注意target:colorPicker1要用组件实列的id
            Connections {
                target: rowColorPicker1
                function onSigColor(col){
                    setTextColor(col)
                }
            }
        }

        ColorPicker {
            id: rowColorPicker2
            color: Qt.rgba(Math.random(),Math.random(),Math.random(),1.0)
            onSigColor: setTextColor(col)
        }

        ColorPicker {
            id: rowColorPicker3
            color: Qt.rgba(Math.random(),Math.random(),Math.random(),1.0)
            onSigColor: setTextColor(col)  //直接用onSigColor
        }

        ColorPicker {
            id: rowColorPicker4
            color: Qt.rgba(Math.random(),Math.random(),Math.random(),1.0)
            onSigColor: setTextColor(col)
        }
    }

    //Column 定位器
    Column {
        anchors.left: parent.left
        anchors.leftMargin: 5
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 100
        spacing: 5

        ColorPicker {
            id: columnColorPicker1
            color: Qt.rgba(Math.random(),Math.random(),Math.random(),1.0)

            //使用Connections连接 注意target:colorPicker1要用组件实列的id
            Connections {
                target: columnColorPicker1
                function onSigColor(col){
                    setTextColor(col)
                }
            }
        }

        ColorPicker {
            id: columnColorPicker2
            color: Qt.rgba(Math.random(),Math.random(),Math.random(),1.0)
            onSigColor: setTextColor(col)
        }

        ColorPicker {
            id: columnColorPicker3
            color: Qt.rgba(Math.random(),Math.random(),Math.random(),1.0)
            onSigColor: setTextColor(col)  //直接用onSigColor
        }

        ColorPicker {
            id: columnColorPicker4
            color: Qt.rgba(Math.random(),Math.random(),Math.random(),1.0)
            onSigColor: setTextColor(col)
        }
    }

    //Grid 定位器
    Grid {
        anchors.right: parent.right
        anchors.rightMargin: 5
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 100
        rows: 3
        columns: 3
        rowSpacing: 5
        columnSpacing: 5
        flow: Grid.LeftToRight

        ColorPicker {
            id: gridColorPicker1
            color: Qt.rgba(Math.random(),Math.random(),Math.random(),1.0)

            //使用Connections连接 注意target:colorPicker1要用组件实列的id
            Connections {
                target: gridColorPicker1
                function onSigColor(col){
                    setTextColor(col)
                }
            }
        }

        ColorPicker {
            id: gridColorPicker2
            color: Qt.rgba(Math.random(),Math.random(),Math.random(),1.0)
            onSigColor: setTextColor(col)
        }

        ColorPicker {
            id: gridColorPicker3
            color: Qt.rgba(Math.random(),Math.random(),Math.random(),1.0)
            onSigColor: setTextColor(col)  //直接用onSigColor
        }

        ColorPicker {
            id: gridColorPicker4
            color: Qt.rgba(Math.random(),Math.random(),Math.random(),1.0)
            onSigColor: setTextColor(col)
        }

        ColorPicker {
            id: gridColorPicker5
            color: Qt.rgba(Math.random(),Math.random(),Math.random(),1.0)
            onSigColor: setTextColor(col)
        }

        ColorPicker {
            id: gridColorPicker6
            color: Qt.rgba(Math.random(),Math.random(),Math.random(),1.0)
            onSigColor: setTextColor(col)
        }

        ColorPicker {
            id: gridColorPicker7
            color: Qt.rgba(Math.random(),Math.random(),Math.random(),1.0)
            onSigColor: setTextColor(col)
        }
    }

    //Flow 定位器
    Flow {
        anchors.top: parent.top
        anchors.topMargin: 5
        anchors.left: parent.left
        anchors.leftMargin: 5
        width: 200
        height: 100
        flow: Grid.LeftToRight

        ColorPicker {
            id: flowColorPicker1
            color: Qt.rgba(Math.random(),Math.random(),Math.random(),1.0)

            //使用Connections连接 注意target:colorPicker1要用组件实列的id
            Connections {
                target: flowColorPicker1
                function onSigColor(col){
                    setTextColor(col)
                }
            }
        }

        ColorPicker {
            id: flowColorPicker2
            color: Qt.rgba(Math.random(),Math.random(),Math.random(),1.0)
            onSigColor: setTextColor(col)
        }

        ColorPicker {
            id: flowColorPicker3
            color: Qt.rgba(Math.random(),Math.random(),Math.random(),1.0)
            onSigColor: setTextColor(col)  //直接用onSigColor
        }

        ColorPicker {
            id: flowColorPicker4
            color: Qt.rgba(Math.random(),Math.random(),Math.random(),1.0)
            onSigColor: setTextColor(col)
        }

        ColorPicker {
            id: flowColorPicker5
            color: Qt.rgba(Math.random(),Math.random(),Math.random(),1.0)
            onSigColor: setTextColor(col)
        }

        ColorPicker {
            id: flowColorPicker6
            color: Qt.rgba(Math.random(),Math.random(),Math.random(),1.0)
            onSigColor: setTextColor(col)
        }

        ColorPicker {
            id: flowColorPicker7
            color: Qt.rgba(Math.random(),Math.random(),Math.random(),1.0)
            onSigColor: setTextColor(col)
        }
    }
}
