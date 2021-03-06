HEADERS     = characterwidget.h \
              mainwindow.h
SOURCES     = characterwidget.cpp \
              mainwindow.cpp \
              main.cpp

# install
target.path = $$[QT_INSTALL_EXAMPLES]/qtbase/widgets/charactermap
sources.files = $$SOURCES $$HEADERS $$RESOURCES $$FORMS charactermap.pro
sources.path = $$[QT_INSTALL_EXAMPLES]/qtbase/widgets/charactermap
INSTALLS += target sources

symbian: CONFIG += qt_example
maemo5: CONFIG += qt_example

symbian: warning(This example might not fully work on Symbian platform)
maemo5: warning(This example might not fully work on Maemo platform)
simulator: warning(This example might not fully work on Simulator platform)
