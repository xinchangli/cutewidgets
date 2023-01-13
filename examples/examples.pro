
include($$PWD/../cutewidgets.pri)

TEMPLATE = subdirs

contains(CUTEWIDGETS_CONFIG, CuteWidgetsTestEdit) {

    SUBDIRS += testedit
}


