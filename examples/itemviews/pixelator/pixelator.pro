HEADERS     = imagemodel.h \
              mainwindow.h \
              pixeldelegate.h
SOURCES     = imagemodel.cpp \
              main.cpp \
              mainwindow.cpp \
              pixeldelegate.cpp
RESOURCES   += images.qrc

# install
target.path = $$[QT_INSTALL_EXAMPLES]/qtbase/itemviews/pixelator
sources.files = $$SOURCES $$HEADERS $$RESOURCES *.pro images
sources.path = $$[QT_INSTALL_EXAMPLES]/qtbase/itemviews/pixelator
INSTALLS += target sources

symbian: CONFIG += qt_example
maemo5: CONFIG += qt_example
