SOURCES += main.cpp pathstroke.cpp
HEADERS += pathstroke.h

SHARED_FOLDER = ../shared

include($$SHARED_FOLDER/shared.pri)

RESOURCES += pathstroke.qrc

contains(QT_CONFIG, opengl) {
	DEFINES += QT_OPENGL_SUPPORT
	QT += opengl
}

# install
target.path = $$[QT_INSTALL_EXAMPLES]/qtbase/painting/pathstroke
sources.files = $$SOURCES $$HEADERS $$RESOURCES *.pro *.html
sources.path = $$[QT_INSTALL_EXAMPLES]/qtbase/painting/pathstroke
INSTALLS += target sources

symbian {
    TARGET.UID3 = 0xA000A63E
    CONFIG += qt_example
}
