TEMPLATE = subdirs
CONFIG   += ordered

include(cutewidgets.pri)

SUBDIRS += src

contains(CUTEWIDGETS_CONFIG, CuteWidgetsExamples) {
    SUBDIRS += examples
}

contains(CUTEWIDGETS_CONFIG, CuteWidgetsDesigner) {
    SUBDIRS += designer
}
