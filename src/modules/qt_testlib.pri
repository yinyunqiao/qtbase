QT_TEST_VERSION = $$QT_VERSION
QT_TEST_MAJOR_VERSION = $$QT_MAJOR_VERSION
QT_TEST_MINOR_VERSION = $$QT_MINOR_VERSION
QT_TEST_PATCH_VERSION = $$QT_PATCH_VERSION

QT.testlib.name = QtTest
QT.testlib.includes = $$QT_MODULE_INCLUDE_BASE/QtTest
QT.testlib.libs = $$QT_MODULE_LIB_BASE
QT.testlib.depends = core
QT.testlib.CONFIG = console

QT_CONFIG += testlib