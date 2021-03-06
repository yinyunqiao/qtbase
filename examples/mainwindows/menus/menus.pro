HEADERS       = mainwindow.h
SOURCES       = mainwindow.cpp \
                main.cpp

# install
target.path = $$[QT_INSTALL_EXAMPLES]/qtbase/mainwindows/menus
sources.files = $$SOURCES $$HEADERS $$RESOURCES $$FORMS menus.pro
sources.path = $$[QT_INSTALL_EXAMPLES]/qtbase/mainwindows/menus
INSTALLS += target sources

symbian {
    TARGET.UID3 = 0xA000CF66
    CONFIG += qt_example
}
maemo5: CONFIG += qt_example

simulator: warning(This example might not fully work on Simulator platform)
