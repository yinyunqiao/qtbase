TARGET = qscreenvfb
load(qt_plugin)

DEFINES	+= QT_QWS_QVFB QT_QWS_MOUSE_QVFB QT_QWS_KBD_QVFB

DESTDIR = $$QT.gui.plugins/gfxdrivers

HEADERS = \
	$$QT_SOURCE_TREE/src/gui/embedded/qscreenvfb_qws.h \
	$$QT_SOURCE_TREE/src/gui/embedded/qkbdvfb_qws.h \
	$$QT_SOURCE_TREE/src/gui/embedded/qmousevfb_qws.h

SOURCES	= main.cpp \
	$$QT_SOURCE_TREE/src/gui/embedded/qscreenvfb_qws.cpp \
	$$QT_SOURCE_TREE/src/gui/embedded/qkbdvfb_qws.cpp \
	$$QT_SOURCE_TREE/src/gui/embedded/qmousevfb_qws.cpp

target.path += $$[QT_INSTALL_PLUGINS]/gfxdrivers
INSTALLS += target
