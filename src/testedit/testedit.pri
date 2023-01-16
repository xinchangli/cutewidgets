
!contains(DEFINES, DEFINE_CUTEWIDGETS_TESTEDIT) {
    DEFINES += DEFINE_CUTEWIDGETS_TESTEDIT
}

QT += widgets

INCLUDEPATH += $$PWD

HEADERS += \
    $$PWD/testedit.h

SOURCES += \
    $$PWD/testedit.cpp

########################################################
# 添加需要install的头文件
########################################################

INSTALL_INCLUDE_FILES += $$PWD/testedit.h
