load(qttest_p4)
DEFINES += QT_STRICT_ITERATORS
SOURCES += tst_qtconcurrentfilter.cpp
QT = core
CONFIG += parallel_test
linux*:CONFIG += insignificant_test
