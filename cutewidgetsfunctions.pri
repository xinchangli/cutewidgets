
defineReplace(cuteWidgetsLibraryTarget) {

    unset(LIBRARY_NAME)
    LIBRARY_NAME = $$1

    contains(TEMPLATE, .*lib):CONFIG(debug, debug|release) {

        !debug_and_release|build_pass {

            win32:RET = $$member(LIBRARY_NAME, 0)d

        }
    }

    isEmpty(RET):RET = $$LIBRARY_NAME
    return($$RET)
}

defineTest(cuteWidgetsAddLibrary) {

    LIB_PATH = $$1
    LIB_NAME = $$2

    LIBS *= -L$${LIB_PATH}

    unset(LINKAGE)

    isEmpty(LINKAGE) {

        if(!debug_and_release|build_pass):CONFIG(debug, debug|release) {

            win32:LINKAGE = -l$${LIB_NAME}d

        }
    }

    isEmpty(LINKAGE) {

        LINKAGE = -l$${LIB_NAME}

    }

    !isEmpty(QMAKE_LSB) {

        QMAKE_LFLAGS *= --lsb-shared-libs=$${LIB_NAME}

    }

    LIBS += $$LINKAGE
    export(LIBS)
    export(QMAKE_LFLAGS)
    export(QMAKE_LIBDIR_FLAGS)

    return(true)
}
