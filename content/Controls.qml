/****************************************************************************
**
** Copyright (C) 2013 Digia Plc and/or its subsidiary(-ies).
** Contact: http://www.qt-project.org/legal
**
** This file is part of the Qt Quick Controls module of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:BSD$
** You may use this file under the terms of the BSD license as follows:
**
** "Redistribution and use in source and binary forms, with or without
** modification, are permitted provided that the following conditions are
** met:
**   * Redistributions of source code must retain the above copyright
**     notice, this list of conditions and the following disclaimer.
**   * Redistributions in binary form must reproduce the above copyright
**     notice, this list of conditions and the following disclaimer in
**     the documentation and/or other materials provided with the
**     distribution.
**   * Neither the name of Digia Plc and its Subsidiary(-ies) nor the names
**     of its contributors may be used to endorse or promote products derived
**     from this software without specific prior written permission.
**
**
** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
** "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
** LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
** A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
** OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
** SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
** LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
** DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
** THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
** (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
** OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE."
**
** $QT_END_LICENSE$
**
****************************************************************************/





import QtQuick 2.1
import QtQuick.Controls 1.1
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.1


Item {
    id: flickable
    anchors.fill: parent
    enabled: enabledCheck.checked

    property int tabPosition: tabPositionGroup.current === r2 ? Qt.BottomEdge : Qt.TopEdge

    RowLayout {
        id: contentRow
        anchors.fill:parent
        anchors.margins: 8
        spacing: 16
        ColumnLayout {
            id: firstColumn
            Layout.minimumWidth: implicitWidth
            Layout.fillWidth: false

            RowLayout {
                Rectangle {
                    id: myRect
                    Text {
                        id: allText
                        text: "All"
                        Layout.fillWidth: true
                    }

                    states: [
                        State {
                            name: "clicked"
                            PropertyChanges { target: myRect; color: "red" }
                        }
                    ]
                    Layout.fillWidth: true
                    height: childrenRect.height

                    MouseArea {
                        anchors.fill: parent
                        onClicked: qmlSignal("all") // myRect.color = (myRect.color == "#808080") ? "red" : "#808080"
                    }
                }
            }


            RowLayout {
                Text {
                    text: "Downloading"
                    Layout.fillWidth: true
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: qmlSignal("downloading")
                }
            }

            RowLayout {
                Text {
                    text: "Completed"
                    Layout.fillWidth: true
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: qmlSignal("completed")
                }
            }

            RowLayout {
                Text {
                    text: "Active"
                    Layout.fillWidth: true
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: qmlSignal("active")
                }
            }

            RowLayout {
                Text {
                    text: "Inactive"
                    Layout.fillWidth: true
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: qmlSignal("inactive")
                }
            }
            /*
            RowLayout {
                id: buttonrow
                Button {
                    id: button1
                    text: "Button 1"
                    tooltip:"This is an interesting tool tip"
                    Layout.fillWidth: true
                }
                Button {
                    id:button2
                    text:"Button 2"
                    Layout.fillWidth: true
                    menu: Menu {
                        MenuItem { text: "This Button" }
                        MenuItem { text: "Happens To Have" }
                        MenuItem { text: "A Menu Assigned" }
                    }
                }
            }
            ComboBox {
                id: combo
                model: choices
                currentIndex: 2
                Layout.fillWidth: true
            }
            ComboBox {
                model: Qt.fontFamilies()
                Layout.fillWidth: true
                currentIndex: 47
            }
            ComboBox {
                id: editableCombo
                editable: true
                model: choices
                Layout.fillWidth: true
                currentIndex: 2
                onAccepted: {
                    if (editableCombo.find(currentText) === -1) {
                        choices.append({text: editText})
                        currentIndex = editableCombo.find(editText)
                    }
                }
            }
            RowLayout {
                SpinBox {
                    id: t1
                    Layout.fillWidth: true
                    minimumValue: -50
                    value: -20
                }
                SpinBox {
                    id: t2
                    Layout.fillWidth: true
                }
            }
            TextField {
                id: t3
                placeholderText: "This is a placeholder for a TextField"
                Layout.fillWidth: true
            }
            ProgressBar {
                // normalize value [0.0 .. 1.0]
                value: (slider.value - slider.minimumValue) / (slider.maximumValue - slider.minimumValue)
                Layout.fillWidth: true
            }
            ProgressBar {
                indeterminate: true
                Layout.fillWidth: true
            }
            Slider {
                id: slider
                value: 0.5
                Layout.fillWidth: true
                tickmarksEnabled: tickmarkCheck.checked
                stepSize: tickmarksEnabled ? 0.1 : 0
            }
            MouseArea {
                id: busyCheck
                Layout.fillWidth: true
                Layout.fillHeight: true
                hoverEnabled:true
                Layout.preferredHeight: busyIndicator.height
                BusyIndicator {
                    id: busyIndicator
                    running: busyCheck.containsMouse
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }*/
        }
        ColumnLayout {
            id: rightcol
            Layout.fillWidth: true
            anchors {
                top: parent.top
                bottom: parent.bottom
            }

            RowLayout {

                TableView {
                    model: choices
                    anchors.fill: parent
                    Layout.fillWidth: true

                    TableViewColumn {
                        role: "index"
                        title: "#"
                        width: 36
                        resizable: false
                        movable: false
                    }
                    TableViewColumn {
                        role: "name"
                        title: "Name"
                        width: 120
                    }
                    TableViewColumn {
                        role: "color"
                        title: "Color"
                        width: 120
                    }
                    TableViewColumn {
                        role: "imagesource"
                        title: "Image source"
                        width: 200
                        visible: true
                    }
                }
            }

            RowLayout {
                TabView {
                    Layout.row: 6
                    Layout.columnSpan: 3
                    Layout.fillWidth: true
                    implicitHeight: 30
                    Tab { title: "General" ; ModelView { }}
                    Tab { title: "Tracker" ; ModelView { }}
                    Tab { title: "Files" ; ModelView { }}
                    Tab { title: "Peers" ; TableView {
                            model: largeModel
                            anchors.margins: 12
                            anchors.fill: parent
                            TableViewColumn {
                                role: "ip"
                                title: "IP"
                                width: 120
                            }
                            TableViewColumn {
                                role: "client"
                                title: "Client"
                                width: 120
                            }
                            TableViewColumn {
                                role: "flags"
                                title: "Flags"
                                width: 120
                            }
                            TableViewColumn {
                                role: "percent"
                                title: "%"
                                width: 120
                            }
                            TableViewColumn {
                                role: "down_speed"
                                title: "Down Speed"
                                width: 120
                            }
                            TableViewColumn {
                                role: "up_speed"
                                title: "Up Speed"
                                width: 120
                            }
                            TableViewColumn {
                                role: "reqs"
                                title: "Reqs"
                                width: 120
                            }
                            TableViewColumn {
                                role: "uploaded"
                                title: "Uploaded"
                                width: 120
                            }
                            TableViewColumn {
                                role: "downloaded"
                                title: "Downloaded"
                                width: 120
                            }
                            TableViewColumn {
                                role: "peer_dl"
                                title: "Peer dl."
                                width: 120
                            }
                        }}
                    Tab { title: "Speed" ; ModelView { }}
                    style: TabViewStyle {
                        tabOverlap: 16
                        frameOverlap: 4
                        tabsMovable: true

                        frame: Rectangle {
                            gradient: Gradient{
                                GradientStop { color: "#e5e5e5" ; position: 0 }
                                GradientStop { color: "#e0e0e0" ; position: 1 }
                            }
                            border.color: "#898989"
                            Rectangle { anchors.fill: parent ; anchors.margins: 1 ; border.color: "white" ; color: "transparent" }
                        }
                        tab: Item {
                            property int totalOverlap: tabOverlap * (control.count - 1)
                            implicitWidth: Math.min ((styleData.availableWidth + totalOverlap)/control.count - 4, image.sourceSize.width)
                            implicitHeight: image.sourceSize.height
                            BorderImage {
                                id: image
                                anchors.fill: parent
                                source: styleData.selected ? "../images/tab_selected.png" : "../images/tab.png"
                                border.left: 30
                                smooth: false
                                border.right: 30
                            }
                            Text {
                                text: styleData.title
                                anchors.centerIn: parent
                            }
                        }
                        leftCorner: Item { implicitWidth: 12 }
                    }
                }
            }

            /*
            GroupBox {
                id: group1
                title: "CheckBox"
                Layout.fillWidth: true
                RowLayout {
                    Layout.fillWidth: true
                    CheckBox {
                        id: frameCheckbox
                        text: "Text frame"
                        checked: true
                        Layout.minimumWidth: 100
                    }
                    CheckBox {
                        id: tickmarkCheck
                        text: "Tickmarks"
                        checked: false
                        Layout.minimumWidth: 100
                    }
                    CheckBox {
                        id: wrapCheck
                        text: "Word wrap"
                        checked: true
                        Layout.minimumWidth: 100
                    }
                }
            }
            GroupBox {
                id: group2
                title:"Tab Position"
                Layout.fillWidth: true
                RowLayout {
                    ExclusiveGroup { id: tabPositionGroup }
                    RadioButton {
                        id: r1
                        text: "Top"
                        checked: true
                        exclusiveGroup: tabPositionGroup
                        Layout.minimumWidth: 100
                    }
                    RadioButton {
                        id: r2
                        text: "Bottom"
                        exclusiveGroup: tabPositionGroup
                        Layout.minimumWidth: 100
                    }
                }
            }

            TextArea {
                id: area
                frameVisible: frameCheckbox.checked
                text: loremIpsum + loremIpsum
                textFormat: Qt.RichText
                wrapMode: wrapCheck.checked ? TextEdit.WordWrap : TextEdit.NoWrap
                Layout.fillWidth: true
                Layout.fillHeight: true
                MouseArea {
                    id: contextMenu
                    parent: area.viewport
                    anchors.fill: parent
                    acceptedButtons: Qt.RightButton
                    onPressed: editmenu.popup()
                }
            }*/
        }
    }
}
