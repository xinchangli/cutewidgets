################################################################################
# Source paths
################################################################################

CUTEWIDGETS_ROOT            = $$PWD
CUTEWIDGETS_OUTPUT_LIB      = $$CUTEWIDGETS_ROOT/lib
CUTEWIDGETS_OUTPUT_PLUGIN   = $$CUTEWIDGETS_ROOT/plugin

######################################################################
# Install paths
######################################################################

CUTEWIDGETS_INSTALL_PREFIX      = $$[QT_INSTALL_PREFIX]

CUTEWIDGETS_INSTALL_DIR_NAME    = QtCuteWidgets

CUTEWIDGETS_INSTALL_HEADERS     = $${CUTEWIDGETS_INSTALL_PREFIX}/include/$$CUTEWIDGETS_INSTALL_DIR_NAME

CUTEWIDGETS_INSTALL_LIB         = $${CUTEWIDGETS_INSTALL_PREFIX}/lib

######################################################################
# Designer plugin
# creator/designer load designer plugins from certain default
# directories ( f.e the path below QT_INSTALL_PREFIX ) and the
# directories listed in the QT_PLUGIN_PATH environment variable.
# When using the path below CUTEWIDGETS_INSTALL_PREFIX you need to
# add $${CUTEWIDGETS_INSTALL_PREFIX}/plugins to QT_PLUGIN_PATH in the
# runtime environment of designer/creator.
######################################################################

CUTEWIDGETS_INSTALL_PLUGINS_FOR_DESIGNER   = $${CUTEWIDGETS_INSTALL_PREFIX}/plugins/designer
CUTEWIDGETS_INSTALL_PLUGINS_FOR_CREATOR    = $${CUTEWIDGETS_INSTALL_PREFIX}/../../Tools/QtCreator/bin/plugins/designer

######################################################################
# Build the static/shared libraries.
# If CuteWidgetsDll is enabled, a shared library is built, otherwise
# it will be a static library.
######################################################################

CUTEWIDGETS_CONFIG           += CuteWidgetsDll

######################################################################
# If you want to build the CuteWidgets designer plugin,
# enable the line below.
# Otherwise you have to build it from the designer directory.
######################################################################

CUTEWIDGETS_CONFIG     += CuteWidgetsDesigner

######################################################################
# If you want to auto build the examples, enable the line below
# Otherwise you have to build them from the examples directory.
######################################################################

CUTEWIDGETS_CONFIG     += CuteWidgetsExamples

######################################################################
###                      custom widget below                       ###
######################################################################

######################################################################
# CuteWidgetsTestEdit enables all classes, that are needed to use the
# CuteWidgetsTestEdit classes.
######################################################################

CUTEWIDGETS_CONFIG     += CuteWidgetsTestEdit
