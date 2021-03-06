load(qttest_p4)
SOURCES += tst_qimagereader.cpp
MOC_DIR=tmp
QT += core-private gui-private network
RESOURCES += qimagereader.qrc
!symbian:DEFINES += SRCDIR=\\\"$$PWD\\\"

win32-msvc:QMAKE_CXXFLAGS -= -Zm200
win32-msvc:QMAKE_CXXFLAGS += -Zm800
win32-msvc.net:QMAKE_CXXFLAGS -= -Zm300
win32-msvc.net:QMAKE_CXXFLAGS += -Zm1100

wince*: {
    images.files = images
    images.path = .

    imagePlugins.files = $$QT_BUILD_TREE/plugins/imageformats/*.dll
    imagePlugins.path = imageformats

    DEPLOYMENT += images imagePlugins
    DEFINES += SRCDIR=\\\".\\\"
}

symbian: {
    images.files = images
    images.path = .

    DEPLOYMENT += images

    qt_not_deployed {
        imagePlugins.files = qjpeg.dll qgif.dll qmng.dll
        imagePlugins.path = imageformats

        DEPLOYMENT += imagePlugins
    }
}
