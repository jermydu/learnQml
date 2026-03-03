import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Styles 1.4
import jermydu.ctrl 1.1    //导入自定义的C++导出的类型

Rectangle {
    width: 360
    height: 360

    Text {
        id: labelTest
        text: qsTr("")
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.top: parent.top
        anchors.topMargin: 10
    }

    ColorMaker {
        id: colormaker
        currentColor: Qt.green
    }

    Rectangle {
        id: colorRect
        width: 75
        height: 75
        color: "red"
        anchors.centerIn: parent
    }

    Button {
        id: startBtn
        text: "start"
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        onClicked: {
            colormaker.start()
        }
    }

    Button {
        id: stopBtn
        text: "stop"
        anchors.left: startBtn.right
        anchors.leftMargin: 10
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        onClicked: {
            colormaker.stop()
        }
    }

    Button {
        id: randomBtn
        text: "random"
        anchors.left: stopBtn.right
        anchors.leftMargin: 10
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        onClicked: {
            var algorithm = (colormaker.algorithm() + 1) % 5
            changeAlgorithm(algorithm)
            colormaker.setAlgorithm(algorithm)
        }
    }

    Button {
        id: quitBtn
        text: "quit"
        anchors.left: randomBtn.right
        anchors.leftMargin: 10
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        onClicked: {
            Qt.quit()
        }
    }

    function changeAlgorithm(algorithm) {
        switch(algorithm){
        case 0:
            randomBtn.text = "RandomRGB"
            break
        case 1:
            randomBtn.text = "RandomRed"
            break
        case 2:
            randomBtn.text = "RandomGreen"
            break
        case 3:
            randomBtn.text = "RandomBlue"
            break
        case 4:
            randomBtn.text = "LinearIncrease"
            break
        }
    }

    Component.onCompleted: {
        colormaker.currentColor = Qt.rgba(100,100,100,1)
        colormaker.setAlgorithm(ColorMaker.LinearIncrease)
        changeAlgorithm(colormaker.algorithm())
    }

    Connections {
        target: colormaker
        function onCurrentTime(strTime) {
           labelTest.text = strTime
           labelTest.color = colormaker.timeColor
        }
    }

    Connections {
        target: colormaker
        function onCurrentColorChanged(color) {
           colorRect.color = color
        }
    }
}


