TARGET = mv_tree
TEMPLATE = app
SOURCES += main.cpp \
    mainwindow.cpp
HEADERS += mainwindow.h

# install
target.path = $$[QT_INSTALL_EXAMPLES]/qtbase/tutorials/modelview/6_treeview
sources.files = $$SOURCES $$HEADERS $$RESOURCES $$FORMS 6_treeview.pro
sources.path = $$[QT_INSTALL_EXAMPLES]/qtbase/tutorials/modelview/6_treeview
INSTALLS += target sources

symbian: CONFIG += qt_example
maemo5: CONFIG += qt_example

symbian: warning(This example might not fully work on Symbian platform)
maemo5: warning(This example might not fully work on Maemo platform)
simulator: warning(This example might not fully work on Simulator platform)
