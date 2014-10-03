"""
 Copyright (C) 2014, Vladimir Smirnov (vladimir@smirnov.im)

 This program is distributed in the hope that it will be useful, but WITHOUT
 ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 FOR A PARTICULAR PURPOSE.  See the license for more details.
"""

from libc.stdio cimport FILE

cdef extern from "Python.h":
    void PyEval_InitThreads()

cdef extern from "ZWayLib.h":
    ctypedef long time_t

    cdef struct _ZWay:
        pass

    ctypedef _ZWay* ZWay

    cdef struct _ZGuessedProduct:
        int score
        char *vendor
        char *product
        char *image_url
        char *file_name

    ctypedef _ZGuessedProduct *ZGuessedProduct

    ctypedef int ZWError
    ctypedef char* ZWCSTR
    ctypedef int ZWLogLevel
    ctypedef int ZWDeviceChangeType
    ctypedef unsigned char ZWBOOL
    ctypedef unsigned char ZWBYTE
    ctypedef ZWBYTE* ZWDevicesList
    ctypedef ZWBYTE* ZWInstancesList
    ctypedef ZWBYTE* ZWCommandClassesList

    ctypedef void (*ZTerminationCallback)(const ZWay zway)
    ctypedef void (*ZDeviceCallback)(const ZWay wzay, ZWDeviceChangeType type, ZWBYTE node_id, ZWBYTE instance_id, ZWBYTE command_id, void *arg)
    ctypedef void (*ZJobCustomCallback)(const ZWay zway, ZWBYTE functionId, void* arg)

    # ZWayLib.h

    ZGuessedProduct *zway_device_guess(const ZWay zway, ZWBYTE node_id)

#GENPXD:ZWayLib.h:zway_device_add_callback_ex,zway_device_remove_callback_ex,zway_device_guess

    # CommandClassesPublic.h

#GENPXD:CommandClassesPublic.h:

    # FunctionClassesPublic.h

#GENPXD:FunctionClassesPublic.h:

# Internal definitions

cdef struct _DeviceCallbackInfo:
        ZWDeviceChangeType type
        ZWBYTE node_id
        ZWBYTE instance_id
        ZWBYTE command_id
        void* instance

ctypedef _DeviceCallbackInfo* DeviceCallbackInfo

cdef struct _JobCallbackInfo:
    ZWBYTE success
    ZWBYTE function_id
    void* instance

ctypedef _JobCallbackInfo* JobCallbackInfo