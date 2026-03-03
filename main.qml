import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Styles 1.4
import QtQuick.VirtualKeyboard 2.15

Window {
    id: window
    width: 640
    height: 480
    visible: true
    title: qsTr("这是一个测试demo")

    //Base 测试

    // Base {
    //     id: base
    // }

    //PositionsControl 测试
    // PositionsControl {
    //     id: layoutControl
    // }

    //LayoutControl 测试
    LayoutControl {
        id: layoutControl
    }
}
