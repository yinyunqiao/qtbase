HEADERS       = ../connection.h
SOURCES       = tablemodel.cpp
QT           += sql

# install
target.path = $$[QT_INSTALL_EXAMPLES]/qtbase/sql/tablemodel
sources.files = $$SOURCES *.h $$RESOURCES $$FORMS tablemodel.pro
sources.path = $$[QT_INSTALL_EXAMPLES]/qtbase/sql/tablemodel
INSTALLS += target sources

symbian: CONFIG += qt_example
maemo5: CONFIG += qt_example
