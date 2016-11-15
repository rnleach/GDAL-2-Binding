/* Converted to D from C:/devLibs/gdal21/include/cpl_port.h by htod */
module ./cplport;
/******************************************************************************
 * $Id: cpl_port.h 33907 2016-04-07 00:37:06Z goatbar $
 *
 * Project:  CPL - Common Portability Library
 * Author:   Frank Warmerdam, warmerdam@pobox.com
 * Purpose:  Include file providing low level portability services for CPL.
 *           This should be the first include file for any CPL based code.
 *
 ******************************************************************************
 * Copyright (c) 1998, 2005, Frank Warmerdam <warmerdam@pobox.com>
 * Copyright (c) 2008-2013, Even Rouault <even dot rouault at mines-paris dot org>
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

//C     #ifndef CPL_BASE_H_INCLUDED
//C     #define CPL_BASE_H_INCLUDED

/**
 * \file cpl_port.h
 *
 * Core portability definitions for CPL.
 *
 */

/* ==================================================================== */
/*      We will use WIN32 as a standard windows define.                 */
/* ==================================================================== */
//C     #if defined(_WIN32) && !defined(WIN32)
//C     #  define WIN32
//C     #endif

//C     #if defined(_WINDOWS) && !defined(WIN32)
//C     #  define WIN32
//C     #endif

/* -------------------------------------------------------------------- */
/*      The following apparently allow you to use strcpy() and other    */
/*      functions judged "unsafe" by microsoft in VS 8 (2005).          */
/* -------------------------------------------------------------------- */
//C     #ifdef _MSC_VER
//C     #  ifndef _CRT_SECURE_NO_DEPRECATE
//C     #    define _CRT_SECURE_NO_DEPRECATE
//C     #  endif
//C     #  ifndef _CRT_NONSTDC_NO_DEPRECATE
//C     #    define _CRT_NONSTDC_NO_DEPRECATE
//C     #  endif
//C     #endif

//C     #include "cpl_config.h"
import cpl_config;

/* ==================================================================== */
/*      A few sanity checks, mainly to detect problems that sometimes   */
/*      arise with bad configured cross-compilation.                    */
/* ==================================================================== */

//C     #if !defined(SIZEOF_INT) || SIZEOF_INT != 4
//C     #error "Unexpected value for SIZEOF_INT"
//C     #endif

//C     #if !defined(SIZEOF_UNSIGNED_LONG) || (SIZEOF_UNSIGNED_LONG != 4 && SIZEOF_UNSIGNED_LONG != 8)
//C     #error "Unexpected value for SIZEOF_UNSIGNED_LONG"
//C     #endif

//C     #if !defined(SIZEOF_VOIDP) || (SIZEOF_VOIDP != 4 && SIZEOF_VOIDP != 8)
//C     #error "Unexpected value for SIZEOF_VOIDP"
//C     #endif


/* ==================================================================== */
/*      This will disable most WIN32 stuff in a Cygnus build which      */
/*      defines unix to 1.                                              */
/* ==================================================================== */

//C     #ifdef unix
//C     #  undef WIN32
//C     #endif

//C     #if defined(VSI_NEED_LARGEFILE64_SOURCE) && !defined(_LARGEFILE64_SOURCE)
//C     #  define _LARGEFILE64_SOURCE 1
//C     #endif

/* ==================================================================== */
/*      If iconv() is available use extended recoding module.           */
/*      Stub implementation is always compiled in, because it works     */
/*      faster than iconv() for encodings it supports.                  */
/* ==================================================================== */

//C     #if defined(HAVE_ICONV)
//C     #  define CPL_RECODE_ICONV
//C     #endif

//C     #define CPL_RECODE_STUB

/* ==================================================================== */
/*      MinGW stuff                                                     */
/* ==================================================================== */

/* We need __MSVCRT_VERSION__ >= 0x0601 to have "struct __stat64" */
/* Latest versions of mingw32 define it, but with older ones, */
/* we need to define it manually */
//C     #if defined(__MINGW32__)
//C     #ifndef __MSVCRT_VERSION__
//C     #define __MSVCRT_VERSION__ 0x0601
//C     #endif
//C     #endif

/* ==================================================================== */
/*      Standard include files.                                         */
/* ==================================================================== */

//C     #include <stdio.h>
import std.c.stdio;
//C     #include <stdlib.h>
import std.c.stdlib;
//C     #include <math.h>
import std.c.math;
//C     #include <stdarg.h>
import std.c.stdarg;
//C     #include <string.h>
import std.c.string;
//C     #include <ctype.h>
import std.c.ctype;
//C     #include <limits.h>
import std.c.limits;

//C     #include <time.h>
import std.c.time;

//C     #if defined(HAVE_ERRNO_H)
//C     #  include <errno.h>
import std.c.errno;
//C     #endif

//C     #ifdef HAVE_LOCALE_H
//C     #  include <locale.h>
import std.c.locale;
//C     #endif

//C     #ifdef HAVE_DIRECT_H
//C     #  include <direct.h>
import std.c.direct;
//C     #endif

//C     #if !defined(WIN32)
//C     #  include <strings.h>
//C     #endif

//C     #if defined(HAVE_LIBDBMALLOC) && defined(HAVE_DBMALLOC_H) && defined(DEBUG)
//C     #  define DBMALLOC
//C     #  include <dbmalloc.h>
//C     #endif

//C     #if !defined(DBMALLOC) && defined(HAVE_DMALLOC_H)
//C     #  define USE_DMALLOC
//C     #  include <dmalloc.h>
//C     #endif

/* ==================================================================== */
/*      Base portability stuff ... this stuff may need to be            */
/*      modified for new platforms.                                     */
/* ==================================================================== */

/* -------------------------------------------------------------------- */
/*      Which versions of C++ are available.                            */
/* -------------------------------------------------------------------- */

//C     #ifdef __cplusplus
//C     #  if __cplusplus >= 201103L
//C     #    define HAVE_CXX11 1
//C     #  endif
/* TODO(schwehr): What are the correct tests for C++ 14 and 17? */
//C     #endif  /* __cpluscplus */

/*---------------------------------------------------------------------
 *        types for 16 and 32 bits integers, etc...
 *--------------------------------------------------------------------*/
//C     #if UINT_MAX == 65535
//C     typedef long            GInt32;
//C     typedef unsigned long   GUInt32;
//C     #else
//C     typedef int             GInt32;
extern (C):
alias int GInt32;
//C     typedef unsigned int    GUInt32;
alias uint GUInt32;
//C     #endif

//C     typedef short           GInt16;
alias short GInt16;
//C     typedef unsigned short  GUInt16;
alias ushort GUInt16;
//C     typedef unsigned char   GByte;
alias ubyte GByte;
/* hack for PDF driver and poppler >= 0.15.0 that defines incompatible "typedef bool GBool" */
/* in include/poppler/goo/gtypes.h */
//C     #ifndef CPL_GBOOL_DEFINED
//C     #define CPL_GBOOL_DEFINED
//C     typedef int             GBool;
alias int GBool;
//C     #endif

/* -------------------------------------------------------------------- */
/*      64bit support                                                   */
/* -------------------------------------------------------------------- */

//C     #if defined(WIN32) && defined(_MSC_VER)

//C     #define VSI_LARGE_API_SUPPORTED
//C     typedef __int64          GIntBig;
//C     typedef unsigned __int64 GUIntBig;

//C     #define GINTBIG_MIN     ((GIntBig)(0x80000000) << 32)
//C     #define GINTBIG_MAX     (((GIntBig)(0x7FFFFFFF) << 32) | 0xFFFFFFFFU)
//C     #define GUINTBIG_MAX     (((GUIntBig)(0xFFFFFFFFU) << 32) | 0xFFFFFFFFU)

//C     #elif HAVE_LONG_LONG

//C     typedef long long        GIntBig;
//C     typedef unsigned long long GUIntBig;

//C     #define GINTBIG_MIN     ((GIntBig)(0x80000000) << 32)
//C     #define GINTBIG_MAX     (((GIntBig)(0x7FFFFFFF) << 32) | 0xFFFFFFFFU)
//C     #define GUINTBIG_MAX     (((GUIntBig)(0xFFFFFFFFU) << 32) | 0xFFFFFFFFU)

//C     #else

//C     typedef long             GIntBig;
alias int GIntBig;
//C     typedef unsigned long    GUIntBig;
alias uint GUIntBig;

//C     #define GINTBIG_MIN     INT_MIN
//C     #define GINTBIG_MAX     INT_MAX
alias INT_MIN GINTBIG_MIN;
//C     #define GUINTBIG_MAX     UINT_MAX
alias INT_MAX GINTBIG_MAX;
//C     #endif
alias UINT_MAX GUINTBIG_MAX;

//C     #if SIZEOF_VOIDP == 8
//C     typedef GIntBig          GPtrDiff_t;
//C     #else
//C     typedef int              GPtrDiff_t;
alias int GPtrDiff_t;
//C     #endif

//C     #if defined(__MSVCRT__) || (defined(WIN32) && defined(_MSC_VER))
//C       #define CPL_FRMT_GB_WITHOUT_PREFIX     "I64"
//C     #elif HAVE_LONG_LONG
//C       #define CPL_FRMT_GB_WITHOUT_PREFIX     "ll"
//C     #else
//C       #define CPL_FRMT_GB_WITHOUT_PREFIX     "l"
//C     #endif

//C     #define CPL_FRMT_GIB     "%" CPL_FRMT_GB_WITHOUT_PREFIX "d"
//C     #define CPL_FRMT_GUIB    "%" CPL_FRMT_GB_WITHOUT_PREFIX "u"

/* Workaround VC6 bug */
//C     #if defined(_MSC_VER) && (_MSC_VER <= 1200)
//C     #define GUINTBIG_TO_DOUBLE(x) (double)(GIntBig)(x)
//C     #else
//C     #define GUINTBIG_TO_DOUBLE(x) (double)(x)
//C     #endif

//C     #ifdef COMPAT_WITH_ICC_CONVERSION_CHECK
//C     #define CPL_INT64_FITS_ON_INT32(x) ((x) >= INT_MIN && (x) <= INT_MAX)
//C     #else
//C     #define CPL_INT64_FITS_ON_INT32(x) (((GIntBig)(int)(x)) == (x))
//C     #endif

/* ==================================================================== */
/*      Other standard services.                                        */
/* ==================================================================== */
//C     #ifdef __cplusplus
//C     #  define CPL_C_START           extern "C" {
//C     #  define CPL_C_END             }
//C     #else
//C     #  define CPL_C_START
//C     #  define CPL_C_END
//C     #endif

//C     #ifndef CPL_DLL
//C     #if defined(_MSC_VER) && !defined(CPL_DISABLE_DLL)
//C     #  define CPL_DLL     __declspec(dllexport)
//C     #else
//C     #  if defined(USE_GCC_VISIBILITY_FLAG)
//C     #    define CPL_DLL     __attribute__ ((visibility("default")))
//C     #  else
//C     #    define CPL_DLL
//C     #  endif
//C     #endif
//C     #endif

/* Should optional (normally private) interfaces be exported? */
//C     #ifdef CPL_OPTIONAL_APIS
//C     #  define CPL_ODLL CPL_DLL
//C     #else
//C     #  define CPL_ODLL
//C     #endif

//C     #ifndef CPL_STDCALL
//C     #if defined(_MSC_VER) && !defined(CPL_DISABLE_STDCALL)
//C     #  define CPL_STDCALL     __stdcall
//C     #else
//C     #  define CPL_STDCALL
//C     #endif
//C     #endif

//C     #ifdef _MSC_VER
//C     #  define FORCE_CDECL  __cdecl
//C     #else
//C     #  define FORCE_CDECL
//C     #endif

/* TODO : support for other compilers needed */
//C     #if (defined(__GNUC__) && !defined(__NO_INLINE__)) || defined(_MSC_VER)
//C     #define HAS_CPL_INLINE  1
//C     #define CPL_INLINE __inline
//C     #elif defined(__SUNPRO_CC)
//C     #define HAS_CPL_INLINE  1
//C     #define CPL_INLINE inline
//C     #else
//C     #define CPL_INLINE
//C     #endif

// Define NULL_AS_NULLPTR together with -std=c++11 -Wzero-as-null-pointer-constant with GCC
// to detect misuses of NULL
//C     #if defined(NULL_AS_NULLPTR) && HAVE_CXX11

//C     #ifdef __GNUC__
// We need to include all that bunch of system headers, otherwise
// as they include <stddef.h> with __need_NULL, this overrides our #define NULL nullptr
// with #define NULL __null
//C     #include <locale.h>
//C     #include <unistd.h>
//C     #include <sys/types.h>
//C     #ifdef HAVE_ICONV
//C     #include <iconv.h>
//C     #endif
//C     #ifdef HAVE_MMAP
//C     #include <sys/mman.h>
//C     #endif
//C     #include <signal.h>
//C     #ifndef _WIN32
//C     #include <dlfcn.h>
//C     #include <netdb.h>
//C     #include <fcntl.h>
//C     #endif

//C     extern "C++" {
//C     #include <string>
//C     #include <cstdio>
//C     #include <cstdlib>
//C     #include <cstring>
//C     #include <cstddef>
//C     #include <ostream>
//C     #include <iostream>
//C     #include <sstream>
//C     }
//C     #endif /* __GNUC__ */

//C     #undef NULL
//C     #define NULL nullptr
//C     #else /* defined(NULL_AS_NULLPTR) && HAVE_CXX11 */
//C     #ifndef NULL
//C     #  define NULL  0
//C     #endif
//C     #endif /* defined(NULL_AS_NULLPTR) && HAVE_CXX11 */


//C     #ifndef MAX
//C     #  define MIN(a,b)      ((a<b) ? a : b)
//C     #  define MAX(a,b)      ((a>b) ? a : b)
//C     #endif

//C     #ifndef ABS
//C     #  define ABS(x)        ((x<0) ? (-1*(x)) : x)
//C     #endif

//C     #ifndef M_PI
//C     # define M_PI		3.14159265358979323846
/* 3.1415926535897932384626433832795 */
//C     #endif

/* -------------------------------------------------------------------- */
/*      Macro to test equality of two floating point values.            */
/*      We use fabs() function instead of ABS() macro to avoid side     */
/*      effects.                                                        */
/* -------------------------------------------------------------------- */
//C     #ifndef CPLIsEqual
//C     #  define CPLIsEqual(x,y) (fabs((x) - (y)) < 0.0000000000001)
//C     #endif

/* -------------------------------------------------------------------- */
/*      Provide macros for case insensitive string comparisons.         */
/* -------------------------------------------------------------------- */
//C     #ifndef EQUAL

//C     #if defined(AFL_FRIENDLY) && defined(__GNUC__)

//C     static inline int CPL_afl_friendly_memcmp(const void* ptr1, const void* ptr2, size_t len)
//C             __attribute__((always_inline));

//C     static inline int CPL_afl_friendly_memcmp(const void* ptr1, const void* ptr2, size_t len)
//C     {
//C         const unsigned char* bptr1 = (const unsigned char*)ptr1;
//C         const unsigned char* bptr2 = (const unsigned char*)ptr2;
//C         while( len-- )
//C         {
//C             unsigned char b1 = *(bptr1++);
//C             unsigned char b2 = *(bptr2++);
//C             if( b1 != b2 ) return b1 - b2;
//C         }
//C         return 0;
//C     }

//C     static inline int CPL_afl_friendly_strcmp(const char* ptr1, const char* ptr2)
//C             __attribute__((always_inline));

//C     static inline int CPL_afl_friendly_strcmp(const char* ptr1, const char* ptr2)
//C     {
//C         const unsigned char* usptr1 = (const unsigned char*)ptr1;
//C         const unsigned char* usptr2 = (const unsigned char*)ptr2;
//C         while( 1 )
//C         {
//C             unsigned char ch1 = *(usptr1++);
//C             unsigned char ch2 = *(usptr2++);
//C             if( ch1 == 0 || ch1 != ch2 ) return ch1 - ch2;
//C         }
//C     }

//C     static inline int CPL_afl_friendly_strncmp(const char* ptr1, const char* ptr2, size_t len)
//C             __attribute__((always_inline));

//C     static inline int CPL_afl_friendly_strncmp(const char* ptr1, const char* ptr2, size_t len)
//C     {
//C         const unsigned char* usptr1 = (const unsigned char*)ptr1;
//C         const unsigned char* usptr2 = (const unsigned char*)ptr2;
//C         while( len -- )
//C         {
//C             unsigned char ch1 = *(usptr1++);
//C             unsigned char ch2 = *(usptr2++);
//C             if( ch1 == 0 || ch1 != ch2 ) return ch1 - ch2;
//C         }
//C         return 0;
//C     }

//C     static inline int CPL_afl_friendly_strcasecmp(const char* ptr1, const char* ptr2)
//C             __attribute__((always_inline));

//C     static inline int CPL_afl_friendly_strcasecmp(const char* ptr1, const char* ptr2)
//C     {
//C         const unsigned char* usptr1 = (const unsigned char*)ptr1;
//C         const unsigned char* usptr2 = (const unsigned char*)ptr2;
//C         while( 1 )
//C         {
//C             unsigned char ch1 = *(usptr1++);
//C             unsigned char ch2 = *(usptr2++);
//C             ch1 = (unsigned char)toupper(ch1);
//C             ch2 = (unsigned char)toupper(ch2);
//C             if( ch1 == 0 || ch1 != ch2 ) return ch1 - ch2;
//C         }
//C     }

//C     static inline int CPL_afl_friendly_strncasecmp(const char* ptr1, const char* ptr2, size_t len)
//C             __attribute__((always_inline));

//C     static inline int CPL_afl_friendly_strncasecmp(const char* ptr1, const char* ptr2, size_t len)
//C     {
//C         const unsigned char* usptr1 = (const unsigned char*)ptr1;
//C         const unsigned char* usptr2 = (const unsigned char*)ptr2;
//C         while( len-- )
//C         {
//C             unsigned char ch1 = *(usptr1++);
//C             unsigned char ch2 = *(usptr2++);
//C             ch1 = (unsigned char)toupper(ch1);
//C             ch2 = (unsigned char)toupper(ch2);
//C             if( ch1 == 0 || ch1 != ch2 ) return ch1 - ch2;
//C         }
//C         return 0;
//C     }

//C     static inline char* CPL_afl_friendly_strstr(const char* haystack, const char* needle)
//C             __attribute__((always_inline));

//C     static inline char* CPL_afl_friendly_strstr(const char* haystack, const char* needle)
//C     {
//C         const char* ptr_haystack = haystack;
//C         while( 1 )
//C         {
//C             const char* ptr_haystack2 = ptr_haystack;
//C             const char* ptr_needle = needle;
//C             while( 1 )
//C             {
//C                 char ch1 = *(ptr_haystack2++);
//C                 char ch2 = *(ptr_needle++);
//C                 if( ch2 == 0 )
//C                     return (char*)ptr_haystack;
//C                 if( ch1 != ch2 )
//C                     break;
//C             }
//C             if( *ptr_haystack == 0 )
//C                 return NULL;
//C             ptr_haystack ++;
//C         }
//C     }

//C     #undef strcmp
//C     #undef strncmp
//C     #define memcmp CPL_afl_friendly_memcmp
//C     #define strcmp CPL_afl_friendly_strcmp
//C     #define strncmp CPL_afl_friendly_strncmp
//C     #define strcasecmp CPL_afl_friendly_strcasecmp
//C     #define strncasecmp CPL_afl_friendly_strncasecmp
//C     #define strstr CPL_afl_friendly_strstr

//C     #endif /* defined(AFL_FRIENDLY) && defined(__GNUC__) */

//C     #  if defined(WIN32)
//C     #    define STRCASECMP(a,b)         (stricmp(a,b))
//C     #    define STRNCASECMP(a,b,n)      (strnicmp(a,b,n))
//C     #  else
//C     #    define STRCASECMP(a,b)         (strcasecmp(a,b))
//C     #    define STRNCASECMP(a,b,n)      (strncasecmp(a,b,n))
//C     #  endif
//C     #  define EQUALN(a,b,n)           (STRNCASECMP(a,b,n)==0)
//C     #  define EQUAL(a,b)              (STRCASECMP(a,b)==0)
//C     #endif

/*---------------------------------------------------------------------
 * Does a string "a" start with string "b".  Search is case-sensitive or,
 * with CI, it is a case-insensitive comparison.
 *--------------------------------------------------------------------- */
//C     #ifndef STARTS_WITH_CI
//C     #define STARTS_WITH(a,b)               (strncmp(a,b,strlen(b)) == 0)
//C     #define STARTS_WITH_CI(a,b)            EQUALN(a,b,strlen(b))
//C     #endif

//C     #ifndef CPL_THREADLOCAL
//C     #  define CPL_THREADLOCAL
//C     #endif

/* -------------------------------------------------------------------- */
/*      Handle isnan() and isinf().  Note that isinf() and isnan()      */
/*      are supposed to be macros according to C99, defined in math.h   */
/*      Some systems (i.e. Tru64) don't have isinf() at all, so if      */
/*      the macro is not defined we just assume nothing is infinite.    */
/*      This may mean we have no real CPLIsInf() on systems with isinf()*/
/*      function but no corresponding macro, but I can live with        */
/*      that since it isn't that important a test.                      */
/* -------------------------------------------------------------------- */
//C     #ifdef _MSC_VER
//C     #  include <float.h>
//C     #  define CPLIsNan(x) _isnan(x)
//C     #  define CPLIsInf(x) (!_isnan(x) && !_finite(x))
//C     #  define CPLIsFinite(x) _finite(x)
//C     #else
//C     #  define CPLIsNan(x) isnan(x)
//C     #  ifdef isinf
//C     #    define CPLIsInf(x) isinf(x)
//C     #    define CPLIsFinite(x) (!isnan(x) && !isinf(x))
//C     #  elif defined(__sun__)
//C     #    include <ieeefp.h>
//C     #    define CPLIsInf(x)    (!finite(x) && !isnan(x))
//C     #    define CPLIsFinite(x) finite(x)
//C     #  else
//C     #    define CPLIsInf(x)    (0)
//C     #    define CPLIsFinite(x) (!isnan(x))
//C     #  endif
//C     #endif

/*---------------------------------------------------------------------
 *                         CPL_LSB and CPL_MSB
 * Only one of these 2 macros should be defined and specifies the byte
 * ordering for the current platform.
 * This should be defined in the Makefile, but if it is not then
 * the default is CPL_LSB (Intel ordering, LSB first).
 *--------------------------------------------------------------------*/
//C     #if defined(WORDS_BIGENDIAN) && !defined(CPL_MSB) && !defined(CPL_LSB)
//C     #  define CPL_MSB
//C     #endif

//C     #if ! ( defined(CPL_LSB) || defined(CPL_MSB) )
//C     #define CPL_LSB
//C     #endif

//C     #if defined(CPL_LSB)
//C     #  define CPL_IS_LSB 1
//C     #else
const CPL_IS_LSB = 1;
//C     #  define CPL_IS_LSB 0
//C     #endif

//C     #ifdef __cplusplus

//C     extern "C++" {

//C     template <bool b> struct CPLStaticAssert {};
//C     template<> struct CPLStaticAssert<true>
//C     {
//C         static void my_function() {}
//C     };

//C     } /* extern "C++" */

//C     #define CPL_STATIC_ASSERT(x) CPLStaticAssert<x>::my_function()
//C     #define CPL_STATIC_ASSERT_IF_AVAILABLE(x) CPL_STATIC_ASSERT(x)

//C     #else  /* __cplusplus */

//C     #define CPL_STATIC_ASSERT_IF_AVAILABLE(x)

//C     #endif  /* __cplusplus */

/*---------------------------------------------------------------------
 *        Little endian <==> big endian byte swap macros.
 *--------------------------------------------------------------------*/

//C     #define CPL_SWAP16(x)         ((GUInt16)(             (((GUInt16)(x) & 0x00ffU) << 8) |             (((GUInt16)(x) & 0xff00U) >> 8) ))

//C     #define CPL_SWAP16PTR(x) {                                                                     GByte       byTemp, *_pabyDataT = (GByte *) (x);                  CPL_STATIC_ASSERT_IF_AVAILABLE(sizeof(*(x)) == 1 || sizeof(*(x)) == 2);                                                                       byTemp = _pabyDataT[0];                                           _pabyDataT[0] = _pabyDataT[1];                                    _pabyDataT[1] = byTemp;                                       }

//C     #define CPL_SWAP32(x)         ((GUInt32)(             (((GUInt32)(x) & (GUInt32)0x000000ffUL) << 24) |             (((GUInt32)(x) & (GUInt32)0x0000ff00UL) <<  8) |             (((GUInt32)(x) & (GUInt32)0x00ff0000UL) >>  8) |             (((GUInt32)(x) & (GUInt32)0xff000000UL) >> 24) ))

//C     #define CPL_SWAP32PTR(x) {                                                                     GByte       byTemp, *_pabyDataT = (GByte *) (x);                  CPL_STATIC_ASSERT_IF_AVAILABLE(sizeof(*(x)) == 1 || sizeof(*(x)) == 4);                                                                        byTemp = _pabyDataT[0];                                           _pabyDataT[0] = _pabyDataT[3];                                    _pabyDataT[3] = byTemp;                                           byTemp = _pabyDataT[1];                                           _pabyDataT[1] = _pabyDataT[2];                                    _pabyDataT[2] = byTemp;                                       }

//C     #define CPL_SWAP64PTR(x) {                                                                     GByte       byTemp, *_pabyDataT = (GByte *) (x);                  CPL_STATIC_ASSERT_IF_AVAILABLE(sizeof(*(x)) == 1 || sizeof(*(x)) == 8);                                                                       byTemp = _pabyDataT[0];                                           _pabyDataT[0] = _pabyDataT[7];                                    _pabyDataT[7] = byTemp;                                           byTemp = _pabyDataT[1];                                           _pabyDataT[1] = _pabyDataT[6];                                    _pabyDataT[6] = byTemp;                                           byTemp = _pabyDataT[2];                                           _pabyDataT[2] = _pabyDataT[5];                                    _pabyDataT[5] = byTemp;                                           byTemp = _pabyDataT[3];                                           _pabyDataT[3] = _pabyDataT[4];                                    _pabyDataT[4] = byTemp;                                       }


/* Until we have a safe 64 bits integer data type defined, we'll replace
 * this version of the CPL_SWAP64() macro with a less efficient one.
 */
/*
#define CPL_SWAP64(x)         ((uint64)(             (uint64)(((uint64)(x) & (uint64)0x00000000000000ffULL) << 56) |             (uint64)(((uint64)(x) & (uint64)0x000000000000ff00ULL) << 40) |             (uint64)(((uint64)(x) & (uint64)0x0000000000ff0000ULL) << 24) |             (uint64)(((uint64)(x) & (uint64)0x00000000ff000000ULL) << 8) |             (uint64)(((uint64)(x) & (uint64)0x000000ff00000000ULL) >> 8) |             (uint64)(((uint64)(x) & (uint64)0x0000ff0000000000ULL) >> 24) |             (uint64)(((uint64)(x) & (uint64)0x00ff000000000000ULL) >> 40) |             (uint64)(((uint64)(x) & (uint64)0xff00000000000000ULL) >> 56) ))
*/

//C     #define CPL_SWAPDOUBLE(p) CPL_SWAP64PTR(p)

//C     #ifdef CPL_MSB
//C     #  define CPL_MSBWORD16(x)      (x)
//C     #  define CPL_LSBWORD16(x)      CPL_SWAP16(x)
//C     #  define CPL_MSBWORD32(x)      (x)
//C     #  define CPL_LSBWORD32(x)      CPL_SWAP32(x)
//C     #  define CPL_MSBPTR16(x)       CPL_STATIC_ASSERT_IF_AVAILABLE(sizeof(*(x)) == 1 || sizeof(*(x)) == 2)
//C     #  define CPL_LSBPTR16(x)       CPL_SWAP16PTR(x)
//C     #  define CPL_MSBPTR32(x)       CPL_STATIC_ASSERT_IF_AVAILABLE(sizeof(*(x)) == 1 || sizeof(*(x)) == 4)
//C     #  define CPL_LSBPTR32(x)       CPL_SWAP32PTR(x)
//C     #  define CPL_MSBPTR64(x)       CPL_STATIC_ASSERT_IF_AVAILABLE(sizeof(*(x)) == 1 || sizeof(*(x)) == 8)
//C     #  define CPL_LSBPTR64(x)       CPL_SWAP64PTR(x)
//C     #else
//C     #  define CPL_LSBWORD16(x)      (x)
//C     #  define CPL_MSBWORD16(x)      CPL_SWAP16(x)
//C     #  define CPL_LSBWORD32(x)      (x)
//C     #  define CPL_MSBWORD32(x)      CPL_SWAP32(x)
//C     #  define CPL_LSBPTR16(x)       CPL_STATIC_ASSERT_IF_AVAILABLE(sizeof(*(x)) == 1 || sizeof(*(x)) == 2)
//C     #  define CPL_MSBPTR16(x)       CPL_SWAP16PTR(x)
//C     #  define CPL_LSBPTR32(x)       CPL_STATIC_ASSERT_IF_AVAILABLE(sizeof(*(x)) == 1 || sizeof(*(x)) == 4)
//C     #  define CPL_MSBPTR32(x)       CPL_SWAP32PTR(x)
//C     #  define CPL_LSBPTR64(x)       CPL_STATIC_ASSERT_IF_AVAILABLE(sizeof(*(x)) == 1 || sizeof(*(x)) == 8)
//C     #  define CPL_MSBPTR64(x)       CPL_SWAP64PTR(x)
//C     #endif

/** Return a Int16 from the 2 bytes ordered in LSB order at address x */
//C     #define CPL_LSBINT16PTR(x)    ((*(GByte*)(x)) | (*(((GByte*)(x))+1) << 8))

/** Return a Int32 from the 4 bytes ordered in LSB order at address x */
//C     #define CPL_LSBINT32PTR(x)    ((*(GByte*)(x)) | (*(((GByte*)(x))+1) << 8) |                               (*(((GByte*)(x))+2) << 16) | (*(((GByte*)(x))+3) << 24))

/** Return a signed Int16 from the 2 bytes ordered in LSB order at address x */
//C     #define CPL_LSBSINT16PTR(x) ((GInt16) CPL_LSBINT16PTR(x))

/** Return a unsigned Int16 from the 2 bytes ordered in LSB order at address x */
//C     #define CPL_LSBUINT16PTR(x) ((GUInt16)CPL_LSBINT16PTR(x))

/** Return a signed Int32 from the 4 bytes ordered in LSB order at address x */
//C     #define CPL_LSBSINT32PTR(x) ((GInt32) CPL_LSBINT32PTR(x))

/** Return a unsigned Int32 from the 4 bytes ordered in LSB order at address x */
//C     #define CPL_LSBUINT32PTR(x) ((GUInt32)CPL_LSBINT32PTR(x))


/* Utility macro to explicitly mark intentionally unreferenced parameters. */
//C     #ifndef UNREFERENCED_PARAM
//C     #  ifdef UNREFERENCED_PARAMETER /* May be defined by Windows API */
//C     #    define UNREFERENCED_PARAM(param) UNREFERENCED_PARAMETER(param)
//C     #  else
//C     #    define UNREFERENCED_PARAM(param) ((void)param)
//C     #  endif /* UNREFERENCED_PARAMETER */
//C     #endif /* UNREFERENCED_PARAM */

/***********************************************************************
 * Define CPL_CVSID() macro.  It can be disabled during a build by
 * defining DISABLE_CVSID in the compiler options.
 *
 * The cvsid_aw() function is just there to prevent reports of cpl_cvsid()
 * being unused.
 */

//C     #ifndef DISABLE_CVSID
//C     #if defined(__GNUC__) && __GNUC__ >= 4
//C     #  define CPL_CVSID(string)     static const char cpl_cvsid[] __attribute__((used)) = string;
//C     #else
//C     #  define CPL_CVSID(string)     static const char cpl_cvsid[] = string; static const char *cvsid_aw() { return( cvsid_aw() ? NULL : cpl_cvsid ); }
//C     #endif
//C     #else
//C     #  define CPL_CVSID(string)
//C     #endif

/* Null terminated variadic */
/* We exclude mingw64 4.6 which seems to be broken regarding this */
//C     #if defined(__GNUC__) && __GNUC__ >= 4 && !defined(DOXYGEN_SKIP) && !(defined(__MINGW64__) && __GNUC__ == 4 && __GNUC_MINOR__ == 6)
//C     #   define CPL_NULL_TERMINATED     __attribute__((__sentinel__))
//C     #else
//C     #   define CPL_NULL_TERMINATED
//C     #endif

//C     #if defined(__GNUC__) && __GNUC__ >= 3 && !defined(DOXYGEN_SKIP)
//C     #define CPL_PRINT_FUNC_FORMAT( format_idx, arg_idx )  __attribute__((__format__ (__printf__, format_idx, arg_idx)))
//C     #define CPL_SCAN_FUNC_FORMAT( format_idx, arg_idx )  __attribute__((__format__ (__scanf__, format_idx, arg_idx)))
//C     #else
//C     #define CPL_PRINT_FUNC_FORMAT( format_idx, arg_idx )
//C     #define CPL_SCAN_FUNC_FORMAT( format_idx, arg_idx )
//C     #endif

//C     #if defined(__GNUC__) && __GNUC__ >= 4 && !defined(DOXYGEN_SKIP)
//C     #define CPL_WARN_UNUSED_RESULT                        __attribute__((warn_unused_result))
//C     #else
//C     #define CPL_WARN_UNUSED_RESULT
//C     #endif

//C     #if defined(__GNUC__) && __GNUC__ >= 4
//C     #  define CPL_UNUSED __attribute((__unused__))
//C     #else
/* TODO: add cases for other compilers */
//C     #  define CPL_UNUSED
//C     #endif

//C     #if defined(__GNUC__) && __GNUC__ >= 3 && !defined(DOXYGEN_SKIP)
//C     #define CPL_NO_RETURN                                __attribute__((noreturn))
//C     #else
//C     #define CPL_NO_RETURN
//C     #endif

/* Clang __has_attribute */
//C     #ifndef __has_attribute
//C       #define __has_attribute(x) 0  // Compatibility with non-clang compilers.
//C     #endif

//C     #if ((defined(__GNUC__) && (__GNUC__ >= 5 || (__GNUC__ == 4 && __GNUC_MINOR__ >= 9))) || __has_attribute(returns_nonnull)) && !defined(DOXYGEN_SKIP)
//C     #  define CPL_RETURNS_NONNULL __attribute__((returns_nonnull))
//C     #else
//C     #  define CPL_RETURNS_NONNULL
//C     #endif


//C     #if defined(__GNUC__) && __GNUC__ >= 4 && !defined(DOXYGEN_SKIP)
//C     #define CPL_RESTRICT __restrict__
//C     #else
//C     #define CPL_RESTRICT
//C     #endif

/* Helper to remove the copy and assignment constructors so that the compiler
   will not generate the default versions.

   Must be placed in the private section of a class and should be at the end.
*/
//C     #ifdef __cplusplus

//C     #if HAVE_CXX11
//C     #  define CPL_FINAL final
//C     #  define CPL_DISALLOW_COPY_ASSIGN(ClassName)     ClassName( const ClassName & ) = delete;     ClassName &operator=( const ClassName & ) = delete;
//C     #else
//C     #  define CPL_FINAL
//C     #  define CPL_DISALLOW_COPY_ASSIGN(ClassName)     ClassName( const ClassName & );     ClassName &operator=( const ClassName & );
//C     #endif  /* HAVE_CXX11 */

//C     #endif /* __cplusplus */

//C     #if !defined(DOXYGEN_SKIP)
//C     #if defined(__has_extension)
//C       #if __has_extension(attribute_deprecated_with_message)
    /* Clang extension */
//C         #define CPL_WARN_DEPRECATED(x)                       __attribute__ ((deprecated(x)))
//C       #else
//C         #define CPL_WARN_DEPRECATED(x)
//C       #endif
//C     #elif defined(__GNUC__)
//C         #define CPL_WARN_DEPRECATED(x)                       __attribute__ ((deprecated))
//C     #else
//C       #define CPL_WARN_DEPRECATED(x)
//C     #endif
//C     #endif

//C     #if !defined(_MSC_VER) && !defined(__APPLE__)
//C     CPL_C_START
//C     #ifdef WARN_STANDARD_PRINTF
//C     int vsnprintf(char *str, size_t size, const char* fmt, va_list args) CPL_WARN_DEPRECATED("Use CPLvsnprintf() instead");
//C     int snprintf(char *str, size_t size, const char* fmt, ...) CPL_PRINT_FUNC_FORMAT(3,4) CPL_WARN_DEPRECATED("Use CPLsnprintf() instead");
//C     int sprintf(char *str, const char* fmt, ...) CPL_PRINT_FUNC_FORMAT(2, 3) CPL_WARN_DEPRECATED("Use CPLsnprintf() instead");
//C     #elif defined(GDAL_COMPILATION) && !defined(DONT_DEPRECATE_SPRINTF)
//C     int sprintf(char *str, const char* fmt, ...) CPL_PRINT_FUNC_FORMAT(2, 3) CPL_WARN_DEPRECATED("Use snprintf() or CPLsnprintf() instead");
//C     #endif
//C     CPL_C_END
//C     #endif /* !defined(_MSC_VER) && !defined(__APPLE__) */

//C     #if defined(MAKE_SANITIZE_HAPPY) || !(defined(__i386__) || defined(__x86_64__) || defined(_M_IX86) || defined(_M_X64))
//C     #define CPL_CPU_REQUIRES_ALIGNED_ACCESS
//C     #define CPL_IS_DOUBLE_A_INT(d)  ( (d) >= INT_MIN && (d) <= INT_MAX && (double)(int)(d) == (d) )
//C     #else
/* This is technically unspecified behaviour if the double is out of range, but works OK on x86 */
//C     #define CPL_IS_DOUBLE_A_INT(d)  ( (double)(int)(d) == (d) )
//C     #endif

//C     #ifdef __cplusplus
/* The size of C style arrays. */
//C     #define CPL_ARRAYSIZE(array)   ((sizeof(array) / sizeof(*(array))) /   static_cast<size_t>(!(sizeof(array) % sizeof(*(array)))))

//C     extern "C++" {
//C     template<class T> static void CPL_IGNORE_RET_VAL(T) {}
//C     inline static bool CPL_TO_BOOL(int x) { return x != 0; }
//C     } /* extern "C++" */

//C     #endif  /* __cplusplus */

//C     #if (((__GNUC__ > 4 || (__GNUC__ == 4 && __GNUC_MINOR__ >= 6)) || (defined(__clang__) && __clang_major__ >= 3)) && !defined(_MSC_VER))
//C     #define HAVE_GCC_DIAGNOSTIC_PUSH
//C     #endif

//C     #if ((__GNUC__ > 4 || (__GNUC__ == 4 && __GNUC_MINOR__ >= 2)) && !defined(_MSC_VER))
//C     #define HAVE_GCC_SYSTEM_HEADER
//C     #endif

//C     #if defined(__clang__)
//C     #  define CPL_FALLTHROUGH [[clang::fallthrough]];
//C     #else
//C     #  define CPL_FALLTHROUGH
//C     #endif

// Define DEBUG_BOOL to compile in "MSVC mode", ie error out when
// a integer is assigned to a bool
// WARNING: use only at compilation time, since it is know to not work
//  at runtime for unknown reasons (crash in MongoDB driver for example)
//C     #if defined(__cplusplus) && defined(DEBUG_BOOL) && !defined(DO_NOT_USE_DEBUG_BOOL)
//C     extern "C++" {
//C     class MSVCPedanticBool
//C     {

//C             friend bool operator== (const bool& one, const MSVCPedanticBool& other);
//C             friend bool operator!= (const bool& one, const MSVCPedanticBool& other);

//C             bool b;
//C             MSVCPedanticBool(int bIn);

//C         public:
        /* b not initialized on purpose in default ctor to flag use. */
        /* cppcheck-suppress uninitMemberVar */
//C             MSVCPedanticBool() {}
//C             MSVCPedanticBool(bool bIn) : b(bIn) {}
//C             MSVCPedanticBool(const MSVCPedanticBool& other) : b(other.b) {}

//C             MSVCPedanticBool& operator= (const MSVCPedanticBool& other) { b = other.b; return *this; }
//C             MSVCPedanticBool& operator&= (const MSVCPedanticBool& other) { b &= other.b; return *this; }
//C             MSVCPedanticBool& operator|= (const MSVCPedanticBool& other) { b |= other.b; return *this; }

//C             bool operator== (const bool& other) const { return b == other; }
//C             bool operator!= (const bool& other) const { return b != other; }
//C             bool operator== (const MSVCPedanticBool& other) const { return b == other.b; }
//C             bool operator!= (const MSVCPedanticBool& other) const { return b != other.b; }

//C             bool operator! () const { return !b; }
//C             operator bool() const { return b; }
//C             operator int() const { return b; }
//C     };

//C     inline bool operator== (const bool& one, const MSVCPedanticBool& other) { return one == other.b; }
//C     inline bool operator!= (const bool& one, const MSVCPedanticBool& other) { return one != other.b; }

/* We must include all C++ stuff before to avoid issues with templates that use bool */
//C     #include <vector>
//C     #include <map>
//C     #include <set>
//C     #include <string>
//C     #include <cstddef>
//C     #include <limits>
//C     #include <sstream>
//C     #include <fstream>
//C     #include <algorithm>

//C     } /* extern C++ */

//C     #undef FALSE
//C     #define FALSE false
//C     #undef TRUE
//C     #define TRUE true

/* In the very few cases we really need a "simple" type, fallback to bool */
//C     #define EMULATED_BOOL int

/* Use our class instead of bool */
//C     #define bool MSVCPedanticBool

/* "volatile bool" with the below substitution doesn't really work. */
/* Just for the sake of the debug, we don't really need volatile */
//C     #define VOLATILE_BOOL bool

//C     #else /* defined(__cplusplus) && defined(DEBUG_BOOL) */

//C     #ifndef FALSE
//C     #  define FALSE 0
//C     #endif
const FALSE = 0;

//C     #ifndef TRUE
//C     #  define TRUE 1
//C     #endif
const TRUE = 1;

//C     #define EMULATED_BOOL bool
//C     #define VOLATILE_BOOL volatile bool
alias bool EMULATED_BOOL;

//C     #endif /* defined(__cplusplus) && defined(DEBUG_BOOL) */

//C     #endif /* ndef CPL_BASE_H_INCLUDED */
