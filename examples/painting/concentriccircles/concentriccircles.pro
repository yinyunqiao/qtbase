HEADERS       = circlewidget.h \
                window.h
SOURCES       = circlewidget.cpp \
                main.cpp \
                window.cpp

# install
target.path = $$[QT_INSTALL_EXAMPLES]/qtbase/painting/concentriccircles
sources.files = $$SOURCES $$HEADERS $$RESOURCES $$FORMS concentriccircles.pro
sources.path = $$[QT_INSTALL_EXAMPLES]/qtbase/painting/concentriccircles
INSTALLS += target sources

symbian {
    TARGET.UID3 = 0xA000A64A
    CONFIG += qt_example
}
maemo5: CONFIG += qt_example

