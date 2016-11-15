/* Converted to D from C:/devLibs/gdal21/include/cpl_error.h by htod */
module ./cplerror;
/**********************************************************************
 * $Id: cpl_error.h 33842 2016-04-01 08:37:32Z rouault $
 *
 * Name:     cpl_error.h
 * Project:  CPL - Common Portability Library
 * Purpose:  CPL Error handling
 * Author:   Daniel Morissette, danmo@videotron.ca
 *
 **********************************************************************
 * Copyright (c) 1998, Daniel Morissette
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included
 * in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
 * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 ****************************************************************************/

//C     #ifndef CPL_ERROR_H_INCLUDED
//C     #define CPL_ERROR_H_INCLUDED

//C     #include "cpl_port.h"
import cpl_port;

/*=====================================================================
                   Error handling functions (cpl_error.c)
 =====================================================================*/

/**
 * \file cpl_error.h
 *
 * CPL error handling services.
 */

//C     CPL_C_START

//C     typedef enum
//C     {
//C         CE_None = 0,
//C         CE_Debug = 1,
//C         CE_Warning = 2,
//C         CE_Failure = 3,
//C         CE_Fatal = 4
//C     } CPLErr;
enum
{
    CE_None,
    CE_Debug,
    CE_Warning,
    CE_Failure,
    CE_Fatal,
}
extern (C):
alias int CPLErr;

/* ==================================================================== */
/*      Well known error codes.                                         */
/* ==================================================================== */

//C     #ifdef STRICT_CPLERRORNUM_TYPE

/* This is not appropriate for the general case, as there are parts */
/* of GDAL which use custom error codes, but this can help diagnose confusions */
/* between CPLErr and CPLErrorNum */
//C     typedef enum
//C     {
//C       CPLE_None,
//C       CPLE_AppDefined,
//C       CPLE_OutOfMemory,
//C       CPLE_FileIO,
//C       CPLE_OpenFailed,
//C       CPLE_IllegalArg,
//C       CPLE_NotSupported,
//C       CPLE_AssertionFailed,
//C       CPLE_NoWriteAccess,
//C       CPLE_UserInterrupt,
//C       CPLE_ObjectNull,
//C       CPLE_HttpResponse,
//C       CPLE_HttpResponse,
//C       CPLE_AWSBucketNotFound,
//C       CPLE_AWSObjectNotFound,
//C       CPLE_AWSAccessDenied,
//C       CPLE_AWSInvalidCredentials,
//C       CPLE_AWSSignatureDoesNotMatch,
//C     } CPLErrorNum;

//C     #else

//C     typedef int CPLErrorNum;
alias int CPLErrorNum;

//C     #define CPLE_None                       0
//C     #define CPLE_AppDefined                 1
const CPLE_None = 0;
//C     #define CPLE_OutOfMemory                2
const CPLE_AppDefined = 1;
//C     #define CPLE_FileIO                     3
const CPLE_OutOfMemory = 2;
//C     #define CPLE_OpenFailed                 4
const CPLE_FileIO = 3;
//C     #define CPLE_IllegalArg                 5
const CPLE_OpenFailed = 4;
//C     #define CPLE_NotSupported               6
const CPLE_IllegalArg = 5;
//C     #define CPLE_AssertionFailed            7
const CPLE_NotSupported = 6;
//C     #define CPLE_NoWriteAccess              8
const CPLE_AssertionFailed = 7;
//C     #define CPLE_UserInterrupt              9
const CPLE_NoWriteAccess = 8;
//C     #define CPLE_ObjectNull                 10
const CPLE_UserInterrupt = 9;

const CPLE_ObjectNull = 10;
/*
 * Filesystem-specific errors
 */
//C     #define CPLE_HttpResponse               11
//C     #define CPLE_AWSBucketNotFound          12
const CPLE_HttpResponse = 11;
//C     #define CPLE_AWSObjectNotFound          13
const CPLE_AWSBucketNotFound = 12;
//C     #define CPLE_AWSAccessDenied            14
const CPLE_AWSObjectNotFound = 13;
//C     #define CPLE_AWSInvalidCredentials      15
const CPLE_AWSAccessDenied = 14;
//C     #define CPLE_AWSSignatureDoesNotMatch    16
const CPLE_AWSInvalidCredentials = 15;

const CPLE_AWSSignatureDoesNotMatch = 16;
/* 100 - 299 reserved for GDAL */

//C     #endif

//C     void CPL_DLL CPLError(CPLErr eErrClass, CPLErrorNum err_no, const char *fmt, ...)  CPL_PRINT_FUNC_FORMAT (3, 4);
void  CPLError(CPLErr eErrClass, CPLErrorNum err_no, char *fmt,...);
//C     void CPL_DLL CPLErrorV(CPLErr, CPLErrorNum, const char *, va_list );
void  CPLErrorV(CPLErr , CPLErrorNum , char *, va_list );
//C     void CPL_DLL CPLEmergencyError( const char * ) CPL_NO_RETURN;
void  CPLEmergencyError(char *);
//C     void CPL_DLL CPL_STDCALL CPLErrorReset( void );
extern (Windows):
void  CPLErrorReset();
//C     CPLErrorNum CPL_DLL CPL_STDCALL CPLGetLastErrorNo( void );
CPLErrorNum  CPLGetLastErrorNo();
//C     CPLErr CPL_DLL CPL_STDCALL CPLGetLastErrorType( void );
CPLErr  CPLGetLastErrorType();
//C     const char CPL_DLL * CPL_STDCALL CPLGetLastErrorMsg( void );
char * CPLGetLastErrorMsg();
//C     void CPL_DLL * CPL_STDCALL CPLGetErrorHandlerUserData(void);
void * CPLGetErrorHandlerUserData();
//C     void CPL_DLL CPLErrorSetState( CPLErr eErrClass, CPLErrorNum err_no, const char* pszMsg );
extern (C):
void  CPLErrorSetState(CPLErr eErrClass, CPLErrorNum err_no, char *pszMsg);
//C     void CPL_DLL CPLCleanupErrorMutex( void );
void  CPLCleanupErrorMutex();

//C     typedef void (CPL_STDCALL *CPLErrorHandler)(CPLErr, CPLErrorNum, const char*);
alias void  function(CPLErr , CPLErrorNum , char *)CPLErrorHandler;

//C     void CPL_DLL CPL_STDCALL CPLLoggingErrorHandler( CPLErr, CPLErrorNum, const char * );
extern (Windows):
void  CPLLoggingErrorHandler(CPLErr , CPLErrorNum , char *);
//C     void CPL_DLL CPL_STDCALL CPLDefaultErrorHandler( CPLErr, CPLErrorNum, const char * );
void  CPLDefaultErrorHandler(CPLErr , CPLErrorNum , char *);
//C     void CPL_DLL CPL_STDCALL CPLQuietErrorHandler( CPLErr, CPLErrorNum, const char * );
void  CPLQuietErrorHandler(CPLErr , CPLErrorNum , char *);
//C     void CPLTurnFailureIntoWarning(int bOn );
extern (C):
void  CPLTurnFailureIntoWarning(int bOn);

//C     CPLErrorHandler CPL_DLL CPL_STDCALL CPLSetErrorHandler(CPLErrorHandler);
extern (Windows):
CPLErrorHandler  CPLSetErrorHandler(CPLErrorHandler );
//C     CPLErrorHandler CPL_DLL CPL_STDCALL CPLSetErrorHandlerEx(CPLErrorHandler, void*);
CPLErrorHandler  CPLSetErrorHandlerEx(CPLErrorHandler , void *);
//C     void CPL_DLL CPL_STDCALL CPLPushErrorHandler( CPLErrorHandler );
void  CPLPushErrorHandler(CPLErrorHandler );
//C     void CPL_DLL CPL_STDCALL CPLPushErrorHandlerEx( CPLErrorHandler, void* );
void  CPLPushErrorHandlerEx(CPLErrorHandler , void *);
//C     void CPL_DLL CPL_STDCALL CPLSetCurrentErrorHandlerCatchDebug( int bCatchDebug );
void  CPLSetCurrentErrorHandlerCatchDebug(int bCatchDebug);
//C     void CPL_DLL CPL_STDCALL CPLPopErrorHandler(void);
void  CPLPopErrorHandler();

//C     void CPL_DLL CPL_STDCALL CPLDebug( const char *, const char *, ... )  CPL_PRINT_FUNC_FORMAT (2, 3);
//C     void CPL_DLL CPL_STDCALL _CPLAssert( const char *, const char *, int ) CPL_NO_RETURN;
void  _CPLAssert(char *, char *, int );

//C     #ifdef DEBUG
//C     #  define CPLAssert(expr)  ((expr) ? (void)(0) : _CPLAssert(#expr,__FILE__,__LINE__))
//C     #else
//C     #  define CPLAssert(expr)
//C     #endif

//C     CPL_C_END

/*
 * Helper macros used for input parameters validation.
 */
//C     #ifdef DEBUG
//C     #  define VALIDATE_POINTER_ERR CE_Fatal
//C     #else
//C     #  define VALIDATE_POINTER_ERR CE_Failure
//C     #endif
alias CE_Failure VALIDATE_POINTER_ERR;

//C     #define VALIDATE_POINTER0(ptr, func)    do { if( NULL == ptr )       {         CPLErr const ret = VALIDATE_POINTER_ERR;         CPLError( ret, CPLE_ObjectNull,            "Pointer \'%s\' is NULL in \'%s\'.\n", #ptr, (func));          return; }} while(0)

//C     #define VALIDATE_POINTER1(ptr, func, rc)    do { if( NULL == ptr )       {           CPLErr const ret = VALIDATE_POINTER_ERR;           CPLError( ret, CPLE_ObjectNull,            "Pointer \'%s\' is NULL in \'%s\'.\n", #ptr, (func));         return (rc); }} while(0)

//C     #endif /* CPL_ERROR_H_INCLUDED */
