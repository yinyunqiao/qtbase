SOURCES = main.cpp

# install
target.path = $$[QT_INSTALL_EXAMPLES]/qtbase/tutorials/widgets/childwidget
sources.files = $$SOURCES $$HEADERS $$RESOURCES $$FORMS childwidget.pro
sources.path = $$[QT_INSTALL_EXAMPLES]/qtbase/tutorials/widgets/childwidget
INSTALLS += target sources

symbian: CONFIG += qt_example
maemo5: CONFIG += qt_example

symbian: warning(This example might not fully work on Symbian platform)
maemo5: warning(This example might not fully work on Maemo platform)
simulator: warning(This example might not fully work on Simulator platform)
