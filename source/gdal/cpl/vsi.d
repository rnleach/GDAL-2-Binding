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
FILE * VSIFOpen(const(char) *, const(char) *);
int  VSIFClose(FILE *);
int  VSIFSeek(FILE *, int , int );
int  VSIFTell(FILE *);
void  VSIRewind(FILE *);
void  VSIFFlush(FILE *);

size_t  VSIFRead(void *, size_t , size_t , FILE *);
size_t  VSIFWrite(void *, size_t , size_t , FILE *);
char * VSIFGets(char *, int , FILE *);
int  VSIFPuts(const(char) *, FILE *);
int  VSIFPrintf(FILE *, const(char) *,...);

int  VSIFGetc(FILE *);
int  VSIFPutc(int , FILE *);
int  VSIUngetc(int , FILE *);
int  VSIFEof(FILE *);

/* ==================================================================== */
/*      64bit stdio file access functions.  If we have a big size       */
/*      defined, then provide prototypes for the large file API,        */
/*      otherwise redefine to use the regular api.                      */
/* ==================================================================== */
alias GUIntBig vsi_l_offset;

alias GUINTBIG_MAX VSI_L_OFFSET_MAX;
alias FILE VSILFILE;

VSILFILE * VSIFOpenL(const(char) *, const(char) *);
VSILFILE * VSIFOpenExL(const(char) *, const(char) *, int );
int  VSIFCloseL(VSILFILE *);
int  VSIFSeekL(VSILFILE *, vsi_l_offset , int );
vsi_l_offset  VSIFTellL(VSILFILE *);
void  VSIRewindL(VSILFILE *);
size_t  VSIFReadL(void *, size_t , size_t , VSILFILE *);
int  VSIFReadMultiRangeL(int nRanges, void **ppData, vsi_l_offset *panOffsets, size_t *panSizes, VSILFILE *);
size_t  VSIFWriteL(void *, size_t , size_t , VSILFILE *);
int  VSIFEofL(VSILFILE *);
int  VSIFTruncateL(VSILFILE *, vsi_l_offset );
int  VSIFFlushL(VSILFILE *);
int  VSIFPrintfL(VSILFILE *, const(char) *,...);
int  VSIFPutcL(int , VSILFILE *);

int  VSIIngestFile(VSILFILE *fp, const(char) *pszFilename, GByte **ppabyRet, vsi_l_offset *pnSize, GIntBig nMaxSize);

/* ==================================================================== */
/*      Memory allocation                                               */
/* ==================================================================== */

void * VSICalloc(size_t , size_t );
void * VSIMalloc(size_t );
void  VSIFree(void *);
void * VSIRealloc(void *, size_t );
char * VSIStrdup(const(char) *);

/**
 VSIMalloc2 allocates (nSize1 * nSize2) bytes.
 In case of overflow of the multiplication, or if memory allocation fails, a
 NULL pointer is returned and a CE_Failure error is raised with CPLError().
 If nSize1 == 0 || nSize2 == 0, a NULL pointer will also be returned.
 CPLFree() or VSIFree() can be used to free memory allocated by this function.
*/
void * VSIMalloc2(size_t nSize1, size_t nSize2);

/**
 VSIMalloc3 allocates (nSize1 * nSize2 * nSize3) bytes.
 In case of overflow of the multiplication, or if memory allocation fails, a
 NULL pointer is returned and a CE_Failure error is raised with CPLError().
 If nSize1 == 0 || nSize2 == 0 || nSize3 == 0, a NULL pointer will also be returned.
 CPLFree() or VSIFree() can be used to free memory allocated by this function.
*/
void * VSIMalloc3(size_t nSize1, size_t nSize2, size_t nSize3);

void * VSIMallocVerbose(size_t nSize, const(char) *pszFile, int nLine);
void * VSIMalloc2Verbose(size_t nSize1, size_t nSize2, const(char) *pszFile, int nLine);

void * VSIMalloc3Verbose(size_t nSize1, size_t nSize2, size_t nSize3, const(char) *pszFile, int nLine);

void * VSICallocVerbose(size_t nCount, size_t nSize, const(char) *pszFile, int nLine);

void * VSIReallocVerbose(void *pOldPtr, size_t nNewSize, const(char) *pszFile, int nLine);

char * VSIStrdupVerbose(const(char) *pszStr, const(char) *pszFile, int nLine);


GIntBig  CPLGetPhysicalRAM();
GIntBig  CPLGetUsablePhysicalRAM();

/* ==================================================================== */
/*      Other...                                                        */
/* ==================================================================== */

alias VSIReadDir CPLReadDir;
char ** VSIReadDir(const(char) *);
char ** VSIReadDirRecursive(const(char) *pszPath);
char ** VSIReadDirEx(const(char) *pszPath, int nMaxFiles);
int  VSIMkdir(const(char) *pathname, int mode);
int  VSIRmdir(const(char) *pathname);
int  VSIUnlink(const(char) *pathname);
int  VSIRename(const(char) *oldpath, const(char) *newpath);
char * VSIStrerror(int );
GIntBig  VSIGetDiskFreeSpace(const(char) *pszDirname);

/* ==================================================================== */
/*      Install special file access handlers.                           */
/* ==================================================================== */
void  VSIInstallMemFileHandler();
void  VSIInstallLargeFileHandler();
void  VSIInstallSubFileHandler();
void  VSIInstallCurlFileHandler();
void  VSIInstallCurlStreamingFileHandler();
void  VSIInstallS3FileHandler();
void  VSIInstallS3StreamingFileHandler();
void  VSIInstallGZipFileHandler();
void  VSIInstallZipFileHandler();
void  VSIInstallStdinHandler();
void  VSIInstallStdoutHandler();
void  VSIInstallSparseFileHandler();
void  VSIInstallTarFileHandler();
void  VSIInstallCryptFileHandler();
void  VSISetCryptKey(GByte *pabyKey, int nKeySize);
void  VSICleanupFileManager();

VSILFILE * VSIFileFromMemBuffer(const(char *)pszFilename, GByte *pabyData, vsi_l_offset nDataLength, int bTakeOwnership);
GByte * VSIGetMemFileBuffer(const(char) *pszFilename, vsi_l_offset *pnDataLength, int bUnlinkAndSeize);

alias size_t  function(void *ptr, size_t size, size_t nmemb, FILE *stream)VSIWriteFunction;
void  VSIStdoutSetRedirection(VSIWriteFunction pFct, FILE *stream);
