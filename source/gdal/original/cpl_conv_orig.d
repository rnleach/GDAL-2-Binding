/* Converted to D from C:/devLibs/gdal21/include/cpl_conv.h by htod */
module ./cpl_conv;
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

//C     #ifndef CPL_CONV_H_INCLUDED
//C     #define CPL_CONV_H_INCLUDED

//C     #include "cpl_port.h"
import cpl_port;
//C     #include "cpl_vsi.h"
import cpl_vsi;
//C     #include "cpl_error.h"
import cpl_error;

/**
 * \file cpl_conv.h
 *
 * Various convenience functions for CPL.
 *
 */

/* -------------------------------------------------------------------- */
/*      Runtime check of various configuration items.                   */
/* -------------------------------------------------------------------- */
//C     CPL_C_START

//C     void CPL_DLL CPLVerifyConfiguration(void);
extern (C):
void  CPLVerifyConfiguration();

//C     const char CPL_DLL * CPL_STDCALL
//C     CPLGetConfigOption( const char *, const char * ) CPL_WARN_UNUSED_RESULT;
extern (Windows):
char * CPLGetConfigOption(char *, char *);
//C     const char CPL_DLL * CPL_STDCALL
//C     CPLGetThreadLocalConfigOption( const char *, const char * ) CPL_WARN_UNUSED_RESULT;
char * CPLGetThreadLocalConfigOption(char *, char *);
//C     void CPL_DLL CPL_STDCALL CPLSetConfigOption( const char *, const char * );
void  CPLSetConfigOption(char *, char *);
//C     void CPL_DLL CPL_STDCALL CPLSetThreadLocalConfigOption( const char *pszKey,
//C                                                             const char *pszValue );
void  CPLSetThreadLocalConfigOption(char *pszKey, char *pszValue);
//C     void CPL_DLL CPL_STDCALL CPLFreeConfig(void);
void  CPLFreeConfig();

/* -------------------------------------------------------------------- */
/*      Safe malloc() API.  Thin cover over VSI functions with fatal    */
/*      error reporting if memory allocation fails.                     */
/* -------------------------------------------------------------------- */
//C     void CPL_DLL *CPLMalloc( size_t ) CPL_WARN_UNUSED_RESULT;
extern (C):
void * CPLMalloc(size_t );
//C     void CPL_DLL *CPLCalloc( size_t, size_t ) CPL_WARN_UNUSED_RESULT;
void * CPLCalloc(size_t , size_t );
//C     void CPL_DLL *CPLRealloc( void *, size_t ) CPL_WARN_UNUSED_RESULT;
void * CPLRealloc(void *, size_t );
//C     char CPL_DLL *CPLStrdup( const char * ) CPL_WARN_UNUSED_RESULT CPL_RETURNS_NONNULL;
char * CPLStrdup(char *);
//C     char CPL_DLL *CPLStrlwr( char *);
char * CPLStrlwr(char *);

//C     #define CPLFree VSIFree

alias VSIFree CPLFree;
/* -------------------------------------------------------------------- */
/*      Read a line from a text file, and strip of CR/LF.               */
/* -------------------------------------------------------------------- */
//C     char CPL_DLL *CPLFGets( char *, int, FILE *);
char * CPLFGets(char *, int , FILE *);
//C     const char CPL_DLL *CPLReadLine( FILE * );
char * CPLReadLine(FILE *);
//C     const char CPL_DLL *CPLReadLineL( VSILFILE * );
char * CPLReadLineL(VSILFILE *);
//C     const char CPL_DLL *CPLReadLine2L( VSILFILE * , int nMaxCols, char** papszOptions);
char * CPLReadLine2L(VSILFILE *, int nMaxCols, char **papszOptions);

/* -------------------------------------------------------------------- */
/*      Convert ASCII string to floating point number                  */
/*      (THESE FUNCTIONS ARE NOT LOCALE AWARE!).                        */
/* -------------------------------------------------------------------- */
//C     double CPL_DLL CPLAtof(const char *);
double  CPLAtof(char *);
//C     double CPL_DLL CPLAtofDelim(const char *, char);
double  CPLAtofDelim(char *, char );
//C     double CPL_DLL CPLStrtod(const char *, char **);
double  CPLStrtod(char *, char **);
//C     double CPL_DLL CPLStrtodDelim(const char *, char **, char);
double  CPLStrtodDelim(char *, char **, char );
//C     float CPL_DLL CPLStrtof(const char *, char **);
float  CPLStrtof(char *, char **);
//C     float CPL_DLL CPLStrtofDelim(const char *, char **, char);
float  CPLStrtofDelim(char *, char **, char );

/* -------------------------------------------------------------------- */
/*      Convert number to string.  This function is locale agnostic     */
/*      (i.e. it will support "," or "." regardless of current locale)  */
/* -------------------------------------------------------------------- */
//C     double CPL_DLL CPLAtofM(const char *);
double  CPLAtofM(char *);

/* -------------------------------------------------------------------- */
/*      Read a numeric value from an ASCII character string.            */
/* -------------------------------------------------------------------- */
//C     char CPL_DLL *CPLScanString( const char *, int, int, int );
char * CPLScanString(char *, int , int , int );
//C     double CPL_DLL CPLScanDouble( const char *, int );
double  CPLScanDouble(char *, int );
//C     long CPL_DLL CPLScanLong( const char *, int );
int  CPLScanLong(char *, int );
//C     unsigned long CPL_DLL CPLScanULong( const char *, int );
uint  CPLScanULong(char *, int );
//C     GUIntBig CPL_DLL CPLScanUIntBig( const char *, int );
GUIntBig  CPLScanUIntBig(char *, int );
//C     GIntBig CPL_DLL CPLAtoGIntBig( const char* pszString );
GIntBig  CPLAtoGIntBig(char *pszString);
//C     GIntBig CPL_DLL CPLAtoGIntBigEx( const char* pszString, int bWarn, int *pbOverflow );
GIntBig  CPLAtoGIntBigEx(char *pszString, int bWarn, int *pbOverflow);
//C     void CPL_DLL *CPLScanPointer( const char *, int );
void * CPLScanPointer(char *, int );

/* -------------------------------------------------------------------- */
/*      Print a value to an ASCII character string.                     */
/* -------------------------------------------------------------------- */
//C     int CPL_DLL CPLPrintString( char *, const char *, int );
int  CPLPrintString(char *, char *, int );
//C     int CPL_DLL CPLPrintStringFill( char *, const char *, int );
int  CPLPrintStringFill(char *, char *, int );
//C     int CPL_DLL CPLPrintInt32( char *, GInt32 , int );
int  CPLPrintInt32(char *, GInt32 , int );
//C     int CPL_DLL CPLPrintUIntBig( char *, GUIntBig , int );
int  CPLPrintUIntBig(char *, GUIntBig , int );
//C     int CPL_DLL CPLPrintDouble( char *, const char *, double, const char * );
int  CPLPrintDouble(char *, char *, double , char *);
//C     int CPL_DLL CPLPrintTime( char *, int , const char *, const struct tm *,
//C                               const char * );
int  CPLPrintTime(char *, int , char *, tm *, char *);
//C     int CPL_DLL CPLPrintPointer( char *, void *, int );
int  CPLPrintPointer(char *, void *, int );

/* -------------------------------------------------------------------- */
/*      Fetch a function from DLL / so.                                 */
/* -------------------------------------------------------------------- */

//C     void CPL_DLL *CPLGetSymbol( const char *, const char * );
void * CPLGetSymbol(char *, char *);

/* -------------------------------------------------------------------- */
/*      Fetch executable path.                                          */
/* -------------------------------------------------------------------- */
//C     int CPL_DLL CPLGetExecPath( char *pszPathBuf, int nMaxLength );
int  CPLGetExecPath(char *pszPathBuf, int nMaxLength);

/* -------------------------------------------------------------------- */
/*      Filename handling functions.                                    */
/* -------------------------------------------------------------------- */
//C     const char CPL_DLL *CPLGetPath( const char * ) CPL_WARN_UNUSED_RESULT CPL_RETURNS_NONNULL;
char * CPLGetPath(char *);
//C     const char CPL_DLL *CPLGetDirname( const char * ) CPL_WARN_UNUSED_RESULT CPL_RETURNS_NONNULL;
char * CPLGetDirname(char *);
//C     const char CPL_DLL *CPLGetFilename( const char * ) CPL_WARN_UNUSED_RESULT CPL_RETURNS_NONNULL;
char * CPLGetFilename(char *);
//C     const char CPL_DLL *CPLGetBasename( const char * ) CPL_WARN_UNUSED_RESULT CPL_RETURNS_NONNULL;
char * CPLGetBasename(char *);
//C     const char CPL_DLL *CPLGetExtension( const char * ) CPL_WARN_UNUSED_RESULT CPL_RETURNS_NONNULL;
char * CPLGetExtension(char *);
//C     char       CPL_DLL *CPLGetCurrentDir(void);
char * CPLGetCurrentDir();
//C     const char CPL_DLL *CPLFormFilename( const char *pszPath,
//C                                          const char *pszBasename,
//C                                          const char *pszExtension ) CPL_WARN_UNUSED_RESULT CPL_RETURNS_NONNULL;
char * CPLFormFilename(char *pszPath, char *pszBasename, char *pszExtension);
//C     const char CPL_DLL *CPLFormCIFilename( const char *pszPath,
//C                                            const char *pszBasename,
//C                                            const char *pszExtension ) CPL_WARN_UNUSED_RESULT CPL_RETURNS_NONNULL;
char * CPLFormCIFilename(char *pszPath, char *pszBasename, char *pszExtension);
//C     const char CPL_DLL *CPLResetExtension( const char *, const char * ) CPL_WARN_UNUSED_RESULT CPL_RETURNS_NONNULL;
char * CPLResetExtension(char *, char *);
//C     const char CPL_DLL *CPLProjectRelativeFilename( const char *pszProjectDir,
//C                                                 const char *pszSecondaryFilename ) CPL_WARN_UNUSED_RESULT CPL_RETURNS_NONNULL;
char * CPLProjectRelativeFilename(char *pszProjectDir, char *pszSecondaryFilename);
//C     int CPL_DLL CPLIsFilenameRelative( const char *pszFilename );
int  CPLIsFilenameRelative(char *pszFilename);
//C     const char CPL_DLL *CPLExtractRelativePath(const char *, const char *, int *) CPL_WARN_UNUSED_RESULT CPL_RETURNS_NONNULL;
char * CPLExtractRelativePath(char *, char *, int *);
//C     const char CPL_DLL *CPLCleanTrailingSlash( const char * ) CPL_WARN_UNUSED_RESULT CPL_RETURNS_NONNULL;
char * CPLCleanTrailingSlash(char *);
//C     char CPL_DLL      **CPLCorrespondingPaths( const char *pszOldFilename,
//C                                                const char *pszNewFilename,
//C                                                char **papszFileList ) CPL_WARN_UNUSED_RESULT;
char ** CPLCorrespondingPaths(char *pszOldFilename, char *pszNewFilename, char **papszFileList);
//C     int CPL_DLL CPLCheckForFile( char *pszFilename, char **papszSiblingList );
int  CPLCheckForFile(char *pszFilename, char **papszSiblingList);

//C     const char CPL_DLL *CPLGenerateTempFilename( const char *pszStem ) CPL_WARN_UNUSED_RESULT CPL_RETURNS_NONNULL;
char * CPLGenerateTempFilename(char *pszStem);

/* -------------------------------------------------------------------- */
/*      Find File Function                                              */
/* -------------------------------------------------------------------- */
//C     typedef const char *(*CPLFileFinder)(const char *, const char *);
alias char * function(char *, char *)CPLFileFinder;

//C     const char    CPL_DLL *CPLFindFile(const char *pszClass,
//C                                        const char *pszBasename);
char * CPLFindFile(char *pszClass, char *pszBasename);
//C     const char    CPL_DLL *CPLDefaultFindFile(const char *pszClass,
//C                                               const char *pszBasename);
char * CPLDefaultFindFile(char *pszClass, char *pszBasename);
//C     void          CPL_DLL CPLPushFileFinder( CPLFileFinder pfnFinder );
void  CPLPushFileFinder(CPLFileFinder pfnFinder);
//C     CPLFileFinder CPL_DLL CPLPopFileFinder(void);
CPLFileFinder  CPLPopFileFinder();
//C     void          CPL_DLL CPLPushFinderLocation( const char * );
void  CPLPushFinderLocation(char *);
//C     void          CPL_DLL CPLPopFinderLocation(void);
void  CPLPopFinderLocation();
//C     void          CPL_DLL CPLFinderClean(void);
void  CPLFinderClean();

/* -------------------------------------------------------------------- */
/*      Safe version of stat() that works properly on stuff like "C:".  */
/* -------------------------------------------------------------------- */
//C     int CPL_DLL     CPLStat( const char *, VSIStatBuf * ) CPL_WARN_UNUSED_RESULT;
int  CPLStat(char *, VSIStatBuf *);

/* -------------------------------------------------------------------- */
/*      Reference counted file handle manager.  Makes sharing file      */
/*      handles more practical.                                         */
/* -------------------------------------------------------------------- */
//C     typedef struct {
//C         FILE *fp;
//C         int   nRefCount;
//C         int   bLarge;
//C         char  *pszFilename;
//C         char  *pszAccess;
//C     } CPLSharedFileInfo;
struct _N2
{
    FILE *fp;
    int nRefCount;
    int bLarge;
    char *pszFilename;
    char *pszAccess;
}
alias _N2 CPLSharedFileInfo;

//C     FILE CPL_DLL    *CPLOpenShared( const char *, const char *, int );
FILE * CPLOpenShared(char *, char *, int );
//C     void CPL_DLL     CPLCloseShared( FILE * );
void  CPLCloseShared(FILE *);
//C     CPLSharedFileInfo CPL_DLL *CPLGetSharedList( int * );
CPLSharedFileInfo * CPLGetSharedList(int *);
//C     void CPL_DLL     CPLDumpSharedList( FILE * );
void  CPLDumpSharedList(FILE *);
//C     void CPL_DLL     CPLCleanupSharedFileMutex( void );
void  CPLCleanupSharedFileMutex();

/* -------------------------------------------------------------------- */
/*      DMS to Dec to DMS conversion.                                   */
/* -------------------------------------------------------------------- */
//C     double CPL_DLL CPLDMSToDec( const char *is );
double  CPLDMSToDec(char *is);
//C     const char CPL_DLL *CPLDecToDMS( double dfAngle, const char * pszAxis,
//C                                      int nPrecision );
char * CPLDecToDMS(double dfAngle, char *pszAxis, int nPrecision);
//C     double CPL_DLL CPLPackedDMSToDec( double );
double  CPLPackedDMSToDec(double );
//C     double CPL_DLL CPLDecToPackedDMS( double dfDec );
double  CPLDecToPackedDMS(double dfDec);

//C     void CPL_DLL CPLStringToComplex( const char *pszString,
//C                                      double *pdfReal, double *pdfImag );
void  CPLStringToComplex(char *pszString, double *pdfReal, double *pdfImag);

/* -------------------------------------------------------------------- */
/*      Misc other functions.                                           */
/* -------------------------------------------------------------------- */
//C     int CPL_DLL CPLUnlinkTree( const char * );
int  CPLUnlinkTree(char *);
//C     int CPL_DLL CPLCopyFile( const char *pszNewPath, const char *pszOldPath );
int  CPLCopyFile(char *pszNewPath, char *pszOldPath);
//C     int CPL_DLL CPLCopyTree( const char *pszNewPath, const char *pszOldPath );
int  CPLCopyTree(char *pszNewPath, char *pszOldPath);
//C     int CPL_DLL CPLMoveFile( const char *pszNewPath, const char *pszOldPath );
int  CPLMoveFile(char *pszNewPath, char *pszOldPath);
//C     int CPL_DLL CPLSymlink( const char* pszOldPath, const char* pszNewPath, char** papszOptions );
int  CPLSymlink(char *pszOldPath, char *pszNewPath, char **papszOptions);

/* -------------------------------------------------------------------- */
/*      ZIP Creation.                                                   */
/* -------------------------------------------------------------------- */
//C     #define CPL_ZIP_API_OFFERED
//C     void CPL_DLL  *CPLCreateZip( const char *pszZipFilename, char **papszOptions );
void * CPLCreateZip(char *pszZipFilename, char **papszOptions);
//C     CPLErr CPL_DLL CPLCreateFileInZip( void *hZip, const char *pszFilename,
//C                                        char **papszOptions );
CPLErr  CPLCreateFileInZip(void *hZip, char *pszFilename, char **papszOptions);
//C     CPLErr CPL_DLL CPLWriteFileInZip( void *hZip, const void *pBuffer, int nBufferSize );
CPLErr  CPLWriteFileInZip(void *hZip, void *pBuffer, int nBufferSize);
//C     CPLErr CPL_DLL CPLCloseFileInZip( void *hZip );
CPLErr  CPLCloseFileInZip(void *hZip);
//C     CPLErr CPL_DLL CPLCloseZip( void *hZip );
CPLErr  CPLCloseZip(void *hZip);

/* -------------------------------------------------------------------- */
/*      ZLib compression                                                */
/* -------------------------------------------------------------------- */

//C     void CPL_DLL *CPLZLibDeflate( const void* ptr, size_t nBytes, int nLevel,
//C                                   void* outptr, size_t nOutAvailableBytes,
//C                                   size_t* pnOutBytes );
void * CPLZLibDeflate(void *ptr, size_t nBytes, int nLevel, void *outptr, size_t nOutAvailableBytes, size_t *pnOutBytes);
//C     void CPL_DLL *CPLZLibInflate( const void* ptr, size_t nBytes,
//C                                   void* outptr, size_t nOutAvailableBytes,
//C                                   size_t* pnOutBytes );
void * CPLZLibInflate(void *ptr, size_t nBytes, void *outptr, size_t nOutAvailableBytes, size_t *pnOutBytes);

/* -------------------------------------------------------------------- */
/*      XML validation.                                                 */
/* -------------------------------------------------------------------- */
//C     int CPL_DLL CPLValidateXML(const char* pszXMLFilename,
//C                                const char* pszXSDFilename,
//C                                char** papszOptions);
int  CPLValidateXML(char *pszXMLFilename, char *pszXSDFilename, char **papszOptions);

/* -------------------------------------------------------------------- */
/*      Locale handling. Prevents parallel executions of setlocale().   */
/* -------------------------------------------------------------------- */
//C     char* CPLsetlocale (int category, const char* locale);
char * CPLsetlocale(int category, char *locale);
//C     void CPLCleanupSetlocaleMutex(void);
void  CPLCleanupSetlocaleMutex();

//C     CPL_C_END

/* -------------------------------------------------------------------- */
/*      C++ object for temporarily forcing a LC_NUMERIC locale to "C".  */
/* -------------------------------------------------------------------- */

//C     #if defined(__cplusplus) && !defined(CPL_SUPRESS_CPLUSPLUS)

//C     class CPL_DLL CPLLocaleC
//C     {
//C     public:
//C         CPLLocaleC();
//C         ~CPLLocaleC();

//C     private:
//C         char *pszOldLocale;

    /* Make it non-copyable */
//C         CPLLocaleC(const CPLLocaleC&);
//C         CPLLocaleC& operator=(const CPLLocaleC&);
//C     };

// Does the same as CPLLocaleC except that, when available, it tries to
// only affect the current thread. But code that would be dependent of
// setlocale(LC_NUMERIC, NULL) returning "C", such as current proj.4 versions,
// will not work depending on the actual implementation
//C     class CPL_DLL CPLThreadLocaleC
//C     {
//C     public:
//C         CPLThreadLocaleC();
//C         ~CPLThreadLocaleC();

//C     private:
//C     #ifdef HAVE_USELOCALE
//C         locale_t nNewLocale;
//C         locale_t nOldLocale;
//C     #else
//C     #if defined(_MSC_VER)
//C         int   nOldValConfigThreadLocale;
//C     #endif
//C         char *pszOldLocale;
//C     #endif

    /* Make it non-copyable */
//C         CPLThreadLocaleC(const CPLThreadLocaleC&);
//C         CPLThreadLocaleC& operator=(const CPLThreadLocaleC&);
//C     };

//C     #endif /* def __cplusplus */


//C     #endif /* ndef CPL_CONV_H_INCLUDED */
