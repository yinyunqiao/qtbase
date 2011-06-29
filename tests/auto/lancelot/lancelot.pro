load(qttest_p4)
QT += xml
contains(QT_CONFIG, opengl)|contains(QT_CONFIG, opengles1)|contains(QT_CONFIG, opengles2):QT += opengl

SOURCES += tst_lancelot.cpp \
           paintcommands.cpp
HEADERS += paintcommands.h
RESOURCES += images.qrc

include($$PWD/../../baselineserver/shared/qbaselinetest.pri)

!symbian:!wince*:DEFINES += SRCDIR=\\\"$$PWD\\\"
linux-g++-maemo:DEFINES += USE_RUNTIME_DIR
