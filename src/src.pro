
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

HEADERS += \
    $$PWD/cutewidgets_global.h

contains(CUTEWIDGETS_CONFIG, CuteWidgetsTestEdit) {
    include(testedit/testedit.pri)
}
