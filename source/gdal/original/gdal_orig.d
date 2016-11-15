/* Converted to D from C:/devLibs/gdal21/include/gdal.h by htod */
module ./gdal;
/******************************************************************************
 * $Id: gdal.h 33852 2016-04-01 23:27:53Z goatbar $
 *
 * Project:  GDAL Core
 * Purpose:  GDAL Core C/Public declarations.
 * Author:   Frank Warmerdam, warmerdam@pobox.com
 *
 ******************************************************************************
 * Copyright (c) 1998, 2002 Frank Warmerdam
 * Copyright (c) 2007-2014, Even Rouault <even dot rouault at mines-paris dot org>
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

//C     #ifndef GDAL_H_INCLUDED
//C     #define GDAL_H_INCLUDED

/**
 * \file gdal.h
 *
 * Public (C callable) GDAL entry points.
 */

//C     #ifndef DOXYGEN_SKIP
//C     #include "gdal_version.h"
import gdal_version;
//C     #include "cpl_port.h"
import cpl_port;
//C     #include "cpl_error.h"
import cpl_error;
//C     #include "cpl_progress.h"
import cpl_progress;
//C     #include "cpl_virtualmem.h"
import cpl_virtualmem;
//C     #include "cpl_minixml.h"
import cpl_minixml;
//C     #include "ogr_api.h"
import ogr_api;
//C     #endif

/* -------------------------------------------------------------------- */
/*      Significant constants.                                          */
/* -------------------------------------------------------------------- */

//C     CPL_C_START

/*! Pixel data types */
//C     typedef enum {
    /*! Unknown or unspecified type */
//C               GDT_Unknown = 0,
    /*! Eight bit unsigned integer */
//C                GDT_Byte = 1,
    /*! Sixteen bit unsigned integer */
//C              GDT_UInt16 = 2,
    /*! Sixteen bit signed integer */
//C                GDT_Int16 = 3,
    /*! Thirty two bit unsigned integer */
//C           GDT_UInt32 = 4,
    /*! Thirty two bit signed integer */
//C             GDT_Int32 = 5,
    /*! Thirty two bit floating point */
//C             GDT_Float32 = 6,
    /*! Sixty four bit floating point */
//C             GDT_Float64 = 7,
    /*! Complex Int16 */
//C                             GDT_CInt16 = 8,
    /*! Complex Int32 */
//C                             GDT_CInt32 = 9,
    /*! Complex Float32 */
//C                           GDT_CFloat32 = 10,
    /*! Complex Float64 */
//C                           GDT_CFloat64 = 11,
//C         GDT_TypeCount = 12          /* maximum type # + 1 */
//C     } GDALDataType;
enum
{
    GDT_Unknown,
    GDT_Byte,
    GDT_UInt16,
    GDT_Int16,
    GDT_UInt32,
    GDT_Int32,
    GDT_Float32,
    GDT_Float64,
    GDT_CInt16,
    GDT_CInt32,
    GDT_CFloat32,
    GDT_CFloat64,
    GDT_TypeCount,
}
extern (C):
alias int GDALDataType;

//C     int CPL_DLL CPL_STDCALL GDALGetDataTypeSize( GDALDataType );  // Deprecated.
extern (Windows):
int  GDALGetDataTypeSize(GDALDataType );
//C     int CPL_DLL CPL_STDCALL GDALGetDataTypeSizeBits( GDALDataType eDataType );
int  GDALGetDataTypeSizeBits(GDALDataType eDataType);
//C     int CPL_DLL CPL_STDCALL GDALGetDataTypeSizeBytes( GDALDataType );
int  GDALGetDataTypeSizeBytes(GDALDataType );
//C     int CPL_DLL CPL_STDCALL GDALDataTypeIsComplex( GDALDataType );
int  GDALDataTypeIsComplex(GDALDataType );
//C     const char CPL_DLL * CPL_STDCALL GDALGetDataTypeName( GDALDataType );
char * GDALGetDataTypeName(GDALDataType );
//C     GDALDataType CPL_DLL CPL_STDCALL GDALGetDataTypeByName( const char * );
GDALDataType  GDALGetDataTypeByName(char *);
//C     GDALDataType CPL_DLL CPL_STDCALL GDALDataTypeUnion( GDALDataType, GDALDataType );
GDALDataType  GDALDataTypeUnion(GDALDataType , GDALDataType );
//C     double CPL_DLL GDALAdjustValueToDataType( GDALDataType eDT, double dfValue, int* pbClamped, int* pbRounded );
extern (C):
double  GDALAdjustValueToDataType(GDALDataType eDT, double dfValue, int *pbClamped, int *pbRounded);

/**
* status of the asynchronous stream
*/
//C     typedef enum
//C     {
//C     	GARIO_PENDING = 0,
//C     	GARIO_UPDATE = 1,
//C     	GARIO_ERROR = 2,
//C     	GARIO_COMPLETE = 3,
//C     	GARIO_TypeCount = 4
//C     } GDALAsyncStatusType;
enum
{
    GARIO_PENDING,
    GARIO_UPDATE,
    GARIO_ERROR,
    GARIO_COMPLETE,
    GARIO_TypeCount,
}
alias int GDALAsyncStatusType;

//C     const char CPL_DLL * CPL_STDCALL GDALGetAsyncStatusTypeName( GDALAsyncStatusType );
extern (Windows):
char * GDALGetAsyncStatusTypeName(GDALAsyncStatusType );
//C     GDALAsyncStatusType CPL_DLL CPL_STDCALL GDALGetAsyncStatusTypeByName( const char * );
GDALAsyncStatusType  GDALGetAsyncStatusTypeByName(char *);

/*! Flag indicating read/write, or read-only access to data. */
//C     typedef enum {
    /*! Read only (no update) access */
//C      GA_ReadOnly = 0,
    /*! Read/write access. */
//C                GA_Update = 1
//C     } GDALAccess;
enum
{
    GA_ReadOnly,
    GA_Update,
}
extern (C):
alias int GDALAccess;

/*! Read/Write flag for RasterIO() method */
//C     typedef enum {
    /*! Read data */
//C        GF_Read = 0,
    /*! Write data */
//C       GF_Write = 1
//C     } GDALRWFlag;
enum
{
    GF_Read,
    GF_Write,
}
alias int GDALRWFlag;

/* NOTE: values are selected to be consistent with GDALResampleAlg of alg/gdalwarper.h */
/** RasterIO() resampling method.
  * @since GDAL 2.0
  */
//C     typedef enum
//C     {
    /*! Nearest neighbour */
//C                                 GRIORA_NearestNeighbour = 0,
    /*! Bilinear (2x2 kernel) */
//C                             GRIORA_Bilinear = 1,
    /*! Cubic Convolution Approximation (4x4 kernel) */
//C      GRIORA_Cubic = 2,
    /*! Cubic B-Spline Approximation (4x4 kernel) */
//C         GRIORA_CubicSpline = 3,
    /*! Lanczos windowed sinc interpolation (6x6 kernel) */
//C      GRIORA_Lanczos = 4,
    /*! Average */
//C                                           GRIORA_Average = 5,
    /*! Mode (selects the value which appears most often of all the sampled points) */
//C                                                             GRIORA_Mode = 6,
    /*! Gauss blurring */
//C                                    GRIORA_Gauss = 7
    /* NOTE: values 8 to 12 are reserved for max,min,med,Q1,Q3 */
//C     } GDALRIOResampleAlg;
enum
{
    GRIORA_NearestNeighbour,
    GRIORA_Bilinear,
    GRIORA_Cubic,
    GRIORA_CubicSpline,
    GRIORA_Lanczos,
    GRIORA_Average,
    GRIORA_Mode,
    GRIORA_Gauss,
}
alias int GDALRIOResampleAlg;

/* NOTE to developers: only add members, and if so edit INIT_RASTERIO_EXTRA_ARG */
/* and INIT_RASTERIO_EXTRA_ARG */
/** Structure to pass extra arguments to RasterIO() method
  * @since GDAL 2.0
  */
//C     typedef struct
//C     {
    /*! Version of structure (to allow future extensions of the structure) */
//C         int                    nVersion;

    /*! Resampling algorithm */
//C         GDALRIOResampleAlg     eResampleAlg;

    /*! Progress callback */
//C         GDALProgressFunc       pfnProgress;
    /*! Progress callback user data */
//C         void                  *pProgressData;

    /*! Indicate if dfXOff, dfYOff, dfXSize and dfYSize are set.
        Mostly reserved from the VRT driver to communicate a more precise
        source window. Must be such that dfXOff - nXOff < 1.0 and
        dfYOff - nYOff < 1.0 and nXSize - dfXSize < 1.0 and nYSize - dfYSize < 1.0 */
//C         int                    bFloatingPointWindowValidity;
    /*! Pixel offset to the top left corner. Only valid if bFloatingPointWindowValidity = TRUE */
//C         double                 dfXOff;
    /*! Line offset to the top left corner. Only valid if bFloatingPointWindowValidity = TRUE */
//C         double                 dfYOff;
    /*! Width in pixels of the area of interest. Only valid if bFloatingPointWindowValidity = TRUE */
//C         double                 dfXSize;
    /*! Height in pixels of the area of interest. Only valid if bFloatingPointWindowValidity = TRUE */
//C         double                 dfYSize;
//C     } GDALRasterIOExtraArg;
struct _N25
{
    int nVersion;
    GDALRIOResampleAlg eResampleAlg;
    GDALProgressFunc pfnProgress;
    void *pProgressData;
    int bFloatingPointWindowValidity;
    double dfXOff;
    double dfYOff;
    double dfXSize;
    double dfYSize;
}
alias _N25 GDALRasterIOExtraArg;

//C     #define RASTERIO_EXTRA_ARG_CURRENT_VERSION  1

const RASTERIO_EXTRA_ARG_CURRENT_VERSION = 1;
/** Macro to initialize an instance of GDALRasterIOExtraArg structure.
  * @since GDAL 2.0
  */
//C     #define INIT_RASTERIO_EXTRA_ARG(s)      do { (s).nVersion = RASTERIO_EXTRA_ARG_CURRENT_VERSION;          (s).eResampleAlg = GRIORA_NearestNeighbour;          (s).pfnProgress = NULL;          (s).pProgressData = NULL;          (s).bFloatingPointWindowValidity = FALSE; } while(0)

/*! Types of color interpretation for raster bands. */
//C     typedef enum
//C     {
//C         GCI_Undefined=0,
    /*! Greyscale */
//C                                           GCI_GrayIndex=1,
    /*! Paletted (see associated color table) */
//C               GCI_PaletteIndex=2,
    /*! Red band of RGBA image */
//C                              GCI_RedBand=3,
    /*! Green band of RGBA image */
//C                            GCI_GreenBand=4,
    /*! Blue band of RGBA image */
//C                             GCI_BlueBand=5,
    /*! Alpha (0=transparent, 255=opaque) */
//C                   GCI_AlphaBand=6,
    /*! Hue band of HLS image */
//C                               GCI_HueBand=7,
    /*! Saturation band of HLS image */
//C                        GCI_SaturationBand=8,
    /*! Lightness band of HLS image */
//C                         GCI_LightnessBand=9,
    /*! Cyan band of CMYK image */
//C                             GCI_CyanBand=10,
    /*! Magenta band of CMYK image */
//C                          GCI_MagentaBand=11,
    /*! Yellow band of CMYK image */
//C                           GCI_YellowBand=12,
    /*! Black band of CMLY image */
//C                            GCI_BlackBand=13,
    /*! Y Luminance */
//C                                         GCI_YCbCr_YBand=14,
    /*! Cb Chroma */
//C                                           GCI_YCbCr_CbBand=15,
    /*! Cr Chroma */
//C                                           GCI_YCbCr_CrBand=16,
    /*! Max current value */
//C                                   GCI_Max=16
//C     } GDALColorInterp;
enum
{
    GCI_Undefined,
    GCI_GrayIndex,
    GCI_PaletteIndex,
    GCI_RedBand,
    GCI_GreenBand,
    GCI_BlueBand,
    GCI_AlphaBand,
    GCI_HueBand,
    GCI_SaturationBand,
    GCI_LightnessBand,
    GCI_CyanBand,
    GCI_MagentaBand,
    GCI_YellowBand,
    GCI_BlackBand,
    GCI_YCbCr_YBand,
    GCI_YCbCr_CbBand,
    GCI_YCbCr_CrBand,
    GCI_Max = 16,
}
alias int GDALColorInterp;

//C     const char CPL_DLL *GDALGetColorInterpretationName( GDALColorInterp );
char * GDALGetColorInterpretationName(GDALColorInterp );
//C     GDALColorInterp CPL_DLL GDALGetColorInterpretationByName( const char *pszName );
GDALColorInterp  GDALGetColorInterpretationByName(char *pszName);

/*! Types of color interpretations for a GDALColorTable. */
//C     typedef enum
//C     {
  /*! Grayscale (in GDALColorEntry.c1) */
//C                           GPI_Gray=0,
  /*! Red, Green, Blue and Alpha in (in c1, c2, c3 and c4) */
//C       GPI_RGB=1,
  /*! Cyan, Magenta, Yellow and Black (in c1, c2, c3 and c4)*/
//C      GPI_CMYK=2,
  /*! Hue, Lightness and Saturation (in c1, c2, and c3) */
//C          GPI_HLS=3
//C     } GDALPaletteInterp;
enum
{
    GPI_Gray,
    GPI_RGB,
    GPI_CMYK,
    GPI_HLS,
}
alias int GDALPaletteInterp;

//C     const char CPL_DLL *GDALGetPaletteInterpretationName( GDALPaletteInterp );
char * GDALGetPaletteInterpretationName(GDALPaletteInterp );

/* "well known" metadata items. */

//C     #define GDALMD_AREA_OR_POINT   "AREA_OR_POINT"
//C     #  define GDALMD_AOP_AREA      "Area"
//C     #  define GDALMD_AOP_POINT     "Point"

/* -------------------------------------------------------------------- */
/*      GDAL Specific error codes.                                      */
/*                                                                      */
/*      error codes 100 to 299 reserved for GDAL.                       */
/* -------------------------------------------------------------------- */
//C     #define CPLE_WrongFormat        (CPLErrorNum)200

/* -------------------------------------------------------------------- */
/*      Define handle types related to various internal classes.        */
/* -------------------------------------------------------------------- */

/** Opaque type used for the C bindings of the C++ GDALMajorObject class */
//C     typedef void *GDALMajorObjectH;
alias void *GDALMajorObjectH;

/** Opaque type used for the C bindings of the C++ GDALDataset class */
//C     typedef void *GDALDatasetH;
alias void *GDALDatasetH;

/** Opaque type used for the C bindings of the C++ GDALRasterBand class */
//C     typedef void *GDALRasterBandH;
alias void *GDALRasterBandH;

/** Opaque type used for the C bindings of the C++ GDALDriver class */
//C     typedef void *GDALDriverH;
alias void *GDALDriverH;

/** Opaque type used for the C bindings of the C++ GDALColorTable class */
//C     typedef void *GDALColorTableH;
alias void *GDALColorTableH;

/** Opaque type used for the C bindings of the C++ GDALRasterAttributeTable class */
//C     typedef void *GDALRasterAttributeTableH;
alias void *GDALRasterAttributeTableH;

/** Opaque type used for the C bindings of the C++ GDALAsyncReader class */
//C     typedef void *GDALAsyncReaderH;
alias void *GDALAsyncReaderH;

/** Type to express pixel, line or band spacing. Signed 64 bit integer. */
//C     typedef GIntBig GSpacing;
alias GIntBig GSpacing;

/* ==================================================================== */
/*      Registration/driver related.                                    */
/* ==================================================================== */

/** Long name of the driver */
//C     #define GDAL_DMD_LONGNAME "DMD_LONGNAME"

/** URL (relative to http://gdal.org/) to the help page of the driver */
#define GDAL_DMD_HELPTOPIC "DMD_HELPTOPIC"

/** MIME type handled by the driver. */
//C     #define GDAL_DMD_MIMETYPE "DMD_MIMETYPE"

/** Extension handled by the driver. */
//C     #define GDAL_DMD_EXTENSION "DMD_EXTENSION"

/** Connection prefix to provide as the file name of the open function.
 * Typically set for non-file based drivers. Generally used with open options.
 * @since GDAL 2.0
 */
//C     #define GDAL_DMD_CONNECTION_PREFIX "DMD_CONNECTION_PREFIX"

/** List of (space separated) extensions handled by the driver.
 * @since GDAL 2.0
 */
//C     #define GDAL_DMD_EXTENSIONS "DMD_EXTENSIONS"

/** XML snippet with creation options. */
//C     #define GDAL_DMD_CREATIONOPTIONLIST "DMD_CREATIONOPTIONLIST"

/** XML snippet with open options.
 * @since GDAL 2.0
 */
//C     #define GDAL_DMD_OPENOPTIONLIST "DMD_OPENOPTIONLIST"

/** List of (space separated) raster data types support by the Create()/CreateCopy() API. */
//C     #define GDAL_DMD_CREATIONDATATYPES "DMD_CREATIONDATATYPES"

/** List of (space separated) vector field types support by the CreateField() API.
 * @since GDAL 2.0
 * */
//C     #define GDAL_DMD_CREATIONFIELDDATATYPES "DMD_CREATIONFIELDDATATYPES"

/** Capability set by a driver that exposes Subdatasets. */
//C     #define GDAL_DMD_SUBDATASETS "DMD_SUBDATASETS"

/** Capability set by a driver that implements the Open() API. */
//C     #define GDAL_DCAP_OPEN       "DCAP_OPEN"

/** Capability set by a driver that implements the Create() API. */
//C     #define GDAL_DCAP_CREATE     "DCAP_CREATE"

/** Capability set by a driver that implements the CreateCopy() API. */
//C     #define GDAL_DCAP_CREATECOPY "DCAP_CREATECOPY"

/** Capability set by a driver that can read/create datasets through the VSI*L API. */
//C     #define GDAL_DCAP_VIRTUALIO  "DCAP_VIRTUALIO"

/** Capability set by a driver having raster capability.
 * @since GDAL 2.0
 */
//C     #define GDAL_DCAP_RASTER     "DCAP_RASTER"

/** Capability set by a driver having vector capability.
 * @since GDAL 2.0
 */
//C     #define GDAL_DCAP_VECTOR     "DCAP_VECTOR"

/** Capability set by a driver having vector capability.
 * @since GDAL 2.1
 */
//C     #define GDAL_DCAP_GNM         "DCAP_GNM"

/** Capability set by a driver that can create fields with NOT NULL constraint.
 * @since GDAL 2.0
 */
//C     #define GDAL_DCAP_NOTNULL_FIELDS "DCAP_NOTNULL_FIELDS"

/** Capability set by a driver that can create fields with DEFAULT values.
 * @since GDAL 2.0
 */
//C     #define GDAL_DCAP_DEFAULT_FIELDS "DCAP_DEFAULT_FIELDS"

/** Capability set by a driver that can create geometry fields with NOT NULL constraint.
 * @since GDAL 2.0
 */
//C     #define GDAL_DCAP_NOTNULL_GEOMFIELDS "DCAP_NOTNULL_GEOMFIELDS"

//C     void CPL_DLL CPL_STDCALL GDALAllRegister( void );
extern (Windows):
void  GDALAllRegister();

//C     GDALDatasetH CPL_DLL CPL_STDCALL GDALCreate( GDALDriverH hDriver,
//C                                      const char *, int, int, int, GDALDataType,
//C                                      char ** ) CPL_WARN_UNUSED_RESULT;
GDALDatasetH  GDALCreate(GDALDriverH hDriver, char *, int , int , int , GDALDataType , char **);
//C     GDALDatasetH CPL_DLL CPL_STDCALL
//C     GDALCreateCopy( GDALDriverH, const char *, GDALDatasetH,
//C                     int, char **, GDALProgressFunc, void * ) CPL_WARN_UNUSED_RESULT;
GDALDatasetH  GDALCreateCopy(GDALDriverH , char *, GDALDatasetH , int , char **, GDALProgressFunc , void *);

//C     GDALDriverH CPL_DLL CPL_STDCALL GDALIdentifyDriver( const char * pszFilename,
//C                                                 char ** papszFileList );
GDALDriverH  GDALIdentifyDriver(char *pszFilename, char **papszFileList);
//C     GDALDatasetH CPL_DLL CPL_STDCALL
//C     GDALOpen( const char *pszFilename, GDALAccess eAccess ) CPL_WARN_UNUSED_RESULT;
GDALDatasetH  GDALOpen(char *pszFilename, GDALAccess eAccess);
//C     GDALDatasetH CPL_DLL CPL_STDCALL GDALOpenShared( const char *, GDALAccess ) CPL_WARN_UNUSED_RESULT;
GDALDatasetH  GDALOpenShared(char *, GDALAccess );


/* Note: we define GDAL_OF_READONLY and GDAL_OF_UPDATE to be on purpose */
/* equals to GA_ReadOnly and GA_Update */

/** Open in read-only mode.
 * Used by GDALOpenEx().
 * @since GDAL 2.0
 */
//C     #define     GDAL_OF_READONLY        0x00

const GDAL_OF_READONLY = 0x00;
/** Open in update mode.
 * Used by GDALOpenEx().
 * @since GDAL 2.0
 */
//C     #define     GDAL_OF_UPDATE          0x01

const GDAL_OF_UPDATE = 0x01;
/** Allow raster and vector drivers to be used.
 * Used by GDALOpenEx().
 * @since GDAL 2.0
 */
//C     #define     GDAL_OF_ALL             0x00

const GDAL_OF_ALL = 0x00;
/** Allow raster drivers to be used.
 * Used by GDALOpenEx().
 * @since GDAL 2.0
 */
//C     #define     GDAL_OF_RASTER          0x02

const GDAL_OF_RASTER = 0x02;
/** Allow vector drivers to be used.
 * Used by GDALOpenEx().
 * @since GDAL 2.0
 */
//C     #define     GDAL_OF_VECTOR          0x04

const GDAL_OF_VECTOR = 0x04;

/** Allow gnm drivers to be used.
 * Used by GDALOpenEx().
 * @since GDAL 2.1
 */
//C     #define     GDAL_OF_GNM             0x08

const GDAL_OF_GNM = 0x08;
/* Some space for GDAL 3.0 new types ;-) */
/*#define     GDAL_OF_OTHER_KIND1   0x08 */
/*#define     GDAL_OF_OTHER_KIND2   0x10 */
//C     #ifndef DOXYGEN_SKIP
//C     #define     GDAL_OF_KIND_MASK       0x1E
//C     #endif
const GDAL_OF_KIND_MASK = 0x1E;

/** Open in shared mode.
 * Used by GDALOpenEx().
 * @since GDAL 2.0
 */
//C     #define     GDAL_OF_SHARED          0x20

const GDAL_OF_SHARED = 0x20;
/** Emit error message in case of failed open.
 * Used by GDALOpenEx().
 * @since GDAL 2.0
 */
//C     #define     GDAL_OF_VERBOSE_ERROR   0x40

const GDAL_OF_VERBOSE_ERROR = 0x40;
/** Open as internal dataset. Such dataset isn't registered in the global list
 * of opened dataset. Cannot be used with GDAL_OF_SHARED.
 *
 * Used by GDALOpenEx().
 * @since GDAL 2.0
 */
//C     #define     GDAL_OF_INTERNAL        0x80

const GDAL_OF_INTERNAL = 0x80;
/** Let GDAL decide if a array-based or hashset-based storage strategy for
 * cached blocks must be used.
 *
 * GDAL_OF_DEFAULT_BLOCK_ACCESS, GDAL_OF_ARRAY_BLOCK_ACCESS and
 * GDAL_OF_HASHSET_BLOCK_ACCESS are mutually exclusive.
 *
 * Used by GDALOpenEx().
 * @since GDAL 2.1
 */
//C     #define     GDAL_OF_DEFAULT_BLOCK_ACCESS  0

const GDAL_OF_DEFAULT_BLOCK_ACCESS = 0;
/** Use a array-based storage strategy for cached blocks.
 *
 * GDAL_OF_DEFAULT_BLOCK_ACCESS, GDAL_OF_ARRAY_BLOCK_ACCESS and
 * GDAL_OF_HASHSET_BLOCK_ACCESS are mutually exclusive.
 *
 * Used by GDALOpenEx().
 * @since GDAL 2.1
 */
//C     #define     GDAL_OF_ARRAY_BLOCK_ACCESS    0x100

const GDAL_OF_ARRAY_BLOCK_ACCESS = 0x100;
/** Use a hashset-based storage strategy for cached blocks.
 *
 * GDAL_OF_DEFAULT_BLOCK_ACCESS, GDAL_OF_ARRAY_BLOCK_ACCESS and
 * GDAL_OF_HASHSET_BLOCK_ACCESS are mutually exclusive.
 *
 * Used by GDALOpenEx().
 * @since GDAL 2.1
 */
//C     #define     GDAL_OF_HASHSET_BLOCK_ACCESS  0x200

const GDAL_OF_HASHSET_BLOCK_ACCESS = 0x200;
//C     #define     GDAL_OF_RESERVED_1            0x300
//C     #define     GDAL_OF_BLOCK_ACCESS_MASK     0x300
const GDAL_OF_RESERVED_1 = 0x300;

const GDAL_OF_BLOCK_ACCESS_MASK = 0x300;
//C     GDALDatasetH CPL_DLL CPL_STDCALL GDALOpenEx( const char* pszFilename,
//C                                                  unsigned int nOpenFlags,
//C                                                  const char* const* papszAllowedDrivers,
//C                                                  const char* const* papszOpenOptions,
//C                                                  const char* const* papszSiblingFiles ) CPL_WARN_UNUSED_RESULT;
GDALDatasetH  GDALOpenEx(char *pszFilename, uint nOpenFlags, char **papszAllowedDrivers, char **papszOpenOptions, char **papszSiblingFiles);

//C     int          CPL_DLL CPL_STDCALL GDALDumpOpenDatasets( FILE * );
int  GDALDumpOpenDatasets(FILE *);

//C     GDALDriverH CPL_DLL CPL_STDCALL GDALGetDriverByName( const char * );
GDALDriverH  GDALGetDriverByName(char *);
//C     int CPL_DLL         CPL_STDCALL GDALGetDriverCount( void );
int  GDALGetDriverCount();
//C     GDALDriverH CPL_DLL CPL_STDCALL GDALGetDriver( int );
GDALDriverH  GDALGetDriver(int );
//C     void        CPL_DLL CPL_STDCALL GDALDestroyDriver( GDALDriverH );
void  GDALDestroyDriver(GDALDriverH );
//C     int         CPL_DLL CPL_STDCALL GDALRegisterDriver( GDALDriverH );
int  GDALRegisterDriver(GDALDriverH );
//C     void        CPL_DLL CPL_STDCALL GDALDeregisterDriver( GDALDriverH );
void  GDALDeregisterDriver(GDALDriverH );
//C     void        CPL_DLL CPL_STDCALL GDALDestroyDriverManager( void );
void  GDALDestroyDriverManager();
//C     void        CPL_DLL             GDALDestroy( void );
extern (C):
void  GDALDestroy();
//C     CPLErr      CPL_DLL CPL_STDCALL GDALDeleteDataset( GDALDriverH, const char * );
extern (Windows):
CPLErr  GDALDeleteDataset(GDALDriverH , char *);
//C     CPLErr      CPL_DLL CPL_STDCALL GDALRenameDataset( GDALDriverH,
//C                                                        const char * pszNewName,
//C                                                        const char * pszOldName );
CPLErr  GDALRenameDataset(GDALDriverH , char *pszNewName, char *pszOldName);
//C     CPLErr      CPL_DLL CPL_STDCALL GDALCopyDatasetFiles( GDALDriverH,
//C                                                           const char * pszNewName,
//C                                                           const char * pszOldName);
CPLErr  GDALCopyDatasetFiles(GDALDriverH , char *pszNewName, char *pszOldName);
//C     int         CPL_DLL CPL_STDCALL GDALValidateCreationOptions( GDALDriverH,
//C                                                                  char** papszCreationOptions);
int  GDALValidateCreationOptions(GDALDriverH , char **papszCreationOptions);

/* The following are deprecated */
//C     const char CPL_DLL * CPL_STDCALL GDALGetDriverShortName( GDALDriverH );
char * GDALGetDriverShortName(GDALDriverH );
//C     const char CPL_DLL * CPL_STDCALL GDALGetDriverLongName( GDALDriverH );
char * GDALGetDriverLongName(GDALDriverH );
//C     const char CPL_DLL * CPL_STDCALL GDALGetDriverHelpTopic( GDALDriverH );
char * GDALGetDriverHelpTopic(GDALDriverH );
//C     const char CPL_DLL * CPL_STDCALL GDALGetDriverCreationOptionList( GDALDriverH );
char * GDALGetDriverCreationOptionList(GDALDriverH );

/* ==================================================================== */
/*      GDAL_GCP                                                        */
/* ==================================================================== */

/** Ground Control Point */
//C     typedef struct
//C     {
    /** Unique identifier, often numeric */
//C         char        *pszId;

    /** Informational message or "" */
//C         char        *pszInfo;

    /** Pixel (x) location of GCP on raster */
//C         double      dfGCPPixel;
    /** Line (y) location of GCP on raster */
//C         double      dfGCPLine;

    /** X position of GCP in georeferenced space */
//C         double      dfGCPX;

    /** Y position of GCP in georeferenced space */
//C         double      dfGCPY;

    /** Elevation of GCP, or zero if not known */
//C         double      dfGCPZ;
//C     } GDAL_GCP;
struct _N28
{
    char *pszId;
    char *pszInfo;
    double dfGCPPixel;
    double dfGCPLine;
    double dfGCPX;
    double dfGCPY;
    double dfGCPZ;
}
extern (C):
alias _N28 GDAL_GCP;

//C     void CPL_DLL CPL_STDCALL GDALInitGCPs( int, GDAL_GCP * );
extern (Windows):
void  GDALInitGCPs(int , GDAL_GCP *);
//C     void CPL_DLL CPL_STDCALL GDALDeinitGCPs( int, GDAL_GCP * );
void  GDALDeinitGCPs(int , GDAL_GCP *);
//C     GDAL_GCP CPL_DLL * CPL_STDCALL GDALDuplicateGCPs( int, const GDAL_GCP * );
GDAL_GCP * GDALDuplicateGCPs(int , GDAL_GCP *);

//C     int CPL_DLL CPL_STDCALL
//C     GDALGCPsToGeoTransform( int nGCPCount, const GDAL_GCP *pasGCPs,
//C                             double *padfGeoTransform, int bApproxOK )  CPL_WARN_UNUSED_RESULT;
int  GDALGCPsToGeoTransform(int nGCPCount, GDAL_GCP *pasGCPs, double *padfGeoTransform, int bApproxOK);
//C     int CPL_DLL CPL_STDCALL
//C     GDALInvGeoTransform( double *padfGeoTransformIn,
//C                          double *padfInvGeoTransformOut ) CPL_WARN_UNUSED_RESULT;
int  GDALInvGeoTransform(double *padfGeoTransformIn, double *padfInvGeoTransformOut);
//C     void CPL_DLL CPL_STDCALL GDALApplyGeoTransform( double *, double, double,
//C                                                     double *, double * );
void  GDALApplyGeoTransform(double *, double , double , double *, double *);
//C     void CPL_DLL GDALComposeGeoTransforms(const double *padfGeoTransform1,
//C                                           const double *padfGeoTransform2,
//C                                           double *padfGeoTransformOut);
extern (C):
void  GDALComposeGeoTransforms(double *padfGeoTransform1, double *padfGeoTransform2, double *padfGeoTransformOut);

/* ==================================================================== */
/*      major objects (dataset, and, driver, drivermanager).            */
/* ==================================================================== */

//C     char CPL_DLL  ** CPL_STDCALL GDALGetMetadataDomainList( GDALMajorObjectH hObject );
extern (Windows):
char ** GDALGetMetadataDomainList(GDALMajorObjectH hObject);
//C     char CPL_DLL  ** CPL_STDCALL GDALGetMetadata( GDALMajorObjectH, const char * );
char ** GDALGetMetadata(GDALMajorObjectH , char *);
//C     CPLErr CPL_DLL CPL_STDCALL GDALSetMetadata( GDALMajorObjectH, char **,
//C                                                 const char * );
CPLErr  GDALSetMetadata(GDALMajorObjectH , char **, char *);
//C     const char CPL_DLL * CPL_STDCALL
//C     GDALGetMetadataItem( GDALMajorObjectH, const char *, const char * );
char * GDALGetMetadataItem(GDALMajorObjectH , char *, char *);
//C     CPLErr CPL_DLL CPL_STDCALL
//C     GDALSetMetadataItem( GDALMajorObjectH, const char *, const char *,
//C                          const char * );
CPLErr  GDALSetMetadataItem(GDALMajorObjectH , char *, char *, char *);
//C     const char CPL_DLL * CPL_STDCALL GDALGetDescription( GDALMajorObjectH );
char * GDALGetDescription(GDALMajorObjectH );
//C     void CPL_DLL CPL_STDCALL GDALSetDescription( GDALMajorObjectH, const char * );
void  GDALSetDescription(GDALMajorObjectH , char *);

/* ==================================================================== */
/*      GDALDataset class ... normally this represents one file.        */
/* ==================================================================== */

//C     #define GDAL_DS_LAYER_CREATIONOPTIONLIST "DS_LAYER_CREATIONOPTIONLIST"

//C     GDALDriverH CPL_DLL CPL_STDCALL GDALGetDatasetDriver( GDALDatasetH );
GDALDriverH  GDALGetDatasetDriver(GDALDatasetH );
//C     char CPL_DLL ** CPL_STDCALL GDALGetFileList( GDALDatasetH );
char ** GDALGetFileList(GDALDatasetH );
//C     void CPL_DLL CPL_STDCALL   GDALClose( GDALDatasetH );
void  GDALClose(GDALDatasetH );
//C     int CPL_DLL CPL_STDCALL     GDALGetRasterXSize( GDALDatasetH );
int  GDALGetRasterXSize(GDALDatasetH );
//C     int CPL_DLL CPL_STDCALL     GDALGetRasterYSize( GDALDatasetH );
int  GDALGetRasterYSize(GDALDatasetH );
//C     int CPL_DLL CPL_STDCALL     GDALGetRasterCount( GDALDatasetH );
int  GDALGetRasterCount(GDALDatasetH );
//C     GDALRasterBandH CPL_DLL CPL_STDCALL GDALGetRasterBand( GDALDatasetH, int );
GDALRasterBandH  GDALGetRasterBand(GDALDatasetH , int );

//C     CPLErr CPL_DLL  CPL_STDCALL GDALAddBand( GDALDatasetH hDS, GDALDataType eType,
//C                                  char **papszOptions );
CPLErr  GDALAddBand(GDALDatasetH hDS, GDALDataType eType, char **papszOptions);

//C     GDALAsyncReaderH CPL_DLL CPL_STDCALL
//C     GDALBeginAsyncReader(GDALDatasetH hDS, int nXOff, int nYOff,
//C                          int nXSize, int nYSize,
//C                          void *pBuf, int nBufXSize, int nBufYSize,
//C                          GDALDataType eBufType, int nBandCount, int* panBandMap,
//C                          int nPixelSpace, int nLineSpace, int nBandSpace,
//C                          char **papszOptions) CPL_WARN_UNUSED_RESULT;
GDALAsyncReaderH  GDALBeginAsyncReader(GDALDatasetH hDS, int nXOff, int nYOff, int nXSize, int nYSize, void *pBuf, int nBufXSize, int nBufYSize, GDALDataType eBufType, int nBandCount, int *panBandMap, int nPixelSpace, int nLineSpace, int nBandSpace, char **papszOptions);

//C     void  CPL_DLL CPL_STDCALL
//C     GDALEndAsyncReader(GDALDatasetH hDS, GDALAsyncReaderH hAsynchReaderH);
void  GDALEndAsyncReader(GDALDatasetH hDS, GDALAsyncReaderH hAsynchReaderH);

//C     CPLErr CPL_DLL CPL_STDCALL GDALDatasetRasterIO(
//C         GDALDatasetH hDS, GDALRWFlag eRWFlag,
//C         int nDSXOff, int nDSYOff, int nDSXSize, int nDSYSize,
//C         void * pBuffer, int nBXSize, int nBYSize, GDALDataType eBDataType,
//C         int nBandCount, int *panBandCount,
//C         int nPixelSpace, int nLineSpace, int nBandSpace) CPL_WARN_UNUSED_RESULT;
CPLErr  GDALDatasetRasterIO(GDALDatasetH hDS, GDALRWFlag eRWFlag, int nDSXOff, int nDSYOff, int nDSXSize, int nDSYSize, void *pBuffer, int nBXSize, int nBYSize, GDALDataType eBDataType, int nBandCount, int *panBandCount, int nPixelSpace, int nLineSpace, int nBandSpace);

//C     CPLErr CPL_DLL CPL_STDCALL GDALDatasetRasterIOEx(
//C         GDALDatasetH hDS, GDALRWFlag eRWFlag,
//C         int nDSXOff, int nDSYOff, int nDSXSize, int nDSYSize,
//C         void * pBuffer, int nBXSize, int nBYSize, GDALDataType eBDataType,
//C         int nBandCount, int *panBandCount,
//C         GSpacing nPixelSpace, GSpacing nLineSpace, GSpacing nBandSpace,
//C         GDALRasterIOExtraArg* psExtraArg) CPL_WARN_UNUSED_RESULT;
CPLErr  GDALDatasetRasterIOEx(GDALDatasetH hDS, GDALRWFlag eRWFlag, int nDSXOff, int nDSYOff, int nDSXSize, int nDSYSize, void *pBuffer, int nBXSize, int nBYSize, GDALDataType eBDataType, int nBandCount, int *panBandCount, GSpacing nPixelSpace, GSpacing nLineSpace, GSpacing nBandSpace, GDALRasterIOExtraArg *psExtraArg);

//C     CPLErr CPL_DLL CPL_STDCALL GDALDatasetAdviseRead( GDALDatasetH hDS,
//C         int nDSXOff, int nDSYOff, int nDSXSize, int nDSYSize,
//C         int nBXSize, int nBYSize, GDALDataType eBDataType,
//C         int nBandCount, int *panBandCount, char **papszOptions );
CPLErr  GDALDatasetAdviseRead(GDALDatasetH hDS, int nDSXOff, int nDSYOff, int nDSXSize, int nDSYSize, int nBXSize, int nBYSize, GDALDataType eBDataType, int nBandCount, int *panBandCount, char **papszOptions);

//C     const char CPL_DLL * CPL_STDCALL GDALGetProjectionRef( GDALDatasetH );
char * GDALGetProjectionRef(GDALDatasetH );
//C     CPLErr CPL_DLL CPL_STDCALL GDALSetProjection( GDALDatasetH, const char * );
CPLErr  GDALSetProjection(GDALDatasetH , char *);
//C     CPLErr CPL_DLL CPL_STDCALL GDALGetGeoTransform( GDALDatasetH, double * );
CPLErr  GDALGetGeoTransform(GDALDatasetH , double *);
//C     CPLErr CPL_DLL CPL_STDCALL GDALSetGeoTransform( GDALDatasetH, double * );
CPLErr  GDALSetGeoTransform(GDALDatasetH , double *);

//C     int CPL_DLL CPL_STDCALL  GDALGetGCPCount( GDALDatasetH );
int  GDALGetGCPCount(GDALDatasetH );
//C     const char CPL_DLL * CPL_STDCALL GDALGetGCPProjection( GDALDatasetH );
char * GDALGetGCPProjection(GDALDatasetH );
//C     const GDAL_GCP CPL_DLL * CPL_STDCALL GDALGetGCPs( GDALDatasetH );
GDAL_GCP * GDALGetGCPs(GDALDatasetH );
//C     CPLErr CPL_DLL CPL_STDCALL GDALSetGCPs( GDALDatasetH, int, const GDAL_GCP *,
//C                                             const char * );
CPLErr  GDALSetGCPs(GDALDatasetH , int , GDAL_GCP *, char *);

//C     void CPL_DLL * CPL_STDCALL GDALGetInternalHandle( GDALDatasetH, const char * );
void * GDALGetInternalHandle(GDALDatasetH , char *);
//C     int CPL_DLL CPL_STDCALL GDALReferenceDataset( GDALDatasetH );
int  GDALReferenceDataset(GDALDatasetH );
//C     int CPL_DLL CPL_STDCALL GDALDereferenceDataset( GDALDatasetH );
int  GDALDereferenceDataset(GDALDatasetH );

//C     CPLErr CPL_DLL CPL_STDCALL
//C     GDALBuildOverviews( GDALDatasetH, const char *, int, int *,
//C                         int, int *, GDALProgressFunc, void * ) CPL_WARN_UNUSED_RESULT;
CPLErr  GDALBuildOverviews(GDALDatasetH , char *, int , int *, int , int *, GDALProgressFunc , void *);
//C     void CPL_DLL CPL_STDCALL GDALGetOpenDatasets( GDALDatasetH **hDS, int *pnCount );
void  GDALGetOpenDatasets(GDALDatasetH **hDS, int *pnCount);
//C     int CPL_DLL CPL_STDCALL GDALGetAccess( GDALDatasetH hDS );
int  GDALGetAccess(GDALDatasetH hDS);
//C     void CPL_DLL CPL_STDCALL GDALFlushCache( GDALDatasetH hDS );
void  GDALFlushCache(GDALDatasetH hDS);

//C     CPLErr CPL_DLL CPL_STDCALL
//C                   GDALCreateDatasetMaskBand( GDALDatasetH hDS, int nFlags );
CPLErr  GDALCreateDatasetMaskBand(GDALDatasetH hDS, int nFlags);

//C     CPLErr CPL_DLL CPL_STDCALL GDALDatasetCopyWholeRaster(
//C         GDALDatasetH hSrcDS, GDALDatasetH hDstDS, char **papszOptions,
//C         GDALProgressFunc pfnProgress, void *pProgressData ) CPL_WARN_UNUSED_RESULT;
CPLErr  GDALDatasetCopyWholeRaster(GDALDatasetH hSrcDS, GDALDatasetH hDstDS, char **papszOptions, GDALProgressFunc pfnProgress, void *pProgressData);

//C     CPLErr CPL_DLL CPL_STDCALL GDALRasterBandCopyWholeRaster(
//C         GDALRasterBandH hSrcBand, GDALRasterBandH hDstBand, char **papszOptions,
//C         GDALProgressFunc pfnProgress, void *pProgressData ) CPL_WARN_UNUSED_RESULT;
CPLErr  GDALRasterBandCopyWholeRaster(GDALRasterBandH hSrcBand, GDALRasterBandH hDstBand, char **papszOptions, GDALProgressFunc pfnProgress, void *pProgressData);

//C     CPLErr CPL_DLL
//C     GDALRegenerateOverviews( GDALRasterBandH hSrcBand,
//C                              int nOverviewCount, GDALRasterBandH *pahOverviewBands,
//C                              const char *pszResampling,
//C                              GDALProgressFunc pfnProgress, void *pProgressData );
extern (C):
CPLErr  GDALRegenerateOverviews(GDALRasterBandH hSrcBand, int nOverviewCount, GDALRasterBandH *pahOverviewBands, char *pszResampling, GDALProgressFunc pfnProgress, void *pProgressData);

//C     int    CPL_DLL GDALDatasetGetLayerCount( GDALDatasetH );
int  GDALDatasetGetLayerCount(GDALDatasetH );
//C     OGRLayerH CPL_DLL GDALDatasetGetLayer( GDALDatasetH, int );
OGRLayerH  GDALDatasetGetLayer(GDALDatasetH , int );
//C     OGRLayerH CPL_DLL GDALDatasetGetLayerByName( GDALDatasetH, const char * );
OGRLayerH  GDALDatasetGetLayerByName(GDALDatasetH , char *);
//C     OGRErr    CPL_DLL GDALDatasetDeleteLayer( GDALDatasetH, int );
OGRErr  GDALDatasetDeleteLayer(GDALDatasetH , int );
//C     OGRLayerH CPL_DLL GDALDatasetCreateLayer( GDALDatasetH, const char *,
//C                                           OGRSpatialReferenceH, OGRwkbGeometryType,
//C                                           char ** );
OGRLayerH  GDALDatasetCreateLayer(GDALDatasetH , char *, OGRSpatialReferenceH , OGRwkbGeometryType , char **);
//C     OGRLayerH CPL_DLL GDALDatasetCopyLayer( GDALDatasetH, OGRLayerH, const char *,
//C                                             char ** );
OGRLayerH  GDALDatasetCopyLayer(GDALDatasetH , OGRLayerH , char *, char **);
//C     int    CPL_DLL GDALDatasetTestCapability( GDALDatasetH, const char * );
int  GDALDatasetTestCapability(GDALDatasetH , char *);
//C     OGRLayerH CPL_DLL GDALDatasetExecuteSQL( GDALDatasetH, const char *,
//C                                          OGRGeometryH, const char * );
OGRLayerH  GDALDatasetExecuteSQL(GDALDatasetH , char *, OGRGeometryH , char *);
//C     void   CPL_DLL GDALDatasetReleaseResultSet( GDALDatasetH, OGRLayerH );
void  GDALDatasetReleaseResultSet(GDALDatasetH , OGRLayerH );
//C     OGRStyleTableH CPL_DLL GDALDatasetGetStyleTable( GDALDatasetH );
OGRStyleTableH  GDALDatasetGetStyleTable(GDALDatasetH );
//C     void   CPL_DLL GDALDatasetSetStyleTableDirectly( GDALDatasetH, OGRStyleTableH );
void  GDALDatasetSetStyleTableDirectly(GDALDatasetH , OGRStyleTableH );
//C     void   CPL_DLL GDALDatasetSetStyleTable( GDALDatasetH, OGRStyleTableH );
void  GDALDatasetSetStyleTable(GDALDatasetH , OGRStyleTableH );
//C     OGRErr CPL_DLL GDALDatasetStartTransaction(GDALDatasetH hDS, int bForce);
OGRErr  GDALDatasetStartTransaction(GDALDatasetH hDS, int bForce);
//C     OGRErr CPL_DLL GDALDatasetCommitTransaction(GDALDatasetH hDS);
OGRErr  GDALDatasetCommitTransaction(GDALDatasetH hDS);
//C     OGRErr CPL_DLL GDALDatasetRollbackTransaction(GDALDatasetH hDS);
OGRErr  GDALDatasetRollbackTransaction(GDALDatasetH hDS);


/* ==================================================================== */
/*      GDALRasterBand ... one band/channel in a dataset.               */
/* ==================================================================== */

/**
 * SRCVAL - Macro which may be used by pixel functions to obtain
 *          a pixel from a source buffer.
 */
//C     #define SRCVAL(papoSource, eSrcType, ii)       (eSrcType == GDT_Byte ?           ((GByte *)papoSource)[ii] :       (eSrcType == GDT_Float32 ?           ((float *)papoSource)[ii] :       (eSrcType == GDT_Float64 ?           ((double *)papoSource)[ii] :       (eSrcType == GDT_Int32 ?           ((GInt32 *)papoSource)[ii] :       (eSrcType == GDT_UInt16 ?           ((GUInt16 *)papoSource)[ii] :       (eSrcType == GDT_Int16 ?           ((GInt16 *)papoSource)[ii] :       (eSrcType == GDT_UInt32 ?           ((GUInt32 *)papoSource)[ii] :       (eSrcType == GDT_CInt16 ?           ((GInt16 *)papoSource)[ii * 2] :       (eSrcType == GDT_CInt32 ?           ((GInt32 *)papoSource)[ii * 2] :       (eSrcType == GDT_CFloat32 ?           ((float *)papoSource)[ii * 2] :       (eSrcType == GDT_CFloat64 ?           ((double *)papoSource)[ii * 2] : 0)))))))))))

//C     typedef CPLErr
//C     (*GDALDerivedPixelFunc)(void **papoSources, int nSources, void *pData,
//C     			int nBufXSize, int nBufYSize,
//C     			GDALDataType eSrcType, GDALDataType eBufType,
//C                             int nPixelSpace, int nLineSpace);
alias CPLErr  function(void **papoSources, int nSources, void *pData, int nBufXSize, int nBufYSize, GDALDataType eSrcType, GDALDataType eBufType, int nPixelSpace, int nLineSpace)GDALDerivedPixelFunc;

//C     GDALDataType CPL_DLL CPL_STDCALL GDALGetRasterDataType( GDALRasterBandH );
extern (Windows):
GDALDataType  GDALGetRasterDataType(GDALRasterBandH );
//C     void CPL_DLL CPL_STDCALL
//C     GDALGetBlockSize( GDALRasterBandH, int * pnXSize, int * pnYSize );
void  GDALGetBlockSize(GDALRasterBandH , int *pnXSize, int *pnYSize);

//C     CPLErr CPL_DLL CPL_STDCALL GDALRasterAdviseRead( GDALRasterBandH hRB,
//C         int nDSXOff, int nDSYOff, int nDSXSize, int nDSYSize,
//C         int nBXSize, int nBYSize, GDALDataType eBDataType, char **papszOptions );
CPLErr  GDALRasterAdviseRead(GDALRasterBandH hRB, int nDSXOff, int nDSYOff, int nDSXSize, int nDSYSize, int nBXSize, int nBYSize, GDALDataType eBDataType, char **papszOptions);

//C     CPLErr CPL_DLL CPL_STDCALL
//C     GDALRasterIO( GDALRasterBandH hRBand, GDALRWFlag eRWFlag,
//C                   int nDSXOff, int nDSYOff, int nDSXSize, int nDSYSize,
//C                   void * pBuffer, int nBXSize, int nBYSize,GDALDataType eBDataType,
//C                   int nPixelSpace, int nLineSpace ) CPL_WARN_UNUSED_RESULT;
CPLErr  GDALRasterIO(GDALRasterBandH hRBand, GDALRWFlag eRWFlag, int nDSXOff, int nDSYOff, int nDSXSize, int nDSYSize, void *pBuffer, int nBXSize, int nBYSize, GDALDataType eBDataType, int nPixelSpace, int nLineSpace);
//C     CPLErr CPL_DLL CPL_STDCALL
//C     GDALRasterIOEx( GDALRasterBandH hRBand, GDALRWFlag eRWFlag,
//C                   int nDSXOff, int nDSYOff, int nDSXSize, int nDSYSize,
//C                   void * pBuffer, int nBXSize, int nBYSize,GDALDataType eBDataType,
//C                   GSpacing nPixelSpace, GSpacing nLineSpace,
//C                   GDALRasterIOExtraArg* psExtraArg ) CPL_WARN_UNUSED_RESULT;
CPLErr  GDALRasterIOEx(GDALRasterBandH hRBand, GDALRWFlag eRWFlag, int nDSXOff, int nDSYOff, int nDSXSize, int nDSYSize, void *pBuffer, int nBXSize, int nBYSize, GDALDataType eBDataType, GSpacing nPixelSpace, GSpacing nLineSpace, GDALRasterIOExtraArg *psExtraArg);
//C     CPLErr CPL_DLL CPL_STDCALL GDALReadBlock( GDALRasterBandH, int, int, void * ) CPL_WARN_UNUSED_RESULT;
CPLErr  GDALReadBlock(GDALRasterBandH , int , int , void *);
//C     CPLErr CPL_DLL CPL_STDCALL GDALWriteBlock( GDALRasterBandH, int, int, void * ) CPL_WARN_UNUSED_RESULT;
CPLErr  GDALWriteBlock(GDALRasterBandH , int , int , void *);
//C     int CPL_DLL CPL_STDCALL GDALGetRasterBandXSize( GDALRasterBandH );
int  GDALGetRasterBandXSize(GDALRasterBandH );
//C     int CPL_DLL CPL_STDCALL GDALGetRasterBandYSize( GDALRasterBandH );
int  GDALGetRasterBandYSize(GDALRasterBandH );
//C     GDALAccess CPL_DLL CPL_STDCALL GDALGetRasterAccess( GDALRasterBandH );
GDALAccess  GDALGetRasterAccess(GDALRasterBandH );
//C     int CPL_DLL CPL_STDCALL GDALGetBandNumber( GDALRasterBandH );
int  GDALGetBandNumber(GDALRasterBandH );
//C     GDALDatasetH CPL_DLL CPL_STDCALL GDALGetBandDataset( GDALRasterBandH );
GDALDatasetH  GDALGetBandDataset(GDALRasterBandH );

//C     GDALColorInterp CPL_DLL CPL_STDCALL
//C     GDALGetRasterColorInterpretation( GDALRasterBandH );
GDALColorInterp  GDALGetRasterColorInterpretation(GDALRasterBandH );
//C     CPLErr CPL_DLL CPL_STDCALL
//C     GDALSetRasterColorInterpretation( GDALRasterBandH, GDALColorInterp );
CPLErr  GDALSetRasterColorInterpretation(GDALRasterBandH , GDALColorInterp );
//C     GDALColorTableH CPL_DLL CPL_STDCALL GDALGetRasterColorTable( GDALRasterBandH );
GDALColorTableH  GDALGetRasterColorTable(GDALRasterBandH );
//C     CPLErr CPL_DLL CPL_STDCALL GDALSetRasterColorTable( GDALRasterBandH, GDALColorTableH );
CPLErr  GDALSetRasterColorTable(GDALRasterBandH , GDALColorTableH );
//C     int CPL_DLL CPL_STDCALL GDALHasArbitraryOverviews( GDALRasterBandH );
int  GDALHasArbitraryOverviews(GDALRasterBandH );
//C     int CPL_DLL CPL_STDCALL GDALGetOverviewCount( GDALRasterBandH );
int  GDALGetOverviewCount(GDALRasterBandH );
//C     GDALRasterBandH CPL_DLL CPL_STDCALL GDALGetOverview( GDALRasterBandH, int );
GDALRasterBandH  GDALGetOverview(GDALRasterBandH , int );
//C     double CPL_DLL CPL_STDCALL GDALGetRasterNoDataValue( GDALRasterBandH, int * );
double  GDALGetRasterNoDataValue(GDALRasterBandH , int *);
//C     CPLErr CPL_DLL CPL_STDCALL GDALSetRasterNoDataValue( GDALRasterBandH, double );
CPLErr  GDALSetRasterNoDataValue(GDALRasterBandH , double );
//C     CPLErr CPL_DLL CPL_STDCALL GDALDeleteRasterNoDataValue( GDALRasterBandH );
CPLErr  GDALDeleteRasterNoDataValue(GDALRasterBandH );
//C     char CPL_DLL ** CPL_STDCALL GDALGetRasterCategoryNames( GDALRasterBandH );
char ** GDALGetRasterCategoryNames(GDALRasterBandH );
//C     CPLErr CPL_DLL CPL_STDCALL GDALSetRasterCategoryNames( GDALRasterBandH, char ** );
CPLErr  GDALSetRasterCategoryNames(GDALRasterBandH , char **);
//C     double CPL_DLL CPL_STDCALL GDALGetRasterMinimum( GDALRasterBandH, int *pbSuccess );
double  GDALGetRasterMinimum(GDALRasterBandH , int *pbSuccess);
//C     double CPL_DLL CPL_STDCALL GDALGetRasterMaximum( GDALRasterBandH, int *pbSuccess );
double  GDALGetRasterMaximum(GDALRasterBandH , int *pbSuccess);
//C     CPLErr CPL_DLL CPL_STDCALL GDALGetRasterStatistics(
//C         GDALRasterBandH, int bApproxOK, int bForce,
//C         double *pdfMin, double *pdfMax, double *pdfMean, double *pdfStdDev );
CPLErr  GDALGetRasterStatistics(GDALRasterBandH , int bApproxOK, int bForce, double *pdfMin, double *pdfMax, double *pdfMean, double *pdfStdDev);
//C     CPLErr CPL_DLL CPL_STDCALL GDALComputeRasterStatistics(
//C         GDALRasterBandH, int bApproxOK,
//C         double *pdfMin, double *pdfMax, double *pdfMean, double *pdfStdDev,
//C         GDALProgressFunc pfnProgress, void *pProgressData );
CPLErr  GDALComputeRasterStatistics(GDALRasterBandH , int bApproxOK, double *pdfMin, double *pdfMax, double *pdfMean, double *pdfStdDev, GDALProgressFunc pfnProgress, void *pProgressData);
//C     CPLErr CPL_DLL CPL_STDCALL GDALSetRasterStatistics(
//C         GDALRasterBandH hBand,
//C         double dfMin, double dfMax, double dfMean, double dfStdDev );
CPLErr  GDALSetRasterStatistics(GDALRasterBandH hBand, double dfMin, double dfMax, double dfMean, double dfStdDev);

//C     const char CPL_DLL * CPL_STDCALL GDALGetRasterUnitType( GDALRasterBandH );
char * GDALGetRasterUnitType(GDALRasterBandH );
//C     CPLErr CPL_DLL CPL_STDCALL GDALSetRasterUnitType( GDALRasterBandH hBand, const char *pszNewValue );
CPLErr  GDALSetRasterUnitType(GDALRasterBandH hBand, char *pszNewValue);
//C     double CPL_DLL CPL_STDCALL GDALGetRasterOffset( GDALRasterBandH, int *pbSuccess );
double  GDALGetRasterOffset(GDALRasterBandH , int *pbSuccess);
//C     CPLErr CPL_DLL CPL_STDCALL GDALSetRasterOffset( GDALRasterBandH hBand, double dfNewOffset);
CPLErr  GDALSetRasterOffset(GDALRasterBandH hBand, double dfNewOffset);
//C     double CPL_DLL CPL_STDCALL GDALGetRasterScale( GDALRasterBandH, int *pbSuccess );
double  GDALGetRasterScale(GDALRasterBandH , int *pbSuccess);
//C     CPLErr CPL_DLL CPL_STDCALL GDALSetRasterScale( GDALRasterBandH hBand, double dfNewOffset );
CPLErr  GDALSetRasterScale(GDALRasterBandH hBand, double dfNewOffset);
//C     void CPL_DLL CPL_STDCALL
//C     GDALComputeRasterMinMax( GDALRasterBandH hBand, int bApproxOK,
//C                              double adfMinMax[2] );
void  GDALComputeRasterMinMax(GDALRasterBandH hBand, int bApproxOK, double *adfMinMax);
//C     CPLErr CPL_DLL CPL_STDCALL GDALFlushRasterCache( GDALRasterBandH hBand );
CPLErr  GDALFlushRasterCache(GDALRasterBandH hBand);
//C     CPLErr CPL_DLL CPL_STDCALL GDALGetRasterHistogram( GDALRasterBandH hBand,
//C                                            double dfMin, double dfMax,
//C                                            int nBuckets, int *panHistogram,
//C                                            int bIncludeOutOfRange, int bApproxOK,
//C                                            GDALProgressFunc pfnProgress,
//C                                            void * pProgressData ) CPL_WARN_DEPRECATED("Use GDALGetRasterHistogramEx() instead");
CPLErr  GDALGetRasterHistogram(GDALRasterBandH hBand, double dfMin, double dfMax, int nBuckets, int *panHistogram, int bIncludeOutOfRange, int bApproxOK, GDALProgressFunc pfnProgress, void *pProgressData);
//C     CPLErr CPL_DLL CPL_STDCALL GDALGetRasterHistogramEx( GDALRasterBandH hBand,
//C                                            double dfMin, double dfMax,
//C                                            int nBuckets, GUIntBig *panHistogram,
//C                                            int bIncludeOutOfRange, int bApproxOK,
//C                                            GDALProgressFunc pfnProgress,
//C                                            void * pProgressData );
CPLErr  GDALGetRasterHistogramEx(GDALRasterBandH hBand, double dfMin, double dfMax, int nBuckets, GUIntBig *panHistogram, int bIncludeOutOfRange, int bApproxOK, GDALProgressFunc pfnProgress, void *pProgressData);
//C     CPLErr CPL_DLL CPL_STDCALL GDALGetDefaultHistogram( GDALRasterBandH hBand,
//C                                            double *pdfMin, double *pdfMax,
//C                                            int *pnBuckets, int **ppanHistogram,
//C                                            int bForce,
//C                                            GDALProgressFunc pfnProgress,
//C                                            void * pProgressData ) CPL_WARN_DEPRECATED("Use GDALGetDefaultHistogramEx() instead");
CPLErr  GDALGetDefaultHistogram(GDALRasterBandH hBand, double *pdfMin, double *pdfMax, int *pnBuckets, int **ppanHistogram, int bForce, GDALProgressFunc pfnProgress, void *pProgressData);
//C     CPLErr CPL_DLL CPL_STDCALL GDALGetDefaultHistogramEx( GDALRasterBandH hBand,
//C                                            double *pdfMin, double *pdfMax,
//C                                            int *pnBuckets, GUIntBig **ppanHistogram,
//C                                            int bForce,
//C                                            GDALProgressFunc pfnProgress,
//C                                            void * pProgressData );
CPLErr  GDALGetDefaultHistogramEx(GDALRasterBandH hBand, double *pdfMin, double *pdfMax, int *pnBuckets, GUIntBig **ppanHistogram, int bForce, GDALProgressFunc pfnProgress, void *pProgressData);
//C     CPLErr CPL_DLL CPL_STDCALL GDALSetDefaultHistogram( GDALRasterBandH hBand,
//C                                            double dfMin, double dfMax,
//C                                            int nBuckets, int *panHistogram ) CPL_WARN_DEPRECATED("Use GDALSetDefaultHistogramEx() instead");
CPLErr  GDALSetDefaultHistogram(GDALRasterBandH hBand, double dfMin, double dfMax, int nBuckets, int *panHistogram);
//C     CPLErr CPL_DLL CPL_STDCALL GDALSetDefaultHistogramEx( GDALRasterBandH hBand,
//C                                            double dfMin, double dfMax,
//C                                            int nBuckets, GUIntBig *panHistogram );
CPLErr  GDALSetDefaultHistogramEx(GDALRasterBandH hBand, double dfMin, double dfMax, int nBuckets, GUIntBig *panHistogram);
//C     int CPL_DLL CPL_STDCALL
//C     GDALGetRandomRasterSample( GDALRasterBandH, int, float * );
int  GDALGetRandomRasterSample(GDALRasterBandH , int , float *);
//C     GDALRasterBandH CPL_DLL CPL_STDCALL
//C     GDALGetRasterSampleOverview( GDALRasterBandH, int );
GDALRasterBandH  GDALGetRasterSampleOverview(GDALRasterBandH , int );
//C     GDALRasterBandH CPL_DLL CPL_STDCALL
//C     GDALGetRasterSampleOverviewEx( GDALRasterBandH, GUIntBig );
GDALRasterBandH  GDALGetRasterSampleOverviewEx(GDALRasterBandH , GUIntBig );
//C     CPLErr CPL_DLL CPL_STDCALL GDALFillRaster( GDALRasterBandH hBand,
//C                               double dfRealValue, double dfImaginaryValue );
CPLErr  GDALFillRaster(GDALRasterBandH hBand, double dfRealValue, double dfImaginaryValue);
//C     CPLErr CPL_DLL CPL_STDCALL
//C     GDALComputeBandStats( GDALRasterBandH hBand, int nSampleStep,
//C                                  double *pdfMean, double *pdfStdDev,
//C                                  GDALProgressFunc pfnProgress,
//C                                  void *pProgressData );
CPLErr  GDALComputeBandStats(GDALRasterBandH hBand, int nSampleStep, double *pdfMean, double *pdfStdDev, GDALProgressFunc pfnProgress, void *pProgressData);
//C     CPLErr CPL_DLL  GDALOverviewMagnitudeCorrection( GDALRasterBandH hBaseBand,
//C                                             int nOverviewCount,
//C                                             GDALRasterBandH *pahOverviews,
//C                                             GDALProgressFunc pfnProgress,
//C                                             void *pProgressData );
extern (C):
CPLErr  GDALOverviewMagnitudeCorrection(GDALRasterBandH hBaseBand, int nOverviewCount, GDALRasterBandH *pahOverviews, GDALProgressFunc pfnProgress, void *pProgressData);

//C     GDALRasterAttributeTableH CPL_DLL CPL_STDCALL GDALGetDefaultRAT(
//C         GDALRasterBandH hBand );
extern (Windows):
GDALRasterAttributeTableH  GDALGetDefaultRAT(GDALRasterBandH hBand);
//C     CPLErr CPL_DLL CPL_STDCALL GDALSetDefaultRAT( GDALRasterBandH,
//C                                                   GDALRasterAttributeTableH );
CPLErr  GDALSetDefaultRAT(GDALRasterBandH , GDALRasterAttributeTableH );
//C     CPLErr CPL_DLL CPL_STDCALL GDALAddDerivedBandPixelFunc( const char *pszName,
//C                                         GDALDerivedPixelFunc pfnPixelFunc );
CPLErr  GDALAddDerivedBandPixelFunc(char *pszName, GDALDerivedPixelFunc pfnPixelFunc);

//C     GDALRasterBandH CPL_DLL CPL_STDCALL GDALGetMaskBand( GDALRasterBandH hBand );
GDALRasterBandH  GDALGetMaskBand(GDALRasterBandH hBand);
//C     int CPL_DLL CPL_STDCALL GDALGetMaskFlags( GDALRasterBandH hBand );
int  GDALGetMaskFlags(GDALRasterBandH hBand);
//C     CPLErr CPL_DLL CPL_STDCALL
//C                            GDALCreateMaskBand( GDALRasterBandH hBand, int nFlags );
CPLErr  GDALCreateMaskBand(GDALRasterBandH hBand, int nFlags);

//C     #define GMF_ALL_VALID     0x01
//C     #define GMF_PER_DATASET   0x02
const GMF_ALL_VALID = 0x01;
//C     #define GMF_ALPHA         0x04
const GMF_PER_DATASET = 0x02;
//C     #define GMF_NODATA        0x08
const GMF_ALPHA = 0x04;

const GMF_NODATA = 0x08;
/* ==================================================================== */
/*     GDALAsyncReader                                                  */
/* ==================================================================== */

//C     GDALAsyncStatusType CPL_DLL CPL_STDCALL
//C     GDALARGetNextUpdatedRegion(GDALAsyncReaderH hARIO, double dfTimeout,
//C                              int* pnXBufOff, int* pnYBufOff,
//C                              int* pnXBufSize, int* pnYBufSize );
GDALAsyncStatusType  GDALARGetNextUpdatedRegion(GDALAsyncReaderH hARIO, double dfTimeout, int *pnXBufOff, int *pnYBufOff, int *pnXBufSize, int *pnYBufSize);
//C     int CPL_DLL CPL_STDCALL GDALARLockBuffer(GDALAsyncReaderH hARIO,
//C                                             double dfTimeout);
int  GDALARLockBuffer(GDALAsyncReaderH hARIO, double dfTimeout);
//C     void CPL_DLL CPL_STDCALL GDALARUnlockBuffer(GDALAsyncReaderH hARIO);
void  GDALARUnlockBuffer(GDALAsyncReaderH hARIO);

/* -------------------------------------------------------------------- */
/*      Helper functions.                                               */
/* -------------------------------------------------------------------- */
//C     int CPL_DLL CPL_STDCALL GDALGeneralCmdLineProcessor( int nArgc, char ***ppapszArgv,
//C                                              int nOptions );
int  GDALGeneralCmdLineProcessor(int nArgc, char ***ppapszArgv, int nOptions);
//C     void CPL_DLL CPL_STDCALL GDALSwapWords( void *pData, int nWordSize, int nWordCount,
//C                                 int nWordSkip );
void  GDALSwapWords(void *pData, int nWordSize, int nWordCount, int nWordSkip);
//C     void CPL_DLL CPL_STDCALL GDALSwapWordsEx( void *pData, int nWordSize, size_t nWordCount,
//C                                       int nWordSkip );
void  GDALSwapWordsEx(void *pData, int nWordSize, size_t nWordCount, int nWordSkip);

//C     void CPL_DLL CPL_STDCALL
//C         GDALCopyWords( const void * pSrcData, GDALDataType eSrcType, int nSrcPixelOffset,
//C                        void * pDstData, GDALDataType eDstType, int nDstPixelOffset,
//C                        int nWordCount );
void  GDALCopyWords(void *pSrcData, GDALDataType eSrcType, int nSrcPixelOffset, void *pDstData, GDALDataType eDstType, int nDstPixelOffset, int nWordCount);

//C     void CPL_DLL
//C     GDALCopyBits( const GByte *pabySrcData, int nSrcOffset, int nSrcStep,
//C                   GByte *pabyDstData, int nDstOffset, int nDstStep,
//C                   int nBitCount, int nStepCount );
extern (C):
void  GDALCopyBits(GByte *pabySrcData, int nSrcOffset, int nSrcStep, GByte *pabyDstData, int nDstOffset, int nDstStep, int nBitCount, int nStepCount);

//C     int CPL_DLL CPL_STDCALL GDALLoadWorldFile( const char *, double * );
extern (Windows):
int  GDALLoadWorldFile(char *, double *);
//C     int CPL_DLL CPL_STDCALL GDALReadWorldFile( const char *, const char *,
//C                                                double * );
int  GDALReadWorldFile(char *, char *, double *);
//C     int CPL_DLL CPL_STDCALL GDALWriteWorldFile( const char *, const char *,
//C                                                 double * );
int  GDALWriteWorldFile(char *, char *, double *);
//C     int CPL_DLL CPL_STDCALL GDALLoadTabFile( const char *, double *, char **,
//C                                              int *, GDAL_GCP ** );
int  GDALLoadTabFile(char *, double *, char **, int *, GDAL_GCP **);
//C     int CPL_DLL CPL_STDCALL GDALReadTabFile( const char *, double *, char **,
//C                                              int *, GDAL_GCP ** );
int  GDALReadTabFile(char *, double *, char **, int *, GDAL_GCP **);
//C     int CPL_DLL CPL_STDCALL GDALLoadOziMapFile( const char *, double *, char **,
//C                                                 int *, GDAL_GCP ** );
int  GDALLoadOziMapFile(char *, double *, char **, int *, GDAL_GCP **);
//C     int CPL_DLL CPL_STDCALL GDALReadOziMapFile( const char *,  double *,
//C                                                 char **, int *, GDAL_GCP ** );
int  GDALReadOziMapFile(char *, double *, char **, int *, GDAL_GCP **);

//C     const char CPL_DLL * CPL_STDCALL GDALDecToDMS( double, const char *, int );
char * GDALDecToDMS(double , char *, int );
//C     double CPL_DLL CPL_STDCALL GDALPackedDMSToDec( double );
double  GDALPackedDMSToDec(double );
//C     double CPL_DLL CPL_STDCALL GDALDecToPackedDMS( double );
double  GDALDecToPackedDMS(double );

/* Note to developers : please keep this section in sync with ogr_core.h */

//C     #ifndef GDAL_VERSION_INFO_DEFINED
//C     #define GDAL_VERSION_INFO_DEFINED
//C     const char CPL_DLL * CPL_STDCALL GDALVersionInfo( const char * );
//C     #endif

//C     #ifndef GDAL_CHECK_VERSION

//C     int CPL_DLL CPL_STDCALL GDALCheckVersion( int nVersionMajor, int nVersionMinor,
//C                                               const char* pszCallingComponentName);

/** Helper macro for GDALCheckVersion()
  @see GDALCheckVersion()
  */
//C     #define GDAL_CHECK_VERSION(pszCallingComponentName)  GDALCheckVersion(GDAL_VERSION_MAJOR, GDAL_VERSION_MINOR, pszCallingComponentName)

//C     #endif

//C     typedef struct {
//C         double      dfLINE_OFF;
//C         double      dfSAMP_OFF;
//C         double      dfLAT_OFF;
//C         double      dfLONG_OFF;
//C         double      dfHEIGHT_OFF;

//C         double      dfLINE_SCALE;
//C         double      dfSAMP_SCALE;
//C         double      dfLAT_SCALE;
//C         double      dfLONG_SCALE;
//C         double      dfHEIGHT_SCALE;

//C         double      adfLINE_NUM_COEFF[20];
//C         double      adfLINE_DEN_COEFF[20];
//C         double      adfSAMP_NUM_COEFF[20];
//C         double      adfSAMP_DEN_COEFF[20];

//C         double	dfMIN_LONG;
//C         double      dfMIN_LAT;
//C         double      dfMAX_LONG;
//C         double	dfMAX_LAT;

//C     } GDALRPCInfo;
struct _N29
{
    double dfLINE_OFF;
    double dfSAMP_OFF;
    double dfLAT_OFF;
    double dfLONG_OFF;
    double dfHEIGHT_OFF;
    double dfLINE_SCALE;
    double dfSAMP_SCALE;
    double dfLAT_SCALE;
    double dfLONG_SCALE;
    double dfHEIGHT_SCALE;
    double [20]adfLINE_NUM_COEFF;
    double [20]adfLINE_DEN_COEFF;
    double [20]adfSAMP_NUM_COEFF;
    double [20]adfSAMP_DEN_COEFF;
    double dfMIN_LONG;
    double dfMIN_LAT;
    double dfMAX_LONG;
    double dfMAX_LAT;
}
extern (C):
alias _N29 GDALRPCInfo;

//C     int CPL_DLL CPL_STDCALL GDALExtractRPCInfo( char **, GDALRPCInfo * );
extern (Windows):
int  GDALExtractRPCInfo(char **, GDALRPCInfo *);

/* ==================================================================== */
/*      Color tables.                                                   */
/* ==================================================================== */

/** Color tuple */
//C     typedef struct
//C     {
    /*! gray, red, cyan or hue */
//C         short      c1;

    /*! green, magenta, or lightness */
//C         short      c2;

    /*! blue, yellow, or saturation */
//C         short      c3;

    /*! alpha or blackband */
//C         short      c4;
//C     } GDALColorEntry;
struct _N30
{
    short c1;
    short c2;
    short c3;
    short c4;
}
extern (C):
alias _N30 GDALColorEntry;

//C     GDALColorTableH CPL_DLL CPL_STDCALL GDALCreateColorTable( GDALPaletteInterp ) CPL_WARN_UNUSED_RESULT;
extern (Windows):
GDALColorTableH  GDALCreateColorTable(GDALPaletteInterp );
//C     void CPL_DLL CPL_STDCALL GDALDestroyColorTable( GDALColorTableH );
void  GDALDestroyColorTable(GDALColorTableH );
//C     GDALColorTableH CPL_DLL CPL_STDCALL GDALCloneColorTable( GDALColorTableH );
GDALColorTableH  GDALCloneColorTable(GDALColorTableH );
//C     GDALPaletteInterp CPL_DLL CPL_STDCALL GDALGetPaletteInterpretation( GDALColorTableH );
GDALPaletteInterp  GDALGetPaletteInterpretation(GDALColorTableH );
//C     int CPL_DLL CPL_STDCALL GDALGetColorEntryCount( GDALColorTableH );
int  GDALGetColorEntryCount(GDALColorTableH );
//C     const GDALColorEntry CPL_DLL * CPL_STDCALL GDALGetColorEntry( GDALColorTableH, int );
GDALColorEntry * GDALGetColorEntry(GDALColorTableH , int );
//C     int CPL_DLL CPL_STDCALL GDALGetColorEntryAsRGB( GDALColorTableH, int, GDALColorEntry *);
int  GDALGetColorEntryAsRGB(GDALColorTableH , int , GDALColorEntry *);
//C     void CPL_DLL CPL_STDCALL GDALSetColorEntry( GDALColorTableH, int, const GDALColorEntry * );
void  GDALSetColorEntry(GDALColorTableH , int , GDALColorEntry *);
//C     void CPL_DLL CPL_STDCALL GDALCreateColorRamp( GDALColorTableH hTable,
//C                 int nStartIndex, const GDALColorEntry *psStartColor,
//C                 int nEndIndex, const GDALColorEntry *psEndColor );
void  GDALCreateColorRamp(GDALColorTableH hTable, int nStartIndex, GDALColorEntry *psStartColor, int nEndIndex, GDALColorEntry *psEndColor);

/* ==================================================================== */
/*      Raster Attribute Table						*/
/* ==================================================================== */

/** Field type of raster attribute table */
//C     typedef enum {
    /*! Integer field */
//C     	   	   GFT_Integer,
    /*! Floating point (double) field */
//C        GFT_Real,
    /*! String field */
//C                         GFT_String
//C     } GDALRATFieldType;
enum
{
    GFT_Integer,
    GFT_Real,
    GFT_String,
}
extern (C):
alias int GDALRATFieldType;

/** Field usage of raster attribute table */
//C     typedef enum {
    /*! General purpose field. */
//C               GFU_Generic = 0,
    /*! Histogram pixel count */
//C                GFU_PixelCount = 1,
    /*! Class name */
//C                           GFU_Name = 2,
    /*! Class range minimum */
//C                  GFU_Min = 3,
    /*! Class range maximum */
//C                  GFU_Max = 4,
    /*! Class value (min=max) */
//C                GFU_MinMax = 5,
    /*! Red class color (0-255) */
//C              GFU_Red = 6,
    /*! Green class color (0-255) */
//C            GFU_Green = 7,
    /*! Blue class color (0-255) */
//C             GFU_Blue = 8,
    /*! Alpha (0=transparent,255=opaque)*/
//C      GFU_Alpha = 9,
    /*! Color Range Red Minimum */
//C              GFU_RedMin = 10,
    /*! Color Range Green Minimum */
//C            GFU_GreenMin = 11,
    /*! Color Range Blue Minimum */
//C             GFU_BlueMin = 12,
    /*! Color Range Alpha Minimum */
//C            GFU_AlphaMin = 13,
    /*! Color Range Red Maximum */
//C              GFU_RedMax = 14,
    /*! Color Range Green Maximum */
//C            GFU_GreenMax = 15,
    /*! Color Range Blue Maximum */
//C             GFU_BlueMax = 16,
    /*! Color Range Alpha Maximum */
//C            GFU_AlphaMax = 17,
    /*! Maximum GFU value */
//C                    GFU_MaxCount
//C     } GDALRATFieldUsage;
enum
{
    GFU_Generic,
    GFU_PixelCount,
    GFU_Name,
    GFU_Min,
    GFU_Max,
    GFU_MinMax,
    GFU_Red,
    GFU_Green,
    GFU_Blue,
    GFU_Alpha,
    GFU_RedMin,
    GFU_GreenMin,
    GFU_BlueMin,
    GFU_AlphaMin,
    GFU_RedMax,
    GFU_GreenMax,
    GFU_BlueMax,
    GFU_AlphaMax,
    GFU_MaxCount,
}
alias int GDALRATFieldUsage;

//C     GDALRasterAttributeTableH CPL_DLL CPL_STDCALL
//C                                                GDALCreateRasterAttributeTable(void) CPL_WARN_UNUSED_RESULT;
extern (Windows):
GDALRasterAttributeTableH  GDALCreateRasterAttributeTable();
//C     void CPL_DLL CPL_STDCALL GDALDestroyRasterAttributeTable(
//C         GDALRasterAttributeTableH );
void  GDALDestroyRasterAttributeTable(GDALRasterAttributeTableH );

//C     int CPL_DLL CPL_STDCALL GDALRATGetColumnCount( GDALRasterAttributeTableH );
int  GDALRATGetColumnCount(GDALRasterAttributeTableH );

//C     const char CPL_DLL * CPL_STDCALL GDALRATGetNameOfCol(
//C         GDALRasterAttributeTableH, int );
char * GDALRATGetNameOfCol(GDALRasterAttributeTableH , int );
//C     GDALRATFieldUsage CPL_DLL CPL_STDCALL GDALRATGetUsageOfCol(
//C         GDALRasterAttributeTableH, int );
GDALRATFieldUsage  GDALRATGetUsageOfCol(GDALRasterAttributeTableH , int );
//C     GDALRATFieldType CPL_DLL CPL_STDCALL GDALRATGetTypeOfCol(
//C         GDALRasterAttributeTableH, int );
GDALRATFieldType  GDALRATGetTypeOfCol(GDALRasterAttributeTableH , int );

//C     int CPL_DLL CPL_STDCALL GDALRATGetColOfUsage( GDALRasterAttributeTableH,
//C                                                   GDALRATFieldUsage );
int  GDALRATGetColOfUsage(GDALRasterAttributeTableH , GDALRATFieldUsage );
//C     int CPL_DLL CPL_STDCALL GDALRATGetRowCount( GDALRasterAttributeTableH );
int  GDALRATGetRowCount(GDALRasterAttributeTableH );

//C     const char CPL_DLL * CPL_STDCALL GDALRATGetValueAsString(
//C         GDALRasterAttributeTableH, int, int);
char * GDALRATGetValueAsString(GDALRasterAttributeTableH , int , int );
//C     int CPL_DLL CPL_STDCALL GDALRATGetValueAsInt(
//C         GDALRasterAttributeTableH, int, int);
int  GDALRATGetValueAsInt(GDALRasterAttributeTableH , int , int );
//C     double CPL_DLL CPL_STDCALL GDALRATGetValueAsDouble(
//C         GDALRasterAttributeTableH, int, int);
double  GDALRATGetValueAsDouble(GDALRasterAttributeTableH , int , int );

//C     void CPL_DLL CPL_STDCALL GDALRATSetValueAsString( GDALRasterAttributeTableH, int, int,
//C                                                       const char * );
void  GDALRATSetValueAsString(GDALRasterAttributeTableH , int , int , char *);
//C     void CPL_DLL CPL_STDCALL GDALRATSetValueAsInt( GDALRasterAttributeTableH, int, int,
//C                                                    int );
void  GDALRATSetValueAsInt(GDALRasterAttributeTableH , int , int , int );
//C     void CPL_DLL CPL_STDCALL GDALRATSetValueAsDouble( GDALRasterAttributeTableH, int, int,
//C                                                       double );
void  GDALRATSetValueAsDouble(GDALRasterAttributeTableH , int , int , double );

//C     int CPL_DLL CPL_STDCALL GDALRATChangesAreWrittenToFile( GDALRasterAttributeTableH hRAT );
int  GDALRATChangesAreWrittenToFile(GDALRasterAttributeTableH hRAT);

//C     CPLErr CPL_DLL CPL_STDCALL GDALRATValuesIOAsDouble( GDALRasterAttributeTableH hRAT, GDALRWFlag eRWFlag,
//C                                             int iField, int iStartRow, int iLength, double *pdfData );
CPLErr  GDALRATValuesIOAsDouble(GDALRasterAttributeTableH hRAT, GDALRWFlag eRWFlag, int iField, int iStartRow, int iLength, double *pdfData);
//C     CPLErr CPL_DLL CPL_STDCALL GDALRATValuesIOAsInteger( GDALRasterAttributeTableH hRAT, GDALRWFlag eRWFlag,
//C                                             int iField, int iStartRow, int iLength, int *pnData);
CPLErr  GDALRATValuesIOAsInteger(GDALRasterAttributeTableH hRAT, GDALRWFlag eRWFlag, int iField, int iStartRow, int iLength, int *pnData);
//C     CPLErr CPL_DLL CPL_STDCALL GDALRATValuesIOAsString( GDALRasterAttributeTableH hRAT, GDALRWFlag eRWFlag,
//C                                             int iField, int iStartRow, int iLength, char **papszStrList);
CPLErr  GDALRATValuesIOAsString(GDALRasterAttributeTableH hRAT, GDALRWFlag eRWFlag, int iField, int iStartRow, int iLength, char **papszStrList);

//C     void CPL_DLL CPL_STDCALL GDALRATSetRowCount( GDALRasterAttributeTableH,
//C                                                  int );
void  GDALRATSetRowCount(GDALRasterAttributeTableH , int );
//C     CPLErr CPL_DLL CPL_STDCALL GDALRATCreateColumn( GDALRasterAttributeTableH,
//C                                                     const char *,
//C                                                     GDALRATFieldType,
//C                                                     GDALRATFieldUsage );
CPLErr  GDALRATCreateColumn(GDALRasterAttributeTableH , char *, GDALRATFieldType , GDALRATFieldUsage );
//C     CPLErr CPL_DLL CPL_STDCALL GDALRATSetLinearBinning( GDALRasterAttributeTableH,
//C                                                         double, double );
CPLErr  GDALRATSetLinearBinning(GDALRasterAttributeTableH , double , double );
//C     int CPL_DLL CPL_STDCALL GDALRATGetLinearBinning( GDALRasterAttributeTableH,
//C                                                      double *, double * );
int  GDALRATGetLinearBinning(GDALRasterAttributeTableH , double *, double *);
//C     CPLErr CPL_DLL CPL_STDCALL GDALRATInitializeFromColorTable(
//C         GDALRasterAttributeTableH, GDALColorTableH );
CPLErr  GDALRATInitializeFromColorTable(GDALRasterAttributeTableH , GDALColorTableH );
//C     GDALColorTableH CPL_DLL CPL_STDCALL GDALRATTranslateToColorTable(
//C         GDALRasterAttributeTableH, int nEntryCount );
GDALColorTableH  GDALRATTranslateToColorTable(GDALRasterAttributeTableH , int nEntryCount);
//C     void CPL_DLL CPL_STDCALL GDALRATDumpReadable( GDALRasterAttributeTableH,
//C                                                   FILE * );
void  GDALRATDumpReadable(GDALRasterAttributeTableH , FILE *);
//C     GDALRasterAttributeTableH CPL_DLL CPL_STDCALL
//C         GDALRATClone( GDALRasterAttributeTableH );
GDALRasterAttributeTableH  GDALRATClone(GDALRasterAttributeTableH );

//C     void CPL_DLL* CPL_STDCALL
//C         GDALRATSerializeJSON( GDALRasterAttributeTableH ) CPL_WARN_UNUSED_RESULT;
void * GDALRATSerializeJSON(GDALRasterAttributeTableH );

//C     int CPL_DLL CPL_STDCALL GDALRATGetRowOfValue( GDALRasterAttributeTableH, double );
int  GDALRATGetRowOfValue(GDALRasterAttributeTableH , double );


/* ==================================================================== */
/*      GDAL Cache Management                                           */
/* ==================================================================== */

//C     void CPL_DLL CPL_STDCALL GDALSetCacheMax( int nBytes );
void  GDALSetCacheMax(int nBytes);
//C     int CPL_DLL CPL_STDCALL GDALGetCacheMax(void);
int  GDALGetCacheMax();
//C     int CPL_DLL CPL_STDCALL GDALGetCacheUsed(void);
int  GDALGetCacheUsed();
//C     void CPL_DLL CPL_STDCALL GDALSetCacheMax64( GIntBig nBytes );
void  GDALSetCacheMax64(GIntBig nBytes);
//C     GIntBig CPL_DLL CPL_STDCALL GDALGetCacheMax64(void);
GIntBig  GDALGetCacheMax64();
//C     GIntBig CPL_DLL CPL_STDCALL GDALGetCacheUsed64(void);
GIntBig  GDALGetCacheUsed64();

//C     int CPL_DLL CPL_STDCALL GDALFlushCacheBlock(void);
int  GDALFlushCacheBlock();

/* ==================================================================== */
/*      GDAL virtual memory                                             */
/* ==================================================================== */

//C     CPLVirtualMem CPL_DLL* GDALDatasetGetVirtualMem( GDALDatasetH hDS,
//C                                                      GDALRWFlag eRWFlag,
//C                                                      int nXOff, int nYOff,
//C                                                      int nXSize, int nYSize,
//C                                                      int nBufXSize, int nBufYSize,
//C                                                      GDALDataType eBufType,
//C                                                      int nBandCount, int* panBandMap,
//C                                                      int nPixelSpace,
//C                                                      GIntBig nLineSpace,
//C                                                      GIntBig nBandSpace,
//C                                                      size_t nCacheSize,
//C                                                      size_t nPageSizeHint,
//C                                                      int bSingleThreadUsage,
//C                                                      char **papszOptions ) CPL_WARN_UNUSED_RESULT;
extern (C):
CPLVirtualMem * GDALDatasetGetVirtualMem(GDALDatasetH hDS, GDALRWFlag eRWFlag, int nXOff, int nYOff, int nXSize, int nYSize, int nBufXSize, int nBufYSize, GDALDataType eBufType, int nBandCount, int *panBandMap, int nPixelSpace, GIntBig nLineSpace, GIntBig nBandSpace, size_t nCacheSize, size_t nPageSizeHint, int bSingleThreadUsage, char **papszOptions);

//C     CPLVirtualMem CPL_DLL* GDALRasterBandGetVirtualMem( GDALRasterBandH hBand,
//C                                              GDALRWFlag eRWFlag,
//C                                              int nXOff, int nYOff,
//C                                              int nXSize, int nYSize,
//C                                              int nBufXSize, int nBufYSize,
//C                                              GDALDataType eBufType,
//C                                              int nPixelSpace,
//C                                              GIntBig nLineSpace,
//C                                              size_t nCacheSize,
//C                                              size_t nPageSizeHint,
//C                                              int bSingleThreadUsage,
//C                                              char **papszOptions ) CPL_WARN_UNUSED_RESULT;
CPLVirtualMem * GDALRasterBandGetVirtualMem(GDALRasterBandH hBand, GDALRWFlag eRWFlag, int nXOff, int nYOff, int nXSize, int nYSize, int nBufXSize, int nBufYSize, GDALDataType eBufType, int nPixelSpace, GIntBig nLineSpace, size_t nCacheSize, size_t nPageSizeHint, int bSingleThreadUsage, char **papszOptions);

//C     CPLVirtualMem CPL_DLL* GDALGetVirtualMemAuto( GDALRasterBandH hBand,
//C                                                   GDALRWFlag eRWFlag,
//C                                                   int *pnPixelSpace,
//C                                                   GIntBig *pnLineSpace,
//C                                                   char **papszOptions ) CPL_WARN_UNUSED_RESULT;
CPLVirtualMem * GDALGetVirtualMemAuto(GDALRasterBandH hBand, GDALRWFlag eRWFlag, int *pnPixelSpace, GIntBig *pnLineSpace, char **papszOptions);

//C     typedef enum
//C     {
    /*! Tile Interleaved by Pixel: tile (0,0) with internal band interleaved by pixel organization, tile (1, 0), ...  */
//C         GTO_TIP,
    /*! Band Interleaved by Tile : tile (0,0) of first band, tile (0,0) of second band, ... tile (1,0) of first band, tile (1,0) of second band, ... */
//C         GTO_BIT,
    /*! Band SeQuential : all the tiles of first band, all the tiles of following band... */
//C         GTO_BSQ
//C     } GDALTileOrganization;
enum
{
    GTO_TIP,
    GTO_BIT,
    GTO_BSQ,
}
alias int GDALTileOrganization;

//C     CPLVirtualMem CPL_DLL* GDALDatasetGetTiledVirtualMem( GDALDatasetH hDS,
//C                                                           GDALRWFlag eRWFlag,
//C                                                           int nXOff, int nYOff,
//C                                                           int nXSize, int nYSize,
//C                                                           int nTileXSize, int nTileYSize,
//C                                                           GDALDataType eBufType,
//C                                                           int nBandCount, int* panBandMap,
//C                                                           GDALTileOrganization eTileOrganization,
//C                                                           size_t nCacheSize,
//C                                                           int bSingleThreadUsage,
//C                                                           char **papszOptions ) CPL_WARN_UNUSED_RESULT;
CPLVirtualMem * GDALDatasetGetTiledVirtualMem(GDALDatasetH hDS, GDALRWFlag eRWFlag, int nXOff, int nYOff, int nXSize, int nYSize, int nTileXSize, int nTileYSize, GDALDataType eBufType, int nBandCount, int *panBandMap, GDALTileOrganization eTileOrganization, size_t nCacheSize, int bSingleThreadUsage, char **papszOptions);

//C     CPLVirtualMem CPL_DLL* GDALRasterBandGetTiledVirtualMem( GDALRasterBandH hBand,
//C                                                              GDALRWFlag eRWFlag,
//C                                                              int nXOff, int nYOff,
//C                                                              int nXSize, int nYSize,
//C                                                              int nTileXSize, int nTileYSize,
//C                                                              GDALDataType eBufType,
//C                                                              size_t nCacheSize,
//C                                                              int bSingleThreadUsage,
//C                                                              char **papszOptions ) CPL_WARN_UNUSED_RESULT;
CPLVirtualMem * GDALRasterBandGetTiledVirtualMem(GDALRasterBandH hBand, GDALRWFlag eRWFlag, int nXOff, int nYOff, int nXSize, int nYSize, int nTileXSize, int nTileYSize, GDALDataType eBufType, size_t nCacheSize, int bSingleThreadUsage, char **papszOptions);

/* ==================================================================== */
/*      VRTPansharpenedDataset class.                                   */
/* ==================================================================== */

//C     GDALDatasetH CPL_DLL GDALCreatePansharpenedVRT( const char* pszXML,
//C                                                 GDALRasterBandH hPanchroBand,
//C                                                 int nInputSpectralBands,
//C                                                 GDALRasterBandH* pahInputSpectralBands ) CPL_WARN_UNUSED_RESULT;
GDALDatasetH  GDALCreatePansharpenedVRT(char *pszXML, GDALRasterBandH hPanchroBand, int nInputSpectralBands, GDALRasterBandH *pahInputSpectralBands);

/* =================================================================== */
/*      Misc API                                                        */
/* ==================================================================== */

//C     CPLXMLNode CPL_DLL* GDALGetJPEG2000Structure(const char* pszFilename,
//C                                                  char** papszOptions) CPL_WARN_UNUSED_RESULT;
CPLXMLNode * GDALGetJPEG2000Structure(char *pszFilename, char **papszOptions);

//C     CPL_C_END

//C     #endif /* ndef GDAL_H_INCLUDED */
