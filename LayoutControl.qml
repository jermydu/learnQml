import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3
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

    //RowLayout 布局
    RowLayout {
        anchors.left: parent.left
        anchors.leftMargin: 5
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 5
        spacing: 5
        width: 300

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
            Layout.fillWidth: true  //填充所有可用宽度
            color: Qt.rgba(Math.random(),Math.random(),Math.random(),1.0)
            onSigColor: setTextColor(col)
        }
    }

    //ColumnLayout 布局
    ColumnLayout {
        anchors.left: parent.left
        anchors.leftMargin: 5
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 100
        spacing: 5
        height: 250

        ColorPicker {
            id: columnColorPicker1
            Layout.fillHeight: true  //填充所有可用高度
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

    //GridLayout 布局
    GridLayout {
        anchors.right: parent.right
        anchors.rightMargin: 5
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 100
        width: 150    //GridLayout宽度
        rows: 3
        columns: 3
        rowSpacing: 5
        columnSpacing: 5
        flow: GridLayout.LeftToRight

        ColorPicker {
            id: gridColorPicker1
            color: Qt.rgba(Math.random(),Math.random(),Math.random(),1.0)
            Layout.rowSpan: 2     //gridColorPicker1 占用两行两列
            Layout.columnSpan: 2  //

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
            Layout.fillWidth: true  //填充所有可用宽度
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
}
