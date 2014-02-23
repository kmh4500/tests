QT += qml quick
TARGET = gallery
!android: !ios: !blackberry: qtHaveModule(widgets): QT += widgets

macx:QMAKE_MAC_SDK = macosx

include(src/src.pri)
include(../shared/shared.pri)

OTHER_FILES += \
    main.qml \
    content/AboutDialog.qml \
    content/ChildWindow.qml \
    content/Controls.qml \
    content/ImageViewer.qml \
    content/ModelView.qml \
    content/Panel.qml \
    content/Styles.qml

RESOURCES += \
    resources.qrc
