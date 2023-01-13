
CUTEWIDGETS_ROOT            = $$PWD/..
CUTEWIDGETS_OUTPUT_LIB      = $$CUTEWIDGETS_ROOT/lib

include($$CUTEWIDGETS_ROOT/cutewidgetsfunctions.pri)

TEMPLATE     = app

INCLUDEPATH += $$CUTEWIDGETS_ROOT/src
DEPENDPATH += $$CUTEWIDGETS_OUTPUT_LIB

DESTDIR      = $$CUTEWIDGETS_ROOT/bin

cuteWidgetsAddLibrary($$CUTEWIDGETS_OUTPUT_LIB, cutewidgets)


