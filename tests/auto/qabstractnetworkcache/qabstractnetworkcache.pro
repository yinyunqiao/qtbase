load(qttest_p4)
QT += network
QT -= gui
SOURCES  += tst_qabstractnetworkcache.cpp

wince*|symbian: {
   testFiles.files = tests
   testFiles.path = .
   DEPLOYMENT += testFiles
}

symbian: TARGET.CAPABILITY = NetworkServices

CONFIG += insignificant_test  # QTBUG-20686; note, assumed unstable on all platforms
