load(qttest_p4)

# do not run benchmarks by default in 'make check'
CONFIG -= testcase

TEMPLATE = app
TARGET = tst_bench_opengl
DEPENDPATH += .
INCLUDEPATH += .

QT += core-private gui-private opengl opengl-private

# Input
SOURCES += main.cpp

include(../trusted-benchmarks.pri)
