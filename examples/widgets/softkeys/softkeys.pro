HEADERS =   softkeys.h
SOURCES += \
            main.cpp \
            softkeys.cpp

# install
target.path = $$[QT_INSTALL_EXAMPLES]/qtbase/widgets/softkeys
sources.files = $$SOURCES $$HEADERS $$RESOURCES $$FORMS softkeys.pro
sources.path = $$[QT_INSTALL_EXAMPLES]/qtbase/widgets/softkeys
INSTALLS += target sources

symbian {
    TARGET.UID3 = 0xA000CF6B
    CONFIG += qt_example
}
maemo5: CONFIG += qt_example

