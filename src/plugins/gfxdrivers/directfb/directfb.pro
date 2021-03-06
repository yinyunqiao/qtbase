TARGET = qdirectfbscreen
load(qt_plugin)
include($$QT_SOURCE_TREE/src/gui/embedded/directfb.pri)

DESTDIR = $$QT.gui.plugins/gfxdrivers

target.path = $$[QT_INSTALL_PLUGINS]/gfxdrivers
INSTALLS += target

SOURCES += qdirectfbscreenplugin.cpp

QMAKE_CXXFLAGS += $$QT_CFLAGS_DIRECTFB
LIBS += $$QT_LIBS_DIRECTFB
DEFINES += $$QT_DEFINES_DIRECTFB
contains(gfx-plugins, directfb):DEFINES += QT_QWS_DIRECTFB
