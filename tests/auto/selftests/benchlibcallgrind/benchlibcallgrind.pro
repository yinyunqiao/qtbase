load(qttest_p4)

# this is not a real testcase ('make check' should not run it)
CONFIG -= testcase

SOURCES += tst_benchlibcallgrind.cpp
QT = core

mac:CONFIG -= app_bundle
CONFIG -= debug_and_release_target


TARGET = benchlibcallgrind
