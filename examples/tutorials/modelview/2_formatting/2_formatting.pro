TARGET = mv_formatting

TEMPLATE = app

SOURCES += main.cpp \
           mymodel.cpp

HEADERS += mymodel.h

# install
target.path = $$[QT_INSTALL_EXAMPLES]/qtbase/tutorials/modelview/2_formatting
sources.files = $$SOURCES $$HEADERS $$RESOURCES $$FORMS 2_formatting.pro
sources.path = $$[QT_INSTALL_EXAMPLES]/qtbase/tutorials/modelview/2_formatting
INSTALLS += target sources

symbian: CONFIG += qt_example
maemo5: CONFIG += qt_example

symbian: warning(This example might not fully work on Symbian platform)
maemo5: warning(This example might not fully work on Maemo platform)
simulator: warning(This example might not fully work on Simulator platform)
