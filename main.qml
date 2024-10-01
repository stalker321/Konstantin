import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Animation")

    Rectangle {
        id: scene
        anchors.fill: parent
        //state
        state: "LeftState"

        Rectangle {
            id: leftRect
            x: parent.width * 0.25
            anchors.verticalCenter: parent.verticalCenter
            color: "lightgrey"
            width: 100
            height: 100
            border.color: "black"
            border.width: 3
            radius: 5
            //text
            Text {
                anchors.centerIn: parent
                text: "Move"
                font.family: "Unispace"
                font.pixelSize: 20
            }
            //click
            MouseArea {
                anchors.fill: parent
                onClicked: if (ball.x < rightRect.x)  {
                           ball.x += 30;
                           scene.state = "StepRight";}
                           else {scene.state = "LeftState";}
            }
        }

        Rectangle {
            id: rightRect
            x: parent.width * 0.65
            anchors.verticalCenter: parent.verticalCenter
            color: "lightgrey"
            width: 100
            height: 100
            border.color: "black"
            border.width: 3
            radius: 5
            //text
            Text {
                anchors.centerIn: parent
                text: "Return"
                font.family: "Unispace"
                font.pixelSize: 20
            }

            //click
            MouseArea {
                anchors.fill: parent
                onClicked: scene.state = "LeftState"
            }
        }

        Rectangle {
            id: ball
            color: "darkred"
            x:leftRect.x +2.5
            y: leftRect.y +2.5
            width: leftRect.width - 5
            height: leftRect.height - 5
            radius: width/2
        }

        states: [
            State {
                name: "StepRight"
                PropertyChanges {
                    target: ball
                    x: ball.x
                }
            },
            State {
                name: "LeftState"
                PropertyChanges {
                    target: ball
                    x:leftRect.x + 2.5
                }
            }

        ]

        transitions: [
            Transition {
                from: "StepRight"
                to: "LeftState"

                NumberAnimation {
                    properties: "x,y"
                    duration: 1000
                    easing.type: Easing.bezierCurve
                }
            }
        ]
    }
}
