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

#define CUTEWIDGETS_CONSTEXPR Q_DECL_CONSTEXPR

#if QT_VERSION >= 0x050000
#define CUTEWIDGETS_OVERRIDE Q_DECL_OVERRIDE
#define CUTEWIDGETS_FINAL Q_DECL_FINAL
#endif

#ifndef CUTEWIDGETS_OVERRIDE
#define CUTEWIDGETS_OVERRIDE
#endif

#ifndef CUTEWIDGETS_FINAL
#define CUTEWIDGETS_FINAL
#endif

#endif // CUTEWIDGETS_GLOBAL_H
