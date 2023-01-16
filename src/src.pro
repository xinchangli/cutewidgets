
include($$PWD/../cutewidgets.pri)

TEMPLATE          = lib
TARGET            = $$cuteWidgetsLibraryTarget(cutewidgets)
DESTDIR           = $$CUTEWIDGETS_OUTPUT_LIB

contains(CUTEWIDGETS_CONFIG, CuteWidgetsDll) {
    CONFIG += dll
    DEFINES += CUTEWIDGETS_DLL CUTEWIDGETS_LIBRARY

    DLLDESTDIR        = $$CUTEWIDGETS_ROOT/bin
}
else {
    CONFIG += staticlib
}

INCLUDEPATH     += $$CUTEWIDGETS_ROOT/src


unset(INSTALL_INCLUDE_FILES)
INSTALL_INCLUDE_FILES += $$CUTEWIDGETS_ROOT/src/cutewidgets_global.h

#包含指定源码
contains(CUTEWIDGETS_CONFIG, CuteWidgetsTestEdit) {

    include($$CUTEWIDGETS_ROOT/src/testedit/testedit.pri)
}

########################################################################
#                           在此新增自定义控件源码                         #
########################################################################

#new pri here


########################################################################
#头文件拷贝
########################################################################

target_headers.path  = $$CUTEWIDGETS_ROOT/include
target_headers.files = $$INSTALL_INCLUDE_FILES
INSTALLS        += target_headers
