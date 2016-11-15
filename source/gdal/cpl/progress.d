/* Converted to D from C:/devLibs/gdal21/include/cpl_progress.h by htod */
module gdal.cpl.progress;
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

import gdal.cpl.port;

extern (C):
alias GDALProgressFunc = int function(double dfComplete, char *pszMessage, 
  void *pProgressArg);

extern (Windows):
int  GDALDummyProgress(double , char *, void *);
int  GDALTermProgress(double , char *, void *);
int  GDALScaledProgress(double , char *, void *);
void * GDALCreateScaledProgress(double , double , GDALProgressFunc , void *);
void  GDALDestroyScaledProgress(void *);
