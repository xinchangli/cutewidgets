#ifndef CUTEWIDGETS_GLOBAL_H
#define CUTEWIDGETS_GLOBAL_H

#include <QtCore/qglobal.h>

#ifdef CUTEWIDGETS_DLL
#ifdef CUTEWIDGETS_LIBRARY
#  define CUTEWIDGETS_EXPORT Q_DECL_EXPORT
#else
#  define CUTEWIDGETS_EXPORT Q_DECL_IMPORT
#endif
#else
#define CUTEWIDGETS_EXPORT
#endif

#endif // CUTEWIDGETS_GLOBAL_H
