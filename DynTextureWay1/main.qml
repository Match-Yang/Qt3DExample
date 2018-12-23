import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Scene3D 2.0

ApplicationWindow {
    id: window
    visible: true
    width: 640
    height: 480
    title: qsTr("DynTexture")


    Scene3D {
        anchors.fill: parent
        aspects: ["render", "logic", "input"]

        RootScene {

        }
    }
}
