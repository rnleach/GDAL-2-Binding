/* Converted to D from C:/devLibs/gdal21/include/cpl_vsi.h by htod */
module gdal.cpl.vsi;
/******************************************************************************
 * $Id: cpl_vsi.h 33758 2016-03-21 09:06:22Z rouault $
 *
 * Project:  CPL - Common Portability Library
 * Author:   Frank Warmerdam, warmerdam@pobox.com
 * Purpose:  Include file defining Virtual File System (VSI) functions, a
 *           layer over POSIX file and other system services.
 *
 ******************************************************************************
 * Copyright (c) 1998, Frank Warmerdam
 * Copyright (c) 2008-2014, Even Rouault <even dot rouault at mines-paris dot org>
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

import core.stdc.stdio : FILE;

/**
* I did not provide bindings for all the functions in this header, I only
* wanted the memory management functions. The rest are not needed to use
* GDAL in an application.
*/
/**
 * \file cpl_vsi.h
 *
 * Standard C Covers
 *
 * The VSI functions are intended to be hookable aliases for Standard C
 * I/O, memory allocation and other system functions. They are intended
 * to allow virtualization of disk I/O so that non file data sources
 * can be made to appear as files, and so that additional error trapping
 * and reporting can be interested.  The memory access API is aliased
 * so that special application memory management services can be used.
 *
 * It is intended that each of these functions retains exactly the same
 * calling pattern as the original Standard C functions they relate to.
 * This means we don't have to provide custom documentation, and also means
 * that the default implementation is very simple.
 */

extern (C):
FILE * VSIFOpen(const(char) *, const(char) *) nothrow @nogc;
int  VSIFClose(FILE *) nothrow @nogc;
int  VSIFSeek(FILE *, int , int ) nothrow @nogc;
int  VSIFTell(FILE *) nothrow @nogc;
void  VSIRewind(FILE *) nothrow @nogc;
void  VSIFFlush(FILE *) nothrow @nogc;

size_t  VSIFRead(void *, size_t , size_t , FILE *) nothrow @nogc;
size_t  VSIFWrite(void *, size_t , size_t , FILE *) nothrow @nogc;
char * VSIFGets(char *, int , FILE *) nothrow @nogc;
int  VSIFPuts(const(char) *, FILE *) nothrow @nogc;
int  VSIFPrintf(FILE *, const(char) *,...) nothrow @nogc;

int  VSIFGetc(FILE *) nothrow @nogc;
int  VSIFPutc(int , FILE *) nothrow @nogc;
int  VSIUngetc(int , FILE *) nothrow @nogc;
int  VSIFEof(FILE *) nothrow @nogc;

/* ==================================================================== */
/*      64bit stdio file access functions.  If we have a big size       */
/*      defined, then provide prototypes for the large file API,        */
/*      otherwise redefine to use the regular api.                      */
/* ==================================================================== */
alias GUIntBig vsi_l_offset;

alias GUINTBIG_MAX VSI_L_OFFSET_MAX;
alias FILE VSILFILE;

VSILFILE * VSIFOpenL(const(char) *, const(char) *) nothrow @nogc;
VSILFILE * VSIFOpenExL(const(char) *, const(char) *, int ) nothrow @nogc;
int  VSIFCloseL(VSILFILE *) nothrow @nogc;
int  VSIFSeekL(VSILFILE *, vsi_l_offset , int ) nothrow @nogc;
vsi_l_offset  VSIFTellL(VSILFILE *) nothrow @nogc;
void  VSIRewindL(VSILFILE *) nothrow @nogc;
size_t  VSIFReadL(void *, size_t , size_t , VSILFILE *) nothrow @nogc;
int  VSIFReadMultiRangeL(int nRanges, void **ppData, vsi_l_offset *panOffsets, size_t *panSizes, VSILFILE *) nothrow @nogc;
size_t  VSIFWriteL(void *, size_t , size_t , VSILFILE *) nothrow @nogc;
int  VSIFEofL(VSILFILE *) nothrow @nogc;
int  VSIFTruncateL(VSILFILE *, vsi_l_offset ) nothrow @nogc;
int  VSIFFlushL(VSILFILE *) nothrow @nogc;
int  VSIFPrintfL(VSILFILE *, const(char) *,...) nothrow @nogc;
int  VSIFPutcL(int , VSILFILE *) nothrow @nogc;

int  VSIIngestFile(VSILFILE *fp, const(char) *pszFilename, GByte **ppabyRet, vsi_l_offset *pnSize, GIntBig nMaxSize) nothrow @nogc;

/* ==================================================================== */
/*      Memory allocation                                               */
/* ==================================================================== */

void * VSICalloc(size_t , size_t ) nothrow @nogc;
void * VSIMalloc(size_t ) nothrow @nogc;
void  VSIFree(void *) nothrow @nogc;
void * VSIRealloc(void *, size_t ) nothrow @nogc;
char * VSIStrdup(const(char) *) nothrow @nogc;

/**
 VSIMalloc2 allocates (nSize1 * nSize2) bytes.
 In case of overflow of the multiplication, or if memory allocation fails, a
 NULL pointer is returned and a CE_Failure error is raised with CPLError().
 If nSize1 == 0 || nSize2 == 0, a NULL pointer will also be returned.
 CPLFree() or VSIFree() can be used to free memory allocated by this function.
*/
void * VSIMalloc2(size_t nSize1, size_t nSize2) nothrow @nogc;

/**
 VSIMalloc3 allocates (nSize1 * nSize2 * nSize3) bytes.
 In case of overflow of the multiplication, or if memory allocation fails, a
 NULL pointer is returned and a CE_Failure error is raised with CPLError().
 If nSize1 == 0 || nSize2 == 0 || nSize3 == 0, a NULL pointer will also be returned.
 CPLFree() or VSIFree() can be used to free memory allocated by this function.
*/
void * VSIMalloc3(size_t nSize1, size_t nSize2, size_t nSize3) nothrow @nogc;

void * VSIMallocVerbose(size_t nSize, const(char) *pszFile, int nLine);
void * VSIMalloc2Verbose(size_t nSize1, size_t nSize2, const(char) *pszFile, int nLine) nothrow @nogc;

void * VSIMalloc3Verbose(size_t nSize1, size_t nSize2, size_t nSize3, const(char) *pszFile, int nLine) nothrow @nogc;

void * VSICallocVerbose(size_t nCount, size_t nSize, const(char) *pszFile, int nLine) nothrow @nogc;

void * VSIReallocVerbose(void *pOldPtr, size_t nNewSize, const(char) *pszFile, int nLine) nothrow @nogc;

char * VSIStrdupVerbose(const(char) *pszStr, const(char) *pszFile, int nLine) nothrow @nogc;


GIntBig  CPLGetPhysicalRAM() nothrow @nogc;
GIntBig  CPLGetUsablePhysicalRAM() nothrow @nogc;

/* ==================================================================== */
/*      Other...                                                        */
/* ==================================================================== */

alias VSIReadDir CPLReadDir;
char ** VSIReadDir(const(char) *) nothrow @nogc;
char ** VSIReadDirRecursive(const(char) *pszPath) nothrow @nogc;
char ** VSIReadDirEx(const(char) *pszPath, int nMaxFiles) nothrow @nogc;
int  VSIMkdir(const(char) *pathname, int mode) nothrow @nogc;
int  VSIRmdir(const(char) *pathname) nothrow @nogc;
int  VSIUnlink(const(char) *pathname) nothrow @nogc;
int  VSIRename(const(char) *oldpath, const(char) *newpath) nothrow @nogc;
char * VSIStrerror(int ) nothrow @nogc;
GIntBig  VSIGetDiskFreeSpace(const(char) *pszDirname) nothrow @nogc;

/* ==================================================================== */
/*      Install special file access handlers.                           */
/* ==================================================================== */
void  VSIInstallMemFileHandler() nothrow @nogc;
void  VSIInstallLargeFileHandler() nothrow @nogc;
void  VSIInstallSubFileHandler() nothrow @nogc;
void  VSIInstallCurlFileHandler() nothrow @nogc;
void  VSIInstallCurlStreamingFileHandler() nothrow @nogc;
void  VSIInstallS3FileHandler() nothrow @nogc;
void  VSIInstallS3StreamingFileHandler() nothrow @nogc;
void  VSIInstallGZipFileHandler() nothrow @nogc;
void  VSIInstallZipFileHandler() nothrow @nogc;
void  VSIInstallStdinHandler() nothrow @nogc;
void  VSIInstallStdoutHandler() nothrow @nogc;
void  VSIInstallSparseFileHandler() nothrow @nogc;
void  VSIInstallTarFileHandler() nothrow @nogc;
void  VSIInstallCryptFileHandler() nothrow @nogc;
void  VSISetCryptKey(GByte *pabyKey, int nKeySize) nothrow @nogc;
void  VSICleanupFileManager() nothrow @nogc;

VSILFILE * VSIFileFromMemBuffer(const(char *)pszFilename, GByte *pabyData, vsi_l_offset nDataLength, int bTakeOwnership) nothrow @nogc;
GByte * VSIGetMemFileBuffer(const(char) *pszFilename, vsi_l_offset *pnDataLength, int bUnlinkAndSeize) nothrow @nogc;

alias size_t  function(void *ptr, size_t size, size_t nmemb, FILE *stream)VSIWriteFunction;
void  VSIStdoutSetRedirection(VSIWriteFunction pFct, FILE *stream) nothrow @nogc;
