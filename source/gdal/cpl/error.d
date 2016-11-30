/* Converted to D from C:/devLibs/gdal21/include/cpl_error.h by htod */
module gdal.cpl.error;
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

import core.stdc.stdarg : va_list;

import gdal.cpl.port;

/*=====================================================================
                   Error handling functions (cpl_error.c)
 =====================================================================*/

/**
 * \file cpl_error.h
 *
 * CPL error handling services.
 */
enum
{
    CE_None    = 0,
    CE_Debug   = 1,
    CE_Warning = 2,
    CE_Failure = 3,
    CE_Fatal   = 4,
}
extern (C):
alias int CPLErr;

/* ==================================================================== */
/*      Well known error codes.                                         */
/* ==================================================================== */

alias int CPLErrorNum;
enum CPLE_None                     =  0;
enum CPLE_AppDefined               =  1;
enum CPLE_OutOfMemory              =  2;
enum CPLE_FileIO                   =  3;
enum CPLE_OpenFailed               =  4;
enum CPLE_IllegalArg               =  5;
enum CPLE_NotSupported             =  6;
enum CPLE_AssertionFailed          =  7;
enum CPLE_NoWriteAccess            =  8;
enum CPLE_UserInterrupt            =  9;
enum CPLE_ObjectNull               = 10;

/*
 * Filesystem-specific errors
 */
enum CPLE_HttpResponse             = 11;
enum CPLE_AWSBucketNotFound        = 12;
enum CPLE_AWSObjectNotFound        = 13;
enum CPLE_AWSAccessDenied          = 14;
enum CPLE_AWSInvalidCredentials    = 15;
enum CPLE_AWSSignatureDoesNotMatch = 16;
/* 100 - 299 reserved for GDAL */


void  CPLError(CPLErr eErrClass, CPLErrorNum err_no, const(char) *fmt,...);
void  CPLErrorV(CPLErr , CPLErrorNum , const(char) *, va_list );
void  CPLEmergencyError(const(char) *);

extern (Windows):
void  CPLErrorReset();
CPLErrorNum  CPLGetLastErrorNo();
CPLErr  CPLGetLastErrorType();
const(char) * CPLGetLastErrorMsg();
void * CPLGetErrorHandlerUserData();

extern (C):
void  CPLErrorSetState(CPLErr eErrClass, CPLErrorNum err_no, const(char) *pszMsg);
void  CPLCleanupErrorMutex();

alias void  function(CPLErr , CPLErrorNum , const(char) *)CPLErrorHandler;

extern (Windows):
void  CPLLoggingErrorHandler(CPLErr , CPLErrorNum , const(char) *);
void  CPLDefaultErrorHandler(CPLErr , CPLErrorNum , const(char) *);
void  CPLQuietErrorHandler(CPLErr , CPLErrorNum , const(char) *);

extern (C):
void  CPLTurnFailureIntoWarning(int bOn);

extern (Windows):
CPLErrorHandler  CPLSetErrorHandler(CPLErrorHandler );
CPLErrorHandler  CPLSetErrorHandlerEx(CPLErrorHandler , void *);
void  CPLPushErrorHandler(CPLErrorHandler );
void  CPLPushErrorHandlerEx(CPLErrorHandler , void *);
void  CPLSetCurrentErrorHandlerCatchDebug(int bCatchDebug);
void  CPLPopErrorHandler();
void  _CPLAssert(const(char) *, const(char) *, int );

/*
 * Helper macros used for input parameters validation.
 */
alias CE_Failure VALIDATE_POINTER_ERR;


/* Not sure what to do with these, if anything at all is needed. */
//C     #define VALIDATE_POINTER0(ptr, func)    do { if( NULL == ptr )       {         CPLErr const ret = VALIDATE_POINTER_ERR;         CPLError( ret, CPLE_ObjectNull,            "Pointer \'%s\' is NULL in \'%s\'.\n", #ptr, (func));          return; }} while(0)

//C     #define VALIDATE_POINTER1(ptr, func, rc)    do { if( NULL == ptr )       {           CPLErr const ret = VALIDATE_POINTER_ERR;           CPLError( ret, CPLE_ObjectNull,            "Pointer \'%s\' is NULL in \'%s\'.\n", #ptr, (func));         return (rc); }} while(0)
