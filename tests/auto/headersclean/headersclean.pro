load(qttest_p4)
SOURCES  += tst_headersclean.cpp
QT = core network xml sql
CONFIG += uitools

contains(QT_CONFIG,dbus): QT += dbus
contains(QT_CONFIG,opengl): QT += opengl
contains(QT_CONFIG,openvg): QT += openvg

