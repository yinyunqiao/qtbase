HEADERS       = window.h \
                movementtransition.h
SOURCES       = main.cpp \
                window.cpp

# install
target.path = $$[QT_INSTALL_EXAMPLES]/qtbase/statemachine/rogue
sources.files = $$SOURCES $$HEADERS *.pro
sources.path = $$[QT_INSTALL_EXAMPLES]/qtbase/statemachine/rogue
INSTALLS += target sources

symbian: CONFIG += qt_example
maemo5: CONFIG += qt_example

