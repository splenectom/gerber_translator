import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Controls.impl 2.12

CheckBox {
    property string checkbox_color;

    id: control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             implicitContentHeight + topPadding + bottomPadding,
                             implicitIndicatorHeight + topPadding + bottomPadding)

    padding: 5
    spacing: 5

    // keep in sync with CheckDelegate.qml (shared CheckIndicator.qml was removed for performance reasons)
    indicator: Rectangle {
        implicitWidth: 28
        implicitHeight: 28

        x: text ? (control.mirrored ? control.width - width - control.rightPadding : control.leftPadding) : control.leftPadding + (control.availableWidth - width) / 2
        y: control.topPadding + (control.availableHeight - height) / 2

        color: control.down ? control.palette.light : control.palette.base
        border.width: control.visualFocus ? 2 : 1
        border.color: checkbox_color

        ColorImage {
            x: (parent.width - width) / 2
            y: (parent.height - height) / 2
            defaultColor: "#353637"
            color: checkbox_color
            source: "qrc:/qt-project.org/imports/QtQuick/Controls.2/images/check.png"
            visible: control.checkState === Qt.Checked
        }

        Rectangle {
            x: (parent.width - width) / 2
            y: (parent.height - height) / 2
            width: 16
            height: 3
            color: control.palette.text
            visible: control.checkState === Qt.PartiallyChecked
        }
    }

    contentItem: CheckLabel {
        leftPadding: control.indicator && !control.mirrored ? control.indicator.width + control.spacing : 0
        rightPadding: control.indicator && control.mirrored ? control.indicator.width + control.spacing : 0

        text: control.text
        font: control.font
        color: checkbox_color
    }
}
