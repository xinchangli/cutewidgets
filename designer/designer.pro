
include($$PWD/../cutewidgets.pri)

################################################################################
# 若qtcreator路径下已生成cutewidgets_plugin.dll，编译前需要关闭qtcreator并删除qtcreator
# 路径下的cutewidgets_plugin.dll，然后再编译，因为qtcreator打开情况下，该dll是被加载状态，
# 无法覆盖拷贝;也可以将INSTALL_TO_CREATOR置0，编译完后关闭qtcreator，手动拷贝；
# 运行例程时需要置0，避免因为编译错误，无法运行或调试例程
################################################################################

INSTALL_TO_CREATOR = 0

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


    #包含指定源码
    contains(CUTEWIDGETS_CONFIG, CuteWidgetsTestEdit) {

        include($$CUTEWIDGETS_ROOT/src/testedit/testedit.pri)
    }

    ########################################################################
    #                           在此新增自定义控件源码                         #
    ########################################################################

    #new pri here

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
    target_headers.files = $$CUTEWIDGETS_ROOT/include/*.h
    INSTALLS        += target_headers

    target_lib.path  = $$CUTEWIDGETS_INSTALL_LIB
    target_lib.files = $$CUTEWIDGETS_OUTPUT_LIB/cutewidgets.dll $$CUTEWIDGETS_OUTPUT_LIB/cutewidgets.lib
    INSTALLS        += target_lib

}
else {
    TEMPLATE        = subdirs # do nothing
}
