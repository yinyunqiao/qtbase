HEADERS += \
        edge.h \
        node.h \
        graphwidget.h

SOURCES += \
        edge.cpp \
        main.cpp \
        node.cpp \
        graphwidget.cpp

TARGET.EPOCHEAPSIZE = 0x200000 0xA00000

# install
target.path = $$[QT_INSTALL_EXAMPLES]/qtbase/graphicsview/elasticnodes
sources.files = $$SOURCES $$HEADERS $$RESOURCES $$FORMS elasticnodes.pro 
sources.path = $$[QT_INSTALL_EXAMPLES]/qtbase/graphicsview/elasticnodes
INSTALLS += target sources

symbian {
    TARGET.UID3 = 0xA000A642
    CONFIG += qt_example
}
maemo5: CONFIG += qt_example

simulator: warning(This example might not fully work on Simulator platform)
