HEADERS     = delegate.h
SOURCES     = delegate.cpp \
              main.cpp

# install
target.path = $$[QT_INSTALL_EXAMPLES]/qtbase/itemviews/spinboxdelegate
sources.files = $$SOURCES $$HEADERS *.pro
sources.path = $$[QT_INSTALL_EXAMPLES]/qtbase/itemviews/spinboxdelegate
INSTALLS += target sources

symbian: CONFIG += qt_example