/* Converted to D from C:/devLibs/gdal21/include/cpl_vsi.h by htod */
module ./cpl_vsi;
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

//C     #ifndef CPL_VSI_H_INCLUDED
//C     #define CPL_VSI_H_INCLUDED

//C     #include "cpl_port.h"
import cpl_port;
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

/* -------------------------------------------------------------------- */
/*      We need access to ``struct stat''.                              */
/* -------------------------------------------------------------------- */

/* Unix */
//C     #if !defined(_WIN32)
//C     #  include <unistd.h>
//C     #endif

/* Windows */
//C     #include <sys/stat.h>
import std.c.stat;

//C     CPL_C_START

//C     #ifdef ENABLE_EXPERIMENTAL_CPL_WARN_UNUSED_RESULT
//C     #define EXPERIMENTAL_CPL_WARN_UNUSED_RESULT CPL_WARN_UNUSED_RESULT
//C     #else
//C     #define EXPERIMENTAL_CPL_WARN_UNUSED_RESULT
//C     #endif

/* ==================================================================== */
/*      stdio file access functions.  These may not support large       */
/*      files, and don't necessarily go through the virtualization      */
/*      API.                                                            */
/* ==================================================================== */

//C     FILE CPL_DLL *  VSIFOpen( const char *, const char * ) CPL_WARN_UNUSED_RESULT;
extern (C):
FILE * VSIFOpen(char *, char *);
//C     int CPL_DLL     VSIFClose( FILE * );
int  VSIFClose(FILE *);
//C     int CPL_DLL     VSIFSeek( FILE *, long, int ) EXPERIMENTAL_CPL_WARN_UNUSED_RESULT;
int  VSIFSeek(FILE *, int , int );
//C     long CPL_DLL    VSIFTell( FILE * ) CPL_WARN_UNUSED_RESULT;
int  VSIFTell(FILE *);
//C     void CPL_DLL    VSIRewind( FILE * );
void  VSIRewind(FILE *);
//C     void CPL_DLL    VSIFFlush( FILE * );
void  VSIFFlush(FILE *);

//C     size_t CPL_DLL  VSIFRead( void *, size_t, size_t, FILE * ) EXPERIMENTAL_CPL_WARN_UNUSED_RESULT;
size_t  VSIFRead(void *, size_t , size_t , FILE *);
//C     size_t CPL_DLL  VSIFWrite( const void *, size_t, size_t, FILE * ) EXPERIMENTAL_CPL_WARN_UNUSED_RESULT;
size_t  VSIFWrite(void *, size_t , size_t , FILE *);
//C     char CPL_DLL   *VSIFGets( char *, int, FILE * ) EXPERIMENTAL_CPL_WARN_UNUSED_RESULT;
char * VSIFGets(char *, int , FILE *);
//C     int CPL_DLL     VSIFPuts( const char *, FILE * ) EXPERIMENTAL_CPL_WARN_UNUSED_RESULT;
int  VSIFPuts(char *, FILE *);
//C     int CPL_DLL     VSIFPrintf( FILE *, const char *, ... ) EXPERIMENTAL_CPL_WARN_UNUSED_RESULT CPL_PRINT_FUNC_FORMAT(2, 3);
int  VSIFPrintf(FILE *, char *,...);

//C     int CPL_DLL     VSIFGetc( FILE * ) EXPERIMENTAL_CPL_WARN_UNUSED_RESULT;
int  VSIFGetc(FILE *);
//C     int CPL_DLL     VSIFPutc( int, FILE * ) EXPERIMENTAL_CPL_WARN_UNUSED_RESULT;
int  VSIFPutc(int , FILE *);
//C     int CPL_DLL     VSIUngetc( int, FILE * ) EXPERIMENTAL_CPL_WARN_UNUSED_RESULT;
int  VSIUngetc(int , FILE *);
//C     int CPL_DLL     VSIFEof( FILE * ) EXPERIMENTAL_CPL_WARN_UNUSED_RESULT;
int  VSIFEof(FILE *);

/* ==================================================================== */
/*      VSIStat() related.                                              */
/* ==================================================================== */

//C     typedef struct stat VSIStatBuf;
alias stat VSIStatBuf;
//C     int CPL_DLL VSIStat( const char *, VSIStatBuf * ) CPL_WARN_UNUSED_RESULT;
int  VSIStat(char *, VSIStatBuf *);

//C     #ifdef _WIN32
//C     #  define VSI_ISLNK(x)  ( 0 )            /* N/A on Windows */
//C     #  define VSI_ISREG(x)  ((x) & S_IFREG)
//C     #  define VSI_ISDIR(x)  ((x) & S_IFDIR)
//C     #  define VSI_ISCHR(x)  ((x) & S_IFCHR)
//C     #  define VSI_ISBLK(x)  ( 0 )            /* N/A on Windows */
//C     #else
//C     #  define VSI_ISLNK(x)  S_ISLNK(x)
//C     #  define VSI_ISREG(x)  S_ISREG(x)
//C     #  define VSI_ISDIR(x)  S_ISDIR(x)
//C     #  define VSI_ISCHR(x)  S_ISCHR(x)
//C     #  define VSI_ISBLK(x)  S_ISBLK(x)
//C     #endif

/* ==================================================================== */
/*      64bit stdio file access functions.  If we have a big size       */
/*      defined, then provide prototypes for the large file API,        */
/*      otherwise redefine to use the regular api.                      */
/* ==================================================================== */
//C     typedef GUIntBig vsi_l_offset;
alias GUIntBig vsi_l_offset;
//C     #define VSI_L_OFFSET_MAX GUINTBIG_MAX

alias GUINTBIG_MAX VSI_L_OFFSET_MAX;
/* Make VSIL_STRICT_ENFORCE active in DEBUG builds */
//C     #ifdef DEBUG
//C     #define VSIL_STRICT_ENFORCE
//C     #endif

//C     #ifdef VSIL_STRICT_ENFORCE
//C     typedef struct _VSILFILE VSILFILE;
//C     #else
//C     typedef FILE VSILFILE;
alias FILE VSILFILE;
//C     #endif

//C     VSILFILE CPL_DLL *  VSIFOpenL( const char *, const char * ) CPL_WARN_UNUSED_RESULT;
VSILFILE * VSIFOpenL(char *, char *);
//C     VSILFILE CPL_DLL *  VSIFOpenExL( const char *, const char *, int ) CPL_WARN_UNUSED_RESULT;
VSILFILE * VSIFOpenExL(char *, char *, int );
//C     int CPL_DLL     VSIFCloseL( VSILFILE * ) EXPERIMENTAL_CPL_WARN_UNUSED_RESULT;
int  VSIFCloseL(VSILFILE *);
//C     int CPL_DLL     VSIFSeekL( VSILFILE *, vsi_l_offset, int ) EXPERIMENTAL_CPL_WARN_UNUSED_RESULT;
int  VSIFSeekL(VSILFILE *, vsi_l_offset , int );
//C     vsi_l_offset CPL_DLL VSIFTellL( VSILFILE * ) CPL_WARN_UNUSED_RESULT;
vsi_l_offset  VSIFTellL(VSILFILE *);
//C     void CPL_DLL    VSIRewindL( VSILFILE * );
void  VSIRewindL(VSILFILE *);
//C     size_t CPL_DLL  VSIFReadL( void *, size_t, size_t, VSILFILE * ) EXPERIMENTAL_CPL_WARN_UNUSED_RESULT;
size_t  VSIFReadL(void *, size_t , size_t , VSILFILE *);
//C     int CPL_DLL     VSIFReadMultiRangeL( int nRanges, void ** ppData, const vsi_l_offset* panOffsets, const size_t* panSizes, VSILFILE * ) EXPERIMENTAL_CPL_WARN_UNUSED_RESULT;
int  VSIFReadMultiRangeL(int nRanges, void **ppData, vsi_l_offset *panOffsets, size_t *panSizes, VSILFILE *);
//C     size_t CPL_DLL  VSIFWriteL( const void *, size_t, size_t, VSILFILE * ) EXPERIMENTAL_CPL_WARN_UNUSED_RESULT;
size_t  VSIFWriteL(void *, size_t , size_t , VSILFILE *);
//C     int CPL_DLL     VSIFEofL( VSILFILE * ) EXPERIMENTAL_CPL_WARN_UNUSED_RESULT;
int  VSIFEofL(VSILFILE *);
//C     int CPL_DLL     VSIFTruncateL( VSILFILE *, vsi_l_offset ) EXPERIMENTAL_CPL_WARN_UNUSED_RESULT;
int  VSIFTruncateL(VSILFILE *, vsi_l_offset );
//C     int CPL_DLL     VSIFFlushL( VSILFILE * ) EXPERIMENTAL_CPL_WARN_UNUSED_RESULT;
int  VSIFFlushL(VSILFILE *);
//C     int CPL_DLL     VSIFPrintfL( VSILFILE *, const char *, ... ) EXPERIMENTAL_CPL_WARN_UNUSED_RESULT CPL_PRINT_FUNC_FORMAT(2, 3);
int  VSIFPrintfL(VSILFILE *, char *,...);
//C     int CPL_DLL     VSIFPutcL( int, VSILFILE * ) EXPERIMENTAL_CPL_WARN_UNUSED_RESULT;
int  VSIFPutcL(int , VSILFILE *);

//C     int CPL_DLL     VSIIngestFile( VSILFILE* fp,
//C                                    const char* pszFilename,
//C                                    GByte** ppabyRet,
//C                                    vsi_l_offset* pnSize,
//C                                    GIntBig nMaxSize ) CPL_WARN_UNUSED_RESULT;
int  VSIIngestFile(VSILFILE *fp, char *pszFilename, GByte **ppabyRet, vsi_l_offset *pnSize, GIntBig nMaxSize);

//C     #if defined(VSI_STAT64_T)
//C     typedef struct VSI_STAT64_T VSIStatBufL;
alias __stat64 VSIStatBufL;
//C     #else
//C     #define VSIStatBufL    VSIStatBuf
//C     #endif

//C     int CPL_DLL     VSIStatL( const char *, VSIStatBufL * ) CPL_WARN_UNUSED_RESULT;
int  VSIStatL(char *, VSIStatBufL *);

//C     #define VSI_STAT_EXISTS_FLAG         0x1
//C     #define VSI_STAT_NATURE_FLAG         0x2
const VSI_STAT_EXISTS_FLAG = 0x1;
//C     #define VSI_STAT_SIZE_FLAG           0x4
const VSI_STAT_NATURE_FLAG = 0x2;
//C     #define VSI_STAT_SET_ERROR_FLAG      0x8
const VSI_STAT_SIZE_FLAG = 0x4;

const VSI_STAT_SET_ERROR_FLAG = 0x8;
//C     int CPL_DLL     VSIStatExL( const char * pszFilename, VSIStatBufL * psStatBuf, int nFlags ) CPL_WARN_UNUSED_RESULT;
int  VSIStatExL(char *pszFilename, VSIStatBufL *psStatBuf, int nFlags);

//C     int CPL_DLL     VSIIsCaseSensitiveFS( const char * pszFilename );
int  VSIIsCaseSensitiveFS(char *pszFilename);

//C     void CPL_DLL   *VSIFGetNativeFileDescriptorL( VSILFILE* );
void * VSIFGetNativeFileDescriptorL(VSILFILE *);

/* ==================================================================== */
/*      Memory allocation                                               */
/* ==================================================================== */

//C     void CPL_DLL   *VSICalloc( size_t, size_t ) CPL_WARN_UNUSED_RESULT;
void * VSICalloc(size_t , size_t );
//C     void CPL_DLL   *VSIMalloc( size_t ) CPL_WARN_UNUSED_RESULT;
void * VSIMalloc(size_t );
//C     void CPL_DLL    VSIFree( void * );
void  VSIFree(void *);
//C     void CPL_DLL   *VSIRealloc( void *, size_t ) CPL_WARN_UNUSED_RESULT;
void * VSIRealloc(void *, size_t );
//C     char CPL_DLL   *VSIStrdup( const char * ) CPL_WARN_UNUSED_RESULT;
char * VSIStrdup(char *);

/**
 VSIMalloc2 allocates (nSize1 * nSize2) bytes.
 In case of overflow of the multiplication, or if memory allocation fails, a
 NULL pointer is returned and a CE_Failure error is raised with CPLError().
 If nSize1 == 0 || nSize2 == 0, a NULL pointer will also be returned.
 CPLFree() or VSIFree() can be used to free memory allocated by this function.
*/
//C     void CPL_DLL *VSIMalloc2( size_t nSize1, size_t nSize2 ) CPL_WARN_UNUSED_RESULT;
void * VSIMalloc2(size_t nSize1, size_t nSize2);

/**
 VSIMalloc3 allocates (nSize1 * nSize2 * nSize3) bytes.
 In case of overflow of the multiplication, or if memory allocation fails, a
 NULL pointer is returned and a CE_Failure error is raised with CPLError().
 If nSize1 == 0 || nSize2 == 0 || nSize3 == 0, a NULL pointer will also be returned.
 CPLFree() or VSIFree() can be used to free memory allocated by this function.
*/
//C     void CPL_DLL *VSIMalloc3( size_t nSize1, size_t nSize2, size_t nSize3 ) CPL_WARN_UNUSED_RESULT;
void * VSIMalloc3(size_t nSize1, size_t nSize2, size_t nSize3);


//C     void CPL_DLL   *VSIMallocVerbose( size_t nSize, const char* pszFile, int nLine ) CPL_WARN_UNUSED_RESULT;
void * VSIMallocVerbose(size_t nSize, char *pszFile, int nLine);
//C     #define VSI_MALLOC_VERBOSE( size ) VSIMallocVerbose(size,__FILE__,__LINE__)

//C     void CPL_DLL   *VSIMalloc2Verbose( size_t nSize1, size_t nSize2, const char* pszFile, int nLine ) CPL_WARN_UNUSED_RESULT;
void * VSIMalloc2Verbose(size_t nSize1, size_t nSize2, char *pszFile, int nLine);
//C     #define VSI_MALLOC2_VERBOSE( nSize1, nSize2 ) VSIMalloc2Verbose(nSize1,nSize2,__FILE__,__LINE__)

//C     void CPL_DLL   *VSIMalloc3Verbose( size_t nSize1, size_t nSize2, size_t nSize3, const char* pszFile, int nLine ) CPL_WARN_UNUSED_RESULT;
void * VSIMalloc3Verbose(size_t nSize1, size_t nSize2, size_t nSize3, char *pszFile, int nLine);
//C     #define VSI_MALLOC3_VERBOSE( nSize1, nSize2, nSize3 ) VSIMalloc3Verbose(nSize1,nSize2,nSize3,__FILE__,__LINE__)

//C     void CPL_DLL   *VSICallocVerbose(  size_t nCount, size_t nSize, const char* pszFile, int nLine ) CPL_WARN_UNUSED_RESULT;
void * VSICallocVerbose(size_t nCount, size_t nSize, char *pszFile, int nLine);
//C     #define VSI_CALLOC_VERBOSE( nCount, nSize ) VSICallocVerbose(nCount,nSize,__FILE__,__LINE__)

//C     void CPL_DLL   *VSIReallocVerbose(  void* pOldPtr, size_t nNewSize, const char* pszFile, int nLine ) CPL_WARN_UNUSED_RESULT;
void * VSIReallocVerbose(void *pOldPtr, size_t nNewSize, char *pszFile, int nLine);
//C     #define VSI_REALLOC_VERBOSE( pOldPtr, nNewSize ) VSIReallocVerbose(pOldPtr,nNewSize,__FILE__,__LINE__)

//C     char CPL_DLL   *VSIStrdupVerbose(  const char* pszStr, const char* pszFile, int nLine ) CPL_WARN_UNUSED_RESULT;
char * VSIStrdupVerbose(char *pszStr, char *pszFile, int nLine);
//C     #define VSI_STRDUP_VERBOSE( pszStr ) VSIStrdupVerbose(pszStr,__FILE__,__LINE__)


//C     GIntBig CPL_DLL CPLGetPhysicalRAM(void);
GIntBig  CPLGetPhysicalRAM();
//C     GIntBig CPL_DLL CPLGetUsablePhysicalRAM(void);
GIntBig  CPLGetUsablePhysicalRAM();

/* ==================================================================== */
/*      Other...                                                        */
/* ==================================================================== */

//C     #define CPLReadDir VSIReadDir
//C     char CPL_DLL **VSIReadDir( const char * );
alias VSIReadDir CPLReadDir;
char ** VSIReadDir(char *);
//C     char CPL_DLL **VSIReadDirRecursive( const char *pszPath );
char ** VSIReadDirRecursive(char *pszPath);
//C     char CPL_DLL **VSIReadDirEx( const char *pszPath, int nMaxFiles );
char ** VSIReadDirEx(char *pszPath, int nMaxFiles);
//C     int CPL_DLL VSIMkdir( const char * pathname, long mode );
int  VSIMkdir(char *pathname, int mode);
//C     int CPL_DLL VSIRmdir( const char * pathname );
int  VSIRmdir(char *pathname);
//C     int CPL_DLL VSIUnlink( const char * pathname );
int  VSIUnlink(char *pathname);
//C     int CPL_DLL VSIRename( const char * oldpath, const char * newpath );
int  VSIRename(char *oldpath, char *newpath);
//C     char CPL_DLL *VSIStrerror( int );
char * VSIStrerror(int );
//C     GIntBig CPL_DLL VSIGetDiskFreeSpace(const char *pszDirname);
GIntBig  VSIGetDiskFreeSpace(char *pszDirname);

/* ==================================================================== */
/*      Install special file access handlers.                           */
/* ==================================================================== */
//C     void CPL_DLL VSIInstallMemFileHandler(void);
void  VSIInstallMemFileHandler();
//C     void CPL_DLL VSIInstallLargeFileHandler(void);
void  VSIInstallLargeFileHandler();
//C     void CPL_DLL VSIInstallSubFileHandler(void);
void  VSIInstallSubFileHandler();
//C     void VSIInstallCurlFileHandler(void);
void  VSIInstallCurlFileHandler();
//C     void VSIInstallCurlStreamingFileHandler(void);
void  VSIInstallCurlStreamingFileHandler();
//C     void VSIInstallS3FileHandler(void);
void  VSIInstallS3FileHandler();
//C     void VSIInstallS3StreamingFileHandler(void);
void  VSIInstallS3StreamingFileHandler();
//C     void VSIInstallGZipFileHandler(void); /* No reason to export that */
void  VSIInstallGZipFileHandler();
//C     void VSIInstallZipFileHandler(void); /* No reason to export that */
void  VSIInstallZipFileHandler();
//C     void VSIInstallStdinHandler(void); /* No reason to export that */
void  VSIInstallStdinHandler();
//C     void VSIInstallStdoutHandler(void); /* No reason to export that */
void  VSIInstallStdoutHandler();
//C     void CPL_DLL VSIInstallSparseFileHandler(void);
void  VSIInstallSparseFileHandler();
//C     void VSIInstallTarFileHandler(void); /* No reason to export that */
void  VSIInstallTarFileHandler();
//C     void CPL_DLL VSIInstallCryptFileHandler(void);
void  VSIInstallCryptFileHandler();
//C     void CPL_DLL VSISetCryptKey(const GByte* pabyKey, int nKeySize);
void  VSISetCryptKey(GByte *pabyKey, int nKeySize);
//C     void CPL_DLL VSICleanupFileManager(void);
void  VSICleanupFileManager();

//C     VSILFILE CPL_DLL *VSIFileFromMemBuffer( const char *pszFilename,
//C                                         GByte *pabyData,
//C                                         vsi_l_offset nDataLength,
//C                                         int bTakeOwnership ) CPL_WARN_UNUSED_RESULT;
VSILFILE * VSIFileFromMemBuffer(char *pszFilename, GByte *pabyData, vsi_l_offset nDataLength, int bTakeOwnership);
//C     GByte CPL_DLL *VSIGetMemFileBuffer( const char *pszFilename,
//C                                         vsi_l_offset *pnDataLength,
//C                                         int bUnlinkAndSeize );
GByte * VSIGetMemFileBuffer(char *pszFilename, vsi_l_offset *pnDataLength, int bUnlinkAndSeize);

//C     typedef size_t (*VSIWriteFunction)(const void* ptr, size_t size, size_t nmemb, FILE* stream);
alias size_t  function(void *ptr, size_t size, size_t nmemb, FILE *stream)VSIWriteFunction;
//C     void CPL_DLL VSIStdoutSetRedirection( VSIWriteFunction pFct, FILE* stream );
void  VSIStdoutSetRedirection(VSIWriteFunction pFct, FILE *stream);

/* ==================================================================== */
/*      Time querying.                                                  */
/* ==================================================================== */

//C     unsigned long CPL_DLL VSITime( unsigned long * );
uint  VSITime(uint *);
//C     const char CPL_DLL *VSICTime( unsigned long );
char * VSICTime(uint );
//C     struct tm CPL_DLL *VSIGMTime( const time_t *pnTime,
//C                                   struct tm *poBrokenTime );
tm * VSIGMTime(time_t *pnTime, tm *poBrokenTime);
//C     struct tm CPL_DLL *VSILocalTime( const time_t *pnTime,
//C                                      struct tm *poBrokenTime );
tm * VSILocalTime(time_t *pnTime, tm *poBrokenTime);

/* -------------------------------------------------------------------- */
/*      the following can be turned on for detailed logging of          */
/*      almost all IO calls.                                            */
/* -------------------------------------------------------------------- */
//C     #ifdef VSI_DEBUG

//C     #ifndef DEBUG
//C     #  define DEBUG
//C     #endif

//C     #include "cpl_error.h"

//C     #define VSIDebug4(f,a1,a2,a3,a4)   CPLDebug( "VSI", f, a1, a2, a3, a4 );
//C     #define VSIDebug3( f, a1, a2, a3 ) CPLDebug( "VSI", f, a1, a2, a3 );
//C     #define VSIDebug2( f, a1, a2 )     CPLDebug( "VSI", f, a1, a2 );
//C     #define VSIDebug1( f, a1 )         CPLDebug( "VSI", f, a1 );
//C     #else
//C     #define VSIDebug4( f, a1, a2, a3, a4 ) {}
//C     #define VSIDebug3( f, a1, a2, a3 ) {}
//C     #define VSIDebug2( f, a1, a2 )     {}
//C     #define VSIDebug1( f, a1 )         {}
//C     #endif

//C     CPL_C_END

//C     #endif /* ndef CPL_VSI_H_INCLUDED */
