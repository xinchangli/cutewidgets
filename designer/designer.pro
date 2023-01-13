
include($$PWD/../cutewidgets.pri)

CONFIG(debug_and_release) {

    # When building debug_and_release the designer plugin is built
    # for release only. If you want to have a debug version it has to be
    # done with "CONFIG += debug" only.

    message("debug_and_release: building the cutewidgets designer plugin in release mode only")

    CONFIG          -= debug_and_release
    CONFIG          += release
}

contains(CUTEWIDGETS_CONFIG, CuteWidgetsDesigner) {

    CONFIG          += qt plugin

    greaterThan(QT_MAJOR_VERSION, 4) {
        QT          += designer
    }
    else {
        CONFIG      += designer
    }


    TEMPLATE        = lib
    TARGET          = cutewidgets_plugin

    DESTDIR         = $$CUTEWIDGETS_OUTPUT_PLUGIN

    #########################################################################
    # 定义QT路径下include下文件名，所有install的头文件放于
    # QT_INSTALL_PRFIX/include/CUTEWIDGETS_STR中
    #########################################################################
    DEFINES += CUTEWIDGETS_STR=$$CUTEWIDGETS_INSTALL_DIR_NAME

    INCLUDEPATH     += $$CUTEWIDGETS_ROOT/src

    #########################################################################
    # INSTALL_INCLUDE_FILES 为头文件安装文件汇总，所有源码的pri文件中需定义要拷贝的头文件
    # 例如 xxx.pri文件定义如下：
    #
    #    !contains(DEFINES, DEFINE_CUTEWIDGETS_TESTEDIT) {
    #        DEFINES += DEFINE_CUTEWIDGETS_TESTEDIT
    #    }
    #
    #    QT += widgets
    #
    #    INCLUDEPATH += $$PWD
    #
    #    HEADERS += \
    #        $$PWD/testedit.h
    #
    #    SOURCES += \
    #        $$PWD/testedit.cpp
    #
    #    #######################################################
    #    添加需要install的头文件，designer插件使用
    #    #######################################################
    #
    #    #INSTALL_INCLUDE_FILES += $$PWD/testedit.h
    #
    #########################################################################

    unset(INSTALL_INCLUDE_FILES)
    INSTALL_INCLUDE_FILES += $$CUTEWIDGETS_ROOT/src/cutewidgets_global.h

    #包含指定源码
    contains(CUTEWIDGETS_CONFIG, CuteWidgetsTestEdit) {

        include($$CUTEWIDGETS_ROOT/src/testedit/testedit.pri)
    }

    #designer 插件文件
    HEADERS         += designer_plugin.h
    SOURCES         += designer_plugin.cpp
    RESOURCES       += designer_plugin.qrc

    target_designer.path  = $$CUTEWIDGETS_INSTALL_PLUGINS_FOR_DESIGNER
    target_designer.files = $$CUTEWIDGETS_OUTPUT_PLUGIN/$${TARGET}.dll $$CUTEWIDGETS_OUTPUT_PLUGIN/$${TARGET}.lib
    INSTALLS        += target_designer

    equals(INSTALL_TO_CREATOR, 1) {

        target_creator.path  = $$CUTEWIDGETS_INSTALL_PLUGINS_FOR_CREATOR
        target_creator.files = $$CUTEWIDGETS_OUTPUT_PLUGIN/$${TARGET}.dll
        INSTALLS        += target_creator
    }

    target_headers.path  = $$CUTEWIDGETS_INSTALL_HEADERS
    target_headers.files = $$INSTALL_INCLUDE_FILES
    INSTALLS        += target_headers
}
else {
    TEMPLATE        = subdirs # do nothing
}
