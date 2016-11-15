/* Converted to D from C:/devLibs/gdal21/include/cpl_progress.h by htod */
module ./cplprogress;
/******************************************************************************
 * $Id$
 *
 * Project:  CPL - Common Portability Library
 * Author:   Frank Warmerdam, warmerdam@pobox.com
 * Purpose:  Prototypes and definitions for progress functions.
 *
 ******************************************************************************
 * Copyright (c) 2013, Frank Warmerdam
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
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
 * OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
 * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 ****************************************************************************/

//C     #ifndef CPL_PROGRESS_H_INCLUDED
//C     #define CPL_PROGRESS_H_INCLUDED

//C     #include "cpl_port.h"
import cpl_port;

//C     CPL_C_START

//C     typedef int (CPL_STDCALL *GDALProgressFunc)(double dfComplete, const char *pszMessage, void *pProgressArg);
extern (C):
alias int  function(double dfComplete, char *pszMessage, void *pProgressArg)GDALProgressFunc;

//C     int CPL_DLL CPL_STDCALL GDALDummyProgress( double, const char *, void *);
extern (Windows):
int  GDALDummyProgress(double , char *, void *);
//C     int CPL_DLL CPL_STDCALL GDALTermProgress( double, const char *, void *);
int  GDALTermProgress(double , char *, void *);
//C     int CPL_DLL CPL_STDCALL GDALScaledProgress( double, const char *, void *);
int  GDALScaledProgress(double , char *, void *);
//C     void CPL_DLL * CPL_STDCALL GDALCreateScaledProgress( double, double,
//C                                             GDALProgressFunc, void * );
void * GDALCreateScaledProgress(double , double , GDALProgressFunc , void *);
//C     void CPL_DLL CPL_STDCALL GDALDestroyScaledProgress( void * );
void  GDALDestroyScaledProgress(void *);
//C     CPL_C_END

//C     #endif /* ndef CPL_PROGRESS_H_INCLUDED */
