/* Converted to D from C:/devLibs/gdal21/include/cpl_conv.h by htod */
module gdal.cpl.conv;
/******************************************************************************
 * $Id: cpl_conv.h 33666 2016-03-07 05:21:07Z goatbar $
 *
 * Project:  CPL - Common Portability Library
 * Purpose:  Convenience functions declarations.
 *           This is intended to remain light weight.
 * Author:   Frank Warmerdam, warmerdam@pobox.com
 *
 ******************************************************************************
 * Copyright (c) 1998, Frank Warmerdam
 * Copyright (c) 2007-2013, Even Rouault <even dot rouault at mines-paris dot org>
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
import gdal.cpl.vsi;
import gdal.cpl.error;

import core.stdc.stdio : FILE;

/**
 * \file cpl_conv.h
 *
 * Various convenience functions for CPL.
 *
 */

/* -------------------------------------------------------------------- */
/*      Runtime check of various configuration items.                   */
/* -------------------------------------------------------------------- */
extern (C):
void  CPLVerifyConfiguration() nothrow @nogc;

extern (System):
const(char) * CPLGetConfigOption(const(char) *, const(char) *) nothrow @nogc;
const(char) * CPLGetThreadLocalConfigOption(const(char) *, const(char) *) nothrow @nogc;
void  CPLSetConfigOption(const(char) *, const(char) *) nothrow @nogc;
void  CPLSetThreadLocalConfigOption(const(char) *pszKey, const(char) *pszValue) nothrow @nogc;
void  CPLFreeConfig() nothrow @nogc;

/* -------------------------------------------------------------------- */
/*      Safe malloc() API.  Thin cover over VSI functions with fatal    */
/*      error reporting if memory allocation fails.                     */
/* -------------------------------------------------------------------- */
//C     void CPL_DLL *CPLMalloc( size_t ) CPL_WARN_UNUSED_RESULT;
extern (C):
void * CPLMalloc(size_t ) nothrow @nogc;
void * CPLCalloc(size_t , size_t ) nothrow @nogc;
void * CPLRealloc(void *, size_t ) nothrow @nogc;
char * CPLStrdup(char *) nothrow @nogc;
char * CPLStrlwr(char *) nothrow @nogc;

alias VSIFree CPLFree;
/* -------------------------------------------------------------------- */
/*      Read a line from a text file, and strip of CR/LF.               */
/* -------------------------------------------------------------------- */
char * CPLFGets(char *, int , FILE *) nothrow @nogc;
const(char) * CPLReadLine(FILE *) nothrow @nogc;
const(char) * CPLReadLineL(VSILFILE *) nothrow @nogc;
const(char) * CPLReadLine2L(VSILFILE *, int nMaxCols, char **papszOptions) nothrow @nogc;

/* -------------------------------------------------------------------- */
/*      Convert ASCII string to floating point number                   */
/*      (THESE FUNCTIONS ARE NOT LOCALE AWARE!).                        */
/* -------------------------------------------------------------------- */
double  CPLAtof(const(char) *) nothrow @nogc;
double  CPLAtofDelim(const(char) *, char ) nothrow @nogc;
double  CPLStrtod(const(char) *, char **) nothrow @nogc;
double  CPLStrtodDelim(const(char) *, char **, char ) nothrow @nogc;
float  CPLStrtof(const(char) *, char **) nothrow @nogc;
float  CPLStrtofDelim(const(char) *, char **, char ) nothrow @nogc;

/* -------------------------------------------------------------------- */
/*      Convert number to string.  This function is locale agnostic     */
/*      (i.e. it will support "," or "." regardless of current locale)  */
/* -------------------------------------------------------------------- */
double  CPLAtofM(const(char) *) nothrow @nogc;

/* -------------------------------------------------------------------- */
/*      Read a numeric value from an ASCII character string.            */
/* -------------------------------------------------------------------- */
char * CPLScanString(const(char) *, int , int , int ) nothrow @nogc;
double  CPLScanDouble(const(char) *, int ) nothrow @nogc;
int  CPLScanLong(const(char) *, int ) nothrow @nogc;
uint  CPLScanULong(const(char) *, int ) nothrow @nogc;
GUIntBig  CPLScanUIntBig(const(char) *, int ) nothrow @nogc;
GIntBig  CPLAtoGIntBig(const(char) *pszString) nothrow @nogc;
GIntBig  CPLAtoGIntBigEx(const(char) *pszString, int bWarn, int *pbOverflow) nothrow @nogc;
void * CPLScanPointer(const(char) *, int ) nothrow @nogc;

/* -------------------------------------------------------------------- */
/*      Print a value to an ASCII character string.                     */
/* -------------------------------------------------------------------- */
int  CPLPrintString(char *, const(char) *, int ) nothrow @nogc;
int  CPLPrintStringFill(char *, const(char) *, int ) nothrow @nogc;
int  CPLPrintInt32(char *, GInt32 , int ) nothrow @nogc;
int  CPLPrintUIntBig(char *, GUIntBig , int ) nothrow @nogc;
int  CPLPrintDouble(char *, const(char) *, double , const(char) *) nothrow @nogc;
//int  CPLPrintTime(char *, int , const(char) *, tm *, const(char) *);
int  CPLPrintPointer(char *, void *, int ) nothrow @nogc;

/* -------------------------------------------------------------------- */
/*      Fetch a function from DLL / so.                                 */
/* -------------------------------------------------------------------- */

void * CPLGetSymbol(const(char) *, const(char) *) nothrow @nogc;

/* -------------------------------------------------------------------- */
/*      Fetch executable path.                                          */
/* -------------------------------------------------------------------- */
int  CPLGetExecPath(char *pszPathBuf, int nMaxLength) nothrow @nogc;

/* -------------------------------------------------------------------- */
/*      Filename handling functions.                                    */
/* -------------------------------------------------------------------- */
const(char) * CPLGetPath(const(char) *) nothrow @nogc;
const(char) * CPLGetDirname(const(char) *) nothrow @nogc;
const(char) * CPLGetFilename(const(char) *) nothrow @nogc;
const(char) * CPLGetBasename(const(char) *) nothrow @nogc;
const(char) * CPLGetExtension(const(char) *) nothrow @nogc;
char * CPLGetCurrentDir() nothrow @nogc;
const(char) * CPLFormFilename(const(char) *pszPath, const(char) *pszBasename, const(char) *pszExtension) nothrow @nogc;
const(char) * CPLFormCIFilename(const(char) *pszPath, const(char) *pszBasename, const(char) *pszExtension) nothrow @nogc;
const(char) * CPLResetExtension(const(char) *, const(char) *) nothrow @nogc;
const(char) * CPLProjectRelativeFilename(const(char) *pszProjectDir, const(char) *pszSecondaryFilename) nothrow @nogc;
int  CPLIsFilenameRelative(const(char) *pszFilename) nothrow @nogc;
const(char) * CPLExtractRelativePath(const(char) *, const(char) *, int *) nothrow @nogc;
const(char) * CPLCleanTrailingSlash(const(char) *) nothrow @nogc;
char ** CPLCorrespondingPaths(const(char) *pszOldFilename, const(char) *pszNewFilename, char **papszFileList) nothrow @nogc;
int  CPLCheckForFile(char *pszFilename, char **papszSiblingList) nothrow @nogc;

const(char) * CPLGenerateTempFilename(const(char) *pszStem) nothrow @nogc;

/* -------------------------------------------------------------------- */
/*      Find File Function                                              */
/* -------------------------------------------------------------------- */
alias const(char) * function(const(char) *, const(char) *)CPLFileFinder;

const(char) * CPLFindFile(const(char) *pszClass, const(char) *pszBasename) nothrow @nogc;
const(char) * CPLDefaultFindFile(const(char) *pszClass, const(char) *pszBasename) nothrow @nogc;
void  CPLPushFileFinder(CPLFileFinder pfnFinder) nothrow @nogc;
CPLFileFinder  CPLPopFileFinder() nothrow @nogc;
void  CPLPushFinderLocation(const(char) *) nothrow @nogc;
void  CPLPopFinderLocation() nothrow @nogc;
void  CPLFinderClean() nothrow @nogc;

/* -------------------------------------------------------------------- */
/*      Reference counted file handle manager.  Makes sharing file      */
/*      handles more practical.                                         */
/* -------------------------------------------------------------------- */
struct _N2
{
    FILE *fp;
    int nRefCount;
    int bLarge;
    char *pszFilename;
    char *pszAccess;
}
alias _N2 CPLSharedFileInfo;

FILE * CPLOpenShared(const(char) *, const(char) *, int ) nothrow @nogc;
void  CPLCloseShared(FILE *) nothrow @nogc;
CPLSharedFileInfo * CPLGetSharedList(int *) nothrow @nogc;
void  CPLDumpSharedList(FILE *) nothrow @nogc;
void  CPLCleanupSharedFileMutex() nothrow @nogc;

/* -------------------------------------------------------------------- */
/*      DMS to Dec to DMS conversion.                                   */
/* -------------------------------------------------------------------- */
double  CPLDMSToDec(const(char) *) nothrow @nogc;
const(char) * CPLDecToDMS(double dfAngle, const(char) *pszAxis, int nPrecision) nothrow @nogc;
double  CPLPackedDMSToDec(double ) nothrow @nogc;
double  CPLDecToPackedDMS(double dfDec) nothrow @nogc;

void  CPLStringToComplex(const(char) *pszString, double *pdfReal, double *pdfImag) nothrow @nogc;

/* -------------------------------------------------------------------- */
/*      Misc other functions.                                           */
/* -------------------------------------------------------------------- */
int  CPLUnlinkTree(const(char) *) nothrow @nogc;
int  CPLCopyFile(const(char) *pszNewPath, const(char) *pszOldPath) nothrow @nogc;
int  CPLCopyTree(const(char) *pszNewPath, const(char) *pszOldPath) nothrow @nogc;
int  CPLMoveFile(const(char) *pszNewPath, const(char) *pszOldPath) nothrow @nogc;
int  CPLSymlink(const(char) *pszOldPath, const(char) *pszNewPath, char **papszOptions) nothrow @nogc;

/* -------------------------------------------------------------------- */
/*      ZIP Creation.                                                   */
/* -------------------------------------------------------------------- */
void * CPLCreateZip(const(char) *pszZipFilename, char **papszOptions) nothrow @nogc;
CPLErr  CPLCreateFileInZip(void *hZip, const(char) *pszFilename, char **papszOptions) nothrow @nogc;
CPLErr  CPLWriteFileInZip(void *hZip, void *pBuffer, int nBufferSize) nothrow @nogc;
CPLErr  CPLCloseFileInZip(void *hZip) nothrow @nogc;
CPLErr  CPLCloseZip(void *hZip) nothrow @nogc;

/* -------------------------------------------------------------------- */
/*      ZLib compression                                                */
/* -------------------------------------------------------------------- */

void * CPLZLibDeflate(void *ptr, size_t nBytes, int nLevel, void *outptr, size_t nOutAvailableBytes, size_t *pnOutBytes) nothrow @nogc;
void * CPLZLibInflate(void *ptr, size_t nBytes, void *outptr, size_t nOutAvailableBytes, size_t *pnOutBytes) nothrow @nogc;

/* -------------------------------------------------------------------- */
/*      XML validation.                                                 */
/* -------------------------------------------------------------------- */
int  CPLValidateXML(const(char) *pszXMLFilename, const(char) *pszXSDFilename, char **papszOptions) nothrow @nogc;

/* -------------------------------------------------------------------- */
/*      Locale handling. Prevents parallel executions of setlocale().   */
/* -------------------------------------------------------------------- */
char * CPLsetlocale(int category, const(char) *locale) nothrow @nogc;
void  CPLCleanupSetlocaleMutex() nothrow @nogc;
