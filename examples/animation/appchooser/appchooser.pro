SOURCES = main.cpp
RESOURCES = appchooser.qrc

# install
target.path = $$[QT_INSTALL_EXAMPLES]/qtbase/animation/appchooser
sources.files = $$SOURCES $$HEADERS $$RESOURCES $$FORMS appchooser.pro
sources.path = $$[QT_INSTALL_EXAMPLES]/qtbase/animation/appchooser
INSTALLS += target sources

symbian {
    TARGET.UID3 = 0xA000E3F5
    CONFIG += qt_example
}
maemo5: CONFIG += qt_example
