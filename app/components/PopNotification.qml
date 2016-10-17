/*
 * Fedora Media Writer
 * Copyright (C) 2016 Martin Bříza <mbriza@redhat.com>
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
 */

import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2
import QtQuick.Layouts 1.1
import QtQuick.Window 2.0

Item {
    id: root
    z: -1
    property bool open: false
    visible: opacity > 0.0
    opacity: open ? 1.0 : 0.0
    Behavior on opacity { NumberAnimation { duration: 120 } }

    height: contents.height + $(12)
    width: contents.width + $(12)

    default property alias children: contents.data

    MouseArea {
        x: -mainWindow.widthf
        y: -mainWindow.height
        width: 2 * mainWindow.width
        height: 2 * mainWindow.height
        onClicked: {
            root.open = false
        }
    }

    Rectangle {
        anchors.fill: contents
        anchors.margins: - $(12)
        color: "#729FCF"
        antialiasing: true
        border {
            width: 1
            color: "#b1b1b1"
        }
        radius: $(6)
        Rectangle {
            z: -1
            y: -$(6.5) - 1
            antialiasing: true
            border.color: "#b1b1b1"
            border.width: 1
            color: "#729FCF"
            anchors.left: parent.left
            anchors.leftMargin: parent.radius + $(10)
            width: $(14)
            height: $(14)
            rotation: 45
        }
        Rectangle {
            color: "#729FCF"
            y: -$(6.5) + 1
            anchors.left: parent.left
            anchors.leftMargin: parent.radius + $(10)
            width: $(14)
            height: $(14)
            rotation: 45
        }
    }

    Item {
        id: contents
        width: childrenRect.width
        height: childrenRect.height
    }
}
