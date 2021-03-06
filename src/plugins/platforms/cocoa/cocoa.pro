TARGET = qcocoa
load(qt_plugin)
DESTDIR = $$QT.gui.plugins/platforms

OBJECTIVE_SOURCES = main.mm \
    qcocoaintegration.mm \
    qcocoawindowsurface.mm \
    qcocoawindow.mm \
    qnsview.mm \
    qcocoaeventloopintegration.mm \
    qcocoaautoreleasepool.mm \
    qnswindowdelegate.mm

OBJECTIVE_HEADERS = qcocoaintegration.h \
    qcocoawindowsurface.h \
    qcocoawindow.h \
    qnsview.h \
    qcocoaeventloopintegration.h \
    qcocoaautoreleasepool.h \
    qnswindowdelegate.h

#add libz for freetype.
LIBS += -lz
LIBS += -framework cocoa

include(../fontdatabases/coretext/coretext.pri)
target.path += $$[QT_INSTALL_PLUGINS]/platforms
INSTALLS += target

