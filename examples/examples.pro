
include($$PWD/../cutewidgets.pri)

TEMPLATE = subdirs

contains(CUTEWIDGETS_CONFIG, CuteWidgetsTestEdit) {

    SUBDIRS += testedit
}

########################################################################
#                           在此新增测试源码                              #
########################################################################
