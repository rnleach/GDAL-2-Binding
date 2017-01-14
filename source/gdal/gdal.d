/* Converted to D from C:/devLibs/gdal21/include/gdal.h by htod */
module gdal.gdal;
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

/**
 * \file gdal.h
 *
 * Public (C callable) GDAL entry points.
 */
import gdal.gdalversion;
import gdal.cpl.port;
import gdal.cpl.error;
import gdal.cpl.progress;
// not needed import gdal.cplvirtualmem;
import gdal.cpl.minixml;
import gdal.ogr.api;
import gdal.ogr.core;

import core.stdc.stdio : FILE;

/* -------------------------------------------------------------------- */
/*      Significant constants.                                          */
/* -------------------------------------------------------------------- */
/*! Pixel data types */
enum
{
    GDT_Unknown,   /*! Unknown or unspecified type     */
    GDT_Byte,      /*! Eight bit unsigned integer      */
    GDT_UInt16,    /*! Sixteen bit unsigned integer    */
    GDT_Int16,     /*! Sixteen bit signed integer      */
    GDT_UInt32,    /*! Thirty two bit unsigned integer */
    GDT_Int32,     /*! Thirty two bit signed integer   */
    GDT_Float32,   /*! Thirty two bit floating point   */
    GDT_Float64,   /*! Sixty four bit floating point   */
    GDT_CInt16,    /*! Complex Int16                   */
    GDT_CInt32,    /*! Complex Int32                   */
    GDT_CFloat32,  /*! Complex Float32                 */
    GDT_CFloat64,  /*! Complex Float64                 */
    GDT_TypeCount, /*  maximum type # + 1              */
}
extern (C):
alias int GDALDataType;

extern (System):

//C     int CPL_DLL CPL_STDCALL GDALGetDataTypeSize( GDALDataType );  // Deprecated.
deprecated ("Use GDALGetDataTypeSizeBits instead.") 
int  GDALGetDataTypeSize(GDALDataType ) pure nothrow @nogc; 

int  GDALGetDataTypeSizeBits(GDALDataType eDataType) pure nothrow @nogc;
int  GDALGetDataTypeSizeBytes(GDALDataType ) pure nothrow @nogc;
int  GDALDataTypeIsComplex(GDALDataType ) pure nothrow @nogc;
const(char) * GDALGetDataTypeName(GDALDataType ) nothrow @nogc;
GDALDataType  GDALGetDataTypeByName(const char *) pure nothrow @nogc;
GDALDataType  GDALDataTypeUnion(GDALDataType , GDALDataType ) pure nothrow @nogc;

extern (C):
double  GDALAdjustValueToDataType(GDALDataType eDT, double dfValue, int *pbClamped, int *pbRounded) nothrow @nogc;

/**
* status of the asynchronous stream
*/
enum
{
    GARIO_PENDING,
    GARIO_UPDATE,
    GARIO_ERROR,
    GARIO_COMPLETE,
    GARIO_TypeCount,
}
alias int GDALAsyncStatusType;

extern (System):
const(char) * GDALGetAsyncStatusTypeName(GDALAsyncStatusType ) nothrow @nogc;
GDALAsyncStatusType  GDALGetAsyncStatusTypeByName(const char *) nothrow @nogc;

/*! Flag indicating read/write, or read-only access to data. */
enum
{
    GA_ReadOnly, /*! Read only (no update) access */
    GA_Update,   /*! Read/write access.           */
}
extern (C):
alias int GDALAccess;

/*! Read/Write flag for RasterIO() method */
enum
{
    GF_Read,    /*! Read data  */
    GF_Write,   /*! Write data */
}
alias int GDALRWFlag;

/* NOTE: values are selected to be consistent with GDALResampleAlg of alg/gdalwarper.h */
/** RasterIO() resampling method.
  * @since GDAL 2.0
  */
enum
{
    GRIORA_NearestNeighbour = 0, /*! Nearest neighbour                                                           */
    GRIORA_Bilinear         = 1, /*! Bilinear (2x2 kernel)                                                       */
    GRIORA_Cubic            = 2, /*! Cubic Convolution Approximation (4x4 kernel)                                */
    GRIORA_CubicSpline      = 3, /*! Cubic B-Spline Approximation (4x4 kernel)                                   */
    GRIORA_Lanczos          = 4, /*! Lanczos windowed sinc interpolation (6x6 kernel)                            */
    GRIORA_Average          = 5, /*! Average                                                                     */
    GRIORA_Mode             = 6, /*! Mode (selects the value which appears most often of all the sampled points) */
    GRIORA_Gauss            = 7, /*! Gauss blurring                                                              */
    /* NOTE: values 8 to 12 are reserved for max,min,med,Q1,Q3 */
}
alias int GDALRIOResampleAlg;

/* NOTE to developers: only add members, and if so edit INIT_RASTERIO_EXTRA_ARG */
/* and INIT_RASTERIO_EXTRA_ARG                                                  */
/** Structure to pass extra arguments to RasterIO() method
  * @since GDAL 2.0
  */
struct _N25
{
    int nVersion;                    /*! Version of structure (to allow future extensions of the structure)                          */
    GDALRIOResampleAlg eResampleAlg; /*! Resampling algorithm                                                                        */
    GDALProgressFunc pfnProgress;    /*! Progress callback                                                                           */
    void *pProgressData;             /*! Progress callback user data                                                                 */
    /*! Indicate if dfXOff, dfYOff, dfXSize and dfYSize are set. Mostly reserved from the VRT driver to communicate a more precise
        source window. Must be such that dfXOff - nXOff < 1.0 and dfYOff - nYOff < 1.0 and nXSize - dfXSize < 1.0 and 
        nYSize - dfYSize < 1.0                                                                                                       */
    int bFloatingPointWindowValidity;
    double dfXOff;                   /*! Pixel offset to the top left corner. Only valid if bFloatingPointWindowValidity = TRUE      */
    double dfYOff;                   /*! Line offset to the top left corner. Only valid if bFloatingPointWindowValidity = TRUE       */
    double dfXSize;                  /*! Width in pixels of the area of interest. Only valid if bFloatingPointWindowValidity = TRUE  */
    double dfYSize;                  /*! Height in pixels of the area of interest. Only valid if bFloatingPointWindowValidity = TRUE */
}
alias _N25 GDALRasterIOExtraArg;

//C     #define RASTERIO_EXTRA_ARG_CURRENT_VERSION  1
enum RASTERIO_EXTRA_ARG_CURRENT_VERSION = 1;
/** Macro to initialize an instance of GDALRasterIOExtraArg structure.
  * @since GDAL 2.0
  */
//C     #define INIT_RASTERIO_EXTRA_ARG(s)....... 
void INIT_RASTERIO_EXTRA_ARG(ref GDALRasterIOExtraArg s) nothrow @nogc
{ 
    s.nVersion = RASTERIO_EXTRA_ARG_CURRENT_VERSION;          
    s.eResampleAlg = GRIORA_NearestNeighbour;
    s.pfnProgress = null;
    s.pProgressData = null;
    s.bFloatingPointWindowValidity = FALSE;
}

/*! Types of color interpretation for raster bands. */
enum
{
    GCI_Undefined      =  0,
    GCI_GrayIndex      =  1, /*! Greyscale                             */
    GCI_PaletteIndex   =  2, /*! Paletted (see associated color table) */
    GCI_RedBand        =  3, /*! Red band of RGBA image                */
    GCI_GreenBand      =  4, /*! Blue band of RGBA image               */
    GCI_BlueBand       =  5, /*! Alpha (0=transparent, 255=opaque)     */
    GCI_AlphaBand      =  6, /*! Alpha (0=transparent, 255=opaque)     */
    GCI_HueBand        =  7, /*! Hue band of HLS image                 */
    GCI_SaturationBand =  8, /*! Saturation band of HLS image          */
    GCI_LightnessBand  =  9, /*! Lightness band of HLS image           */
    GCI_CyanBand       = 10, /*! Cyan band of CMYK image               */
    GCI_MagentaBand    = 11, /*! Magenta band of CMYK image            */
    GCI_YellowBand     = 12, /*! Yellow band of CMYK image             */
    GCI_BlackBand      = 13, /*! Black band of CMLY image              */
    GCI_YCbCr_YBand    = 14, /*! Y Luminance                           */
    GCI_YCbCr_CbBand   = 15, /*! Cb Chroma                             */
    GCI_YCbCr_CrBand   = 16, /*! Cr Chroma                             */
    GCI_Max            = 16, /*! Max current value                     */
}
alias int GDALColorInterp;

const(char) * GDALGetColorInterpretationName(GDALColorInterp ) nothrow @nogc;
GDALColorInterp  GDALGetColorInterpretationByName(const char *pszName) nothrow @nogc;

/*! Types of color interpretations for a GDALColorTable. */
enum
{
    GPI_Gray = 0, /*! Grayscale (in GDALColorEntry.c1)                       */
    GPI_RGB  = 1, /*! Red, Green, Blue and Alpha in (in c1, c2, c3 and c4)   */
    GPI_CMYK = 2, /*! Cyan, Magenta, Yellow and Black (in c1, c2, c3 and c4) */
    GPI_HLS  = 3, /*! Hue, Lightness and Saturation (in c1, c2, and c3)      */
}
alias int GDALPaletteInterp;

const(char) * GDALGetPaletteInterpretationName(GDALPaletteInterp ) nothrow @nogc;

/* "well known" metadata items. */
enum GDALMD_AREA_OR_POINT = "AREA_OR_POINT";
enum GDALMD_AOP_AREA      = "Area";
enum GDALMD_AOP_POINT     = "Point";

/* -------------------------------------------------------------------- */
/*      GDAL Specific error codes.                                      */
/*                                                                      */
/*      error codes 100 to 299 reserved for GDAL.                       */
/* -------------------------------------------------------------------- */
enum CPLErrorNum CPLE_WrongFormat = cast(CPLErrorNum)200;

/* -------------------------------------------------------------------- */
/*      Define handle types related to various internal classes.        */
/* -------------------------------------------------------------------- */

/** Opaque type used for the C bindings of the C++ GDALMajorObject class */
alias void *GDALMajorObjectH;

/** Opaque type used for the C bindings of the C++ GDALDataset class */
alias void *GDALDatasetH;

/** Opaque type used for the C bindings of the C++ GDALRasterBand class */
alias void *GDALRasterBandH;

/** Opaque type used for the C bindings of the C++ GDALDriver class */
alias void *GDALDriverH;

/** Opaque type used for the C bindings of the C++ GDALColorTable class */
alias void *GDALColorTableH;

/** Opaque type used for the C bindings of the C++ GDALRasterAttributeTable class */
alias void *GDALRasterAttributeTableH;

/** Opaque type used for the C bindings of the C++ GDALAsyncReader class */
alias void *GDALAsyncReaderH;

/** Type to express pixel, line or band spacing. Signed 64 bit integer. */
alias GIntBig GSpacing;

/* ==================================================================== */
/*      Registration/driver related.                                    */
/* ==================================================================== */

/** Long name of the driver */
enum GDAL_DMD_LONGNAME = "DMD_LONGNAME";

/** URL (relative to http://gdal.org/) to the help page of the driver */
enum GDAL_DMD_HELPTOPIC = "DMD_HELPTOPIC";

/** MIME type handled by the driver. */
enum GDAL_DMD_MIMETYPE = "DMD_MIMETYPE";

/** Extension handled by the driver. */
enum GDAL_DMD_EXTENSION = "DMD_EXTENSION";

/** Connection prefix to provide as the file name of the open function.
 * Typically set for non-file based drivers. Generally used with open options.
 * @since GDAL 2.0
 */
enum GDAL_DMD_CONNECTION_PREFIX = "DMD_CONNECTION_PREFIX";

/** List of (space separated) extensions handled by the driver.
 * @since GDAL 2.0
 */
enum GDAL_DMD_EXTENSIONS = "DMD_EXTENSIONS";

/** XML snippet with creation options. */
enum GDAL_DMD_CREATIONOPTIONLIST = "DMD_CREATIONOPTIONLIST";

/** XML snippet with open options.
 * @since GDAL 2.0
 */
enum GDAL_DMD_OPENOPTIONLIST = "DMD_OPENOPTIONLIST";

/** List of (space separated) raster data types support by the Create()/CreateCopy() API. */
enum GDAL_DMD_CREATIONDATATYPES = "DMD_CREATIONDATATYPES";

/** List of (space separated) vector field types support by the CreateField() API.
 * @since GDAL 2.0
 * */
enum GDAL_DMD_CREATIONFIELDDATATYPES = "DMD_CREATIONFIELDDATATYPES";

/** Capability set by a driver that exposes Subdatasets. */
enum GDAL_DMD_SUBDATASETS = "DMD_SUBDATASETS";

/** Capability set by a driver that implements the Open() API. */
enum GDAL_DCAP_OPEN = "DCAP_OPEN";

/** Capability set by a driver that implements the Create() API. */
enum GDAL_DCAP_CREATE = "DCAP_CREATE";

/** Capability set by a driver that implements the CreateCopy() API. */
enum GDAL_DCAP_CREATECOPY = "DCAP_CREATECOPY";

/** Capability set by a driver that can read/create datasets through the VSI*L API. */
enum GDAL_DCAP_VIRTUALIO  = "DCAP_VIRTUALIO";

/** Capability set by a driver having raster capability.
 * @since GDAL 2.0
 */
enum GDAL_DCAP_RASTER = "DCAP_RASTER";

/** Capability set by a driver having vector capability.
 * @since GDAL 2.0
 */
enum GDAL_DCAP_VECTOR = "DCAP_VECTOR";

/** Capability set by a driver having vector capability.
 * @since GDAL 2.1
 */
enum GDAL_DCAP_GNM = "DCAP_GNM";

/** Capability set by a driver that can create fields with NOT NULL constraint.
 * @since GDAL 2.0
 */
enum GDAL_DCAP_NOTNULL_FIELDS = "DCAP_NOTNULL_FIELDS";

/** Capability set by a driver that can create fields with DEFAULT values.
 * @since GDAL 2.0
 */
enum GDAL_DCAP_DEFAULT_FIELDS = "DCAP_DEFAULT_FIELDS";

/** Capability set by a driver that can create geometry fields with NOT NULL constraint.
 * @since GDAL 2.0
 */
enum GDAL_DCAP_NOTNULL_GEOMFIELDS = "DCAP_NOTNULL_GEOMFIELDS";

extern (System):
void  GDALAllRegister() nothrow @nogc;
GDALDatasetH  GDALCreate(GDALDriverH hDriver, const char *, int , int , int , GDALDataType , char **) nothrow @nogc;
GDALDatasetH  GDALCreateCopy(GDALDriverH , const char *, GDALDatasetH , int , char **, GDALProgressFunc , void *) nothrow @nogc;
GDALDriverH  GDALIdentifyDriver(const char *pszFilename, char **papszFileList) nothrow @nogc;
GDALDatasetH  GDALOpen(const(char) *pszFilename, GDALAccess eAccess) nothrow @nogc;
GDALDatasetH  GDALOpenShared(const char *, GDALAccess ) nothrow @nogc;

/* Note: we define GDAL_OF_READONLY and GDAL_OF_UPDATE to be on purpose */
/* equals to GA_ReadOnly and GA_Update */

/** Open in read-only mode.
 * Used by GDALOpenEx().
 * @since GDAL 2.0
 */
enum GDAL_OF_READONLY = 0x00;

/** Open in update mode.
 * Used by GDALOpenEx().
 * @since GDAL 2.0
 */
enum GDAL_OF_UPDATE = 0x01;

/** Allow raster and vector drivers to be used.
 * Used by GDALOpenEx().
 * @since GDAL 2.0
 */
enum GDAL_OF_ALL = 0x00;

/** Allow raster drivers to be used.
 * Used by GDALOpenEx().
 * @since GDAL 2.0
 */
enum GDAL_OF_RASTER = 0x02;

/** Allow vector drivers to be used.
 * Used by GDALOpenEx().
 * @since GDAL 2.0
 */
enum GDAL_OF_VECTOR = 0x04;

/** Allow gnm drivers to be used.
 * Used by GDALOpenEx().
 * @since GDAL 2.1
 */
enum GDAL_OF_GNM = 0x08;

/* Some space for GDAL 3.0 new types ;-) */
/*#define     GDAL_OF_OTHER_KIND1   0x08 */
/*#define     GDAL_OF_OTHER_KIND2   0x10 */
enum GDAL_OF_KIND_MASK = 0x1E;

/** Open in shared mode.
 * Used by GDALOpenEx().
 * @since GDAL 2.0
 */
enum GDAL_OF_SHARED = 0x20;

/** Emit error message in case of failed open.
 * Used by GDALOpenEx().
 * @since GDAL 2.0
 */
enum GDAL_OF_VERBOSE_ERROR = 0x40;
/** Open as internal dataset. Such dataset isn't registered in the global list
 * of opened dataset. Cannot be used with GDAL_OF_SHARED.
 *
 * Used by GDALOpenEx().
 * @since GDAL 2.0
 */
enum GDAL_OF_INTERNAL = 0x80;

/** Let GDAL decide if a array-based or hashset-based storage strategy for
 * cached blocks must be used.
 *
 * GDAL_OF_DEFAULT_BLOCK_ACCESS, GDAL_OF_ARRAY_BLOCK_ACCESS and
 * GDAL_OF_HASHSET_BLOCK_ACCESS are mutually exclusive.
 *
 * Used by GDALOpenEx().
 * @since GDAL 2.1
 */
enum GDAL_OF_DEFAULT_BLOCK_ACCESS = 0;

/** Use a array-based storage strategy for cached blocks.
 *
 * GDAL_OF_DEFAULT_BLOCK_ACCESS, GDAL_OF_ARRAY_BLOCK_ACCESS and
 * GDAL_OF_HASHSET_BLOCK_ACCESS are mutually exclusive.
 *
 * Used by GDALOpenEx().
 * @since GDAL 2.1
 */
enum GDAL_OF_ARRAY_BLOCK_ACCESS = 0x100;

/** Use a hashset-based storage strategy for cached blocks.
 *
 * GDAL_OF_DEFAULT_BLOCK_ACCESS, GDAL_OF_ARRAY_BLOCK_ACCESS and
 * GDAL_OF_HASHSET_BLOCK_ACCESS are mutually exclusive.
 *
 * Used by GDALOpenEx().
 * @since GDAL 2.1
 */
enum GDAL_OF_HASHSET_BLOCK_ACCESS = 0x200;

enum GDAL_OF_RESERVED_1 = 0x300;
enum GDAL_OF_BLOCK_ACCESS_MASK = 0x300;

GDALDatasetH  GDALOpenEx(const char *pszFilename, uint nOpenFlags, const char **papszAllowedDrivers, const char **papszOpenOptions, const char **papszSiblingFiles) nothrow @nogc;
int  GDALDumpOpenDatasets(FILE *) nothrow @nogc; // This is the FILE in stdio.h
GDALDriverH  GDALGetDriverByName(const char *) nothrow @nogc;
int  GDALGetDriverCount() nothrow @nogc;
GDALDriverH  GDALGetDriver(int ) nothrow @nogc;
void  GDALDestroyDriver(GDALDriverH ) nothrow @nogc;
int  GDALRegisterDriver(GDALDriverH ) nothrow @nogc;
void  GDALDeregisterDriver(GDALDriverH ) nothrow @nogc;
void  GDALDestroyDriverManager() nothrow @nogc;

extern (C):
void  GDALDestroy() nothrow @nogc;

extern (System):
CPLErr  GDALDeleteDataset(GDALDriverH , const char *) nothrow @nogc;
CPLErr  GDALRenameDataset(GDALDriverH , const char *pszNewName, const char *pszOldName) nothrow @nogc;
CPLErr  GDALCopyDatasetFiles(GDALDriverH , const char *pszNewName, const char *pszOldName) nothrow @nogc;
int  GDALValidateCreationOptions(GDALDriverH , char **papszCreationOptions) nothrow @nogc;

/* The following are deprecated */
deprecated const(char) * GDALGetDriverShortName(GDALDriverH ) nothrow @nogc;
deprecated const(char) * GDALGetDriverLongName(GDALDriverH ) nothrow @nogc;
deprecated const(char) * GDALGetDriverHelpTopic(GDALDriverH ) nothrow @nogc;
deprecated const(char) * GDALGetDriverCreationOptionList(GDALDriverH ) nothrow @nogc;

/* ==================================================================== */
/*      GDAL_GCP                                                        */
/* ==================================================================== */

/** Ground Control Point */
struct _N28
{
    char *pszId;       /** Unique identifier, often numeric         */
    char *pszInfo;     /** Informational message or ""              */
    double dfGCPPixel; /** Pixel (x) location of GCP on raster      */
    double dfGCPLine;  /** Line (y) location of GCP on raster       */
    double dfGCPX;     /** X position of GCP in georeferenced space */
    double dfGCPY;     /** Y position of GCP in georeferenced space */
    double dfGCPZ;     /** Elevation of GCP, or zero if not known   */
}
extern (C):
alias _N28 GDAL_GCP;

extern (System):
void  GDALInitGCPs(int , GDAL_GCP *) nothrow @nogc;
void  GDALDeinitGCPs(int , GDAL_GCP *) nothrow @nogc;
GDAL_GCP * GDALDuplicateGCPs(int , GDAL_GCP *) nothrow @nogc;

int  GDALGCPsToGeoTransform(int nGCPCount, GDAL_GCP *pasGCPs, double *padfGeoTransform, int bApproxOK) nothrow @nogc;
int  GDALInvGeoTransform(double *padfGeoTransformIn, double *padfInvGeoTransformOut) nothrow @nogc;
void  GDALApplyGeoTransform(double *, double , double , double *, double *) nothrow @nogc;

extern (C):
void  GDALComposeGeoTransforms(double *padfGeoTransform1, double *padfGeoTransform2, double *padfGeoTransformOut) nothrow @nogc;

/* ==================================================================== */
/*      major objects (dataset, and, driver, drivermanager).            */
/* ==================================================================== */
extern (System):
char ** GDALGetMetadataDomainList(GDALMajorObjectH hObject) nothrow @nogc;
char ** GDALGetMetadata(GDALMajorObjectH , const char *) nothrow @nogc;
CPLErr  GDALSetMetadata(GDALMajorObjectH , const char **, const char *) nothrow @nogc;
const(char) * GDALGetMetadataItem(GDALMajorObjectH , const char *, const char *) nothrow @nogc;
CPLErr  GDALSetMetadataItem(GDALMajorObjectH , const char *, const char *, const char *) nothrow @nogc;
const(char) * GDALGetDescription(GDALMajorObjectH ) nothrow @nogc;
void  GDALSetDescription(GDALMajorObjectH , const char *) nothrow @nogc;

/* ==================================================================== */
/*      GDALDataset class ... normally this represents one file.        */
/* ==================================================================== */
enum GDAL_DS_LAYER_CREATIONOPTIONLIST = "DS_LAYER_CREATIONOPTIONLIST";

GDALDriverH  GDALGetDatasetDriver(GDALDatasetH ) nothrow @nogc; 
char ** GDALGetFileList(GDALDatasetH ) nothrow @nogc;
void  GDALClose(GDALDatasetH ) nothrow @nogc;
int  GDALGetRasterXSize(GDALDatasetH ) nothrow @nogc;
int  GDALGetRasterYSize(GDALDatasetH ) nothrow @nogc;
int  GDALGetRasterCount(GDALDatasetH ) nothrow @nogc;
GDALRasterBandH  GDALGetRasterBand(GDALDatasetH , int ) nothrow @nogc;

CPLErr  GDALAddBand(GDALDatasetH hDS, GDALDataType eType, char **papszOptions) nothrow @nogc;
GDALAsyncReaderH  GDALBeginAsyncReader(GDALDatasetH hDS, int nXOff, int nYOff, int nXSize, int nYSize, void *pBuf, int nBufXSize, int nBufYSize, GDALDataType eBufType, int nBandCount, int *panBandMap, int nPixelSpace, int nLineSpace, int nBandSpace, char **papszOptions) nothrow @nogc;
void  GDALEndAsyncReader(GDALDatasetH hDS, GDALAsyncReaderH hAsynchReaderH) nothrow @nogc;
CPLErr  GDALDatasetRasterIO(GDALDatasetH hDS, GDALRWFlag eRWFlag, int nDSXOff, int nDSYOff, int nDSXSize, int nDSYSize, void *pBuffer, int nBXSize, int nBYSize, GDALDataType eBDataType, int nBandCount, int *panBandCount, int nPixelSpace, int nLineSpace, int nBandSpace) nothrow @nogc;
CPLErr  GDALDatasetRasterIOEx(GDALDatasetH hDS, GDALRWFlag eRWFlag, int nDSXOff, int nDSYOff, int nDSXSize, int nDSYSize, void *pBuffer, int nBXSize, int nBYSize, GDALDataType eBDataType, int nBandCount, int *panBandCount, GSpacing nPixelSpace, GSpacing nLineSpace, GSpacing nBandSpace, GDALRasterIOExtraArg *psExtraArg) nothrow @nogc;
CPLErr  GDALDatasetAdviseRead(GDALDatasetH hDS, int nDSXOff, int nDSYOff, int nDSXSize, int nDSYSize, int nBXSize, int nBYSize, GDALDataType eBDataType, int nBandCount, int *panBandCount, char **papszOptions) nothrow @nogc;
const(char) * GDALGetProjectionRef(GDALDatasetH ) nothrow @nogc;
CPLErr  GDALSetProjection(GDALDatasetH , const char *) nothrow @nogc;
CPLErr  GDALGetGeoTransform(GDALDatasetH , double *) nothrow @nogc;
CPLErr  GDALSetGeoTransform(GDALDatasetH , double *) nothrow @nogc;

int  GDALGetGCPCount(GDALDatasetH ) nothrow @nogc;
const(char) * GDALGetGCPProjection(GDALDatasetH ) nothrow @nogc;
GDAL_GCP * GDALGetGCPs(GDALDatasetH ) nothrow @nogc;
CPLErr  GDALSetGCPs(GDALDatasetH , int , GDAL_GCP *, const char *) nothrow @nogc;

void * GDALGetInternalHandle(GDALDatasetH , const char *) nothrow @nogc;
int  GDALReferenceDataset(GDALDatasetH ) nothrow @nogc;
int  GDALDereferenceDataset(GDALDatasetH ) nothrow @nogc;

CPLErr  GDALBuildOverviews(GDALDatasetH , const char *, int , int *, int , int *, GDALProgressFunc , void *) nothrow @nogc;
void  GDALGetOpenDatasets(GDALDatasetH **hDS, int *pnCount) nothrow @nogc;
int  GDALGetAccess(GDALDatasetH hDS) nothrow @nogc;
void  GDALFlushCache(GDALDatasetH hDS) nothrow @nogc;

CPLErr  GDALCreateDatasetMaskBand(GDALDatasetH hDS, int nFlags) nothrow @nogc;

CPLErr  GDALDatasetCopyWholeRaster(GDALDatasetH hSrcDS, GDALDatasetH hDstDS, char **papszOptions, GDALProgressFunc pfnProgress, void *pProgressData) nothrow @nogc;

CPLErr  GDALRasterBandCopyWholeRaster(GDALRasterBandH hSrcBand, GDALRasterBandH hDstBand, char **papszOptions, GDALProgressFunc pfnProgress, void *pProgressData) nothrow @nogc;

extern (C):
CPLErr  GDALRegenerateOverviews(GDALRasterBandH hSrcBand, int nOverviewCount, GDALRasterBandH *pahOverviewBands, const char *pszResampling, GDALProgressFunc pfnProgress, void *pProgressData) nothrow @nogc;

int  GDALDatasetGetLayerCount(GDALDatasetH ) nothrow @nogc;
OGRLayerH  GDALDatasetGetLayer(GDALDatasetH , int ) nothrow @nogc;
OGRLayerH  GDALDatasetGetLayerByName(GDALDatasetH , const char *) nothrow @nogc;
OGRErr  GDALDatasetDeleteLayer(GDALDatasetH , int ) nothrow @nogc;
OGRLayerH  GDALDatasetCreateLayer(GDALDatasetH , const char *, OGRSpatialReferenceH , OGRwkbGeometryType , char **) nothrow @nogc;
OGRLayerH  GDALDatasetCopyLayer(GDALDatasetH , OGRLayerH , const char *, char **) nothrow @nogc;
int  GDALDatasetTestCapability(GDALDatasetH , const char *) nothrow @nogc;
OGRLayerH  GDALDatasetExecuteSQL(GDALDatasetH , const char *, OGRGeometryH , const char *) nothrow @nogc;
void  GDALDatasetReleaseResultSet(GDALDatasetH , OGRLayerH ) nothrow @nogc;
OGRStyleTableH  GDALDatasetGetStyleTable(GDALDatasetH ) nothrow @nogc;
void  GDALDatasetSetStyleTableDirectly(GDALDatasetH , OGRStyleTableH ) nothrow @nogc;
void  GDALDatasetSetStyleTable(GDALDatasetH , OGRStyleTableH ) nothrow @nogc;
OGRErr  GDALDatasetStartTransaction(GDALDatasetH hDS, int bForce) nothrow @nogc;
OGRErr  GDALDatasetCommitTransaction(GDALDatasetH hDS) nothrow @nogc;
OGRErr  GDALDatasetRollbackTransaction(GDALDatasetH hDS) nothrow @nogc;

/* ==================================================================== */
/*      GDALRasterBand ... one band/channel in a dataset.               */
/* ==================================================================== */

/**
 * SRCVAL - Macro which may be used by pixel functions to obtain
 *          a pixel from a source buffer.
 */
//C     #define SRCVAL(papoSource, eSrcType, ii)
template SRCVAL(void* papoSource, GDALDataType eSrcType, size_t ii)
{
    static if( eSrcType == GDT_Byte) 
        enum GByte SRCVAL = (cast(GByte*)papoSource)[ii];
    else static if ( eSrcType == GDT_Float32)
        enum float SRCVAL = (cast(float*)papoSource)[ii];
    else static if ( eSrcType == GDT_Float64)
        enum double SRCVAL = (cast(double*)papoSource)[ii];
    else static if ( eSrcType == GDT_Int32)
        enum GInt32 SRCVAL = (cast(GInt32*)papoSource)[ii];
    else static if ( eSrcType == GDT_UInt16)
        enum GUInt16 SRCVAL = (cast(GUInt16*)papoSource)[ii];
    else static if ( eSrcType == GDT_Int16)
        enum GInt16 SRCVAL = (cast(GInt16*)papoSource)[ii];
    else static if ( eSrcType == GDT_UInt32)
        enum GUInt32 SRCVAL = (cast(GUInt32*)papoSource)[ii];
    else static if ( eSrcType == GDT_CInt16)
        enum GInt16 SRCVAL = (cast(GInt16*)papoSource)[ii * 2];
    else static if ( eSrcType == GDT_CInt32)
        enum GInt32 SRCVAL = (cast(GInt32*)papoSource)[ii * 2];
    else static if ( eSrcType == GDT_CFloat32)
        enum float SRCVAL = (cast(float*)papoSource)[ii * 2];
    else static if ( eSrcType == GDT_CFloat64)
        enum double SRCVAL = (cast(double*)papoSource)[ii * 2];
    else
        enum int SRCVAL = 0;
}

alias GDALDerivedPixelFunc = CPLErr function(void **papoSources, int nSources, 
    void *pData, int nBufXSize, int nBufYSize, GDALDataType eSrcType, 
    GDALDataType eBufType, int nPixelSpace, int nLineSpace);

extern (System):
GDALDataType  GDALGetRasterDataType(GDALRasterBandH ) nothrow @nogc;
void  GDALGetBlockSize(GDALRasterBandH , int *pnXSize, int *pnYSize) nothrow @nogc;

CPLErr  GDALRasterAdviseRead(GDALRasterBandH hRB, int nDSXOff, int nDSYOff, 
    int nDSXSize, int nDSYSize, int nBXSize, int nBYSize, 
    GDALDataType eBDataType, char **papszOptions) nothrow @nogc;

CPLErr  GDALRasterIO(GDALRasterBandH hRBand, GDALRWFlag eRWFlag, int nDSXOff, 
    int nDSYOff, int nDSXSize, int nDSYSize, void *pBuffer, int nBXSize, 
    int nBYSize, GDALDataType eBDataType, int nPixelSpace, int nLineSpace) nothrow @nogc;
CPLErr  GDALRasterIOEx(GDALRasterBandH hRBand, GDALRWFlag eRWFlag, int nDSXOff,
    int nDSYOff, int nDSXSize, int nDSYSize, void *pBuffer, int nBXSize, 
    int nBYSize, GDALDataType eBDataType, GSpacing nPixelSpace, 
    GSpacing nLineSpace, GDALRasterIOExtraArg *psExtraArg) nothrow @nogc;
CPLErr  GDALReadBlock(GDALRasterBandH , int , int , void *) nothrow @nogc;
CPLErr  GDALWriteBlock(GDALRasterBandH , int , int , void *) nothrow @nogc;
int  GDALGetRasterBandXSize(GDALRasterBandH ) nothrow @nogc;
int  GDALGetRasterBandYSize(GDALRasterBandH ) nothrow @nogc;
GDALAccess  GDALGetRasterAccess(GDALRasterBandH ) nothrow @nogc;
int  GDALGetBandNumber(GDALRasterBandH ) nothrow @nogc;
GDALDatasetH  GDALGetBandDataset(GDALRasterBandH ) nothrow @nogc;

GDALColorInterp  GDALGetRasterColorInterpretation(GDALRasterBandH ) nothrow @nogc;
CPLErr  GDALSetRasterColorInterpretation(GDALRasterBandH , GDALColorInterp ) nothrow @nogc;
GDALColorTableH  GDALGetRasterColorTable(GDALRasterBandH ) nothrow @nogc;
CPLErr  GDALSetRasterColorTable(GDALRasterBandH , GDALColorTableH ) nothrow @nogc;
int  GDALHasArbitraryOverviews(GDALRasterBandH ) nothrow @nogc;
int  GDALGetOverviewCount(GDALRasterBandH ) nothrow @nogc;
GDALRasterBandH  GDALGetOverview(GDALRasterBandH , int ) nothrow @nogc;
double  GDALGetRasterNoDataValue(GDALRasterBandH , int *) nothrow @nogc;
CPLErr  GDALSetRasterNoDataValue(GDALRasterBandH , double ) nothrow @nogc;
CPLErr  GDALDeleteRasterNoDataValue(GDALRasterBandH ) nothrow @nogc;
char ** GDALGetRasterCategoryNames(GDALRasterBandH ) nothrow @nogc;
CPLErr  GDALSetRasterCategoryNames(GDALRasterBandH , char **) nothrow @nogc;
double  GDALGetRasterMinimum(GDALRasterBandH , int *pbSuccess) nothrow @nogc;
double  GDALGetRasterMaximum(GDALRasterBandH , int *pbSuccess) nothrow @nogc;
CPLErr  GDALGetRasterStatistics(GDALRasterBandH , int bApproxOK, int bForce, 
    double *pdfMin, double *pdfMax, double *pdfMean, double *pdfStdDev) nothrow @nogc;
CPLErr  GDALComputeRasterStatistics(GDALRasterBandH , int bApproxOK, double 
    *pdfMin, double *pdfMax, double *pdfMean, double *pdfStdDev, 
    GDALProgressFunc pfnProgress, void *pProgressData) nothrow @nogc;
CPLErr  GDALSetRasterStatistics(GDALRasterBandH hBand, double dfMin, 
    double dfMax, double dfMean, double dfStdDev) nothrow @nogc;

const(char) * GDALGetRasterUnitType(GDALRasterBandH ) nothrow @nogc;
CPLErr  GDALSetRasterUnitType(GDALRasterBandH hBand, const char *pszNewValue) nothrow @nogc;
double  GDALGetRasterOffset(GDALRasterBandH , int *pbSuccess) nothrow @nogc;
CPLErr  GDALSetRasterOffset(GDALRasterBandH hBand, double dfNewOffset) nothrow @nogc;
double  GDALGetRasterScale(GDALRasterBandH , int *pbSuccess) nothrow @nogc;
CPLErr  GDALSetRasterScale(GDALRasterBandH hBand, double dfNewOffset) nothrow @nogc;
void  GDALComputeRasterMinMax(GDALRasterBandH hBand, int bApproxOK, 
    double *adfMinMax) nothrow @nogc;
CPLErr  GDALFlushRasterCache(GDALRasterBandH hBand) nothrow @nogc;
CPLErr  GDALGetRasterHistogram(GDALRasterBandH hBand, double dfMin, 
    double dfMax, int nBuckets, int *panHistogram, int bIncludeOutOfRange, 
    int bApproxOK, GDALProgressFunc pfnProgress, void *pProgressData) nothrow @nogc;
CPLErr  GDALGetRasterHistogramEx(GDALRasterBandH hBand, double dfMin, 
    double dfMax, int nBuckets, GUIntBig *panHistogram, int bIncludeOutOfRange, 
    int bApproxOK, GDALProgressFunc pfnProgress, void *pProgressData) nothrow @nogc;
CPLErr  GDALGetDefaultHistogram(GDALRasterBandH hBand, double *pdfMin, 
    double *pdfMax, int *pnBuckets, int **ppanHistogram, int bForce, 
    GDALProgressFunc pfnProgress, void *pProgressData) nothrow @nogc;
CPLErr  GDALGetDefaultHistogramEx(GDALRasterBandH hBand, double *pdfMin, 
    double *pdfMax, int *pnBuckets, GUIntBig **ppanHistogram, int bForce, 
    GDALProgressFunc pfnProgress, void *pProgressData) nothrow @nogc;
CPLErr  GDALSetDefaultHistogram(GDALRasterBandH hBand, double dfMin, 
    double dfMax, int nBuckets, int *panHistogram) nothrow @nogc;
CPLErr  GDALSetDefaultHistogramEx(GDALRasterBandH hBand, double dfMin, 
    double dfMax, int nBuckets, GUIntBig *panHistogram) nothrow @nogc;
int  GDALGetRandomRasterSample(GDALRasterBandH , int , float *) nothrow @nogc;
GDALRasterBandH  GDALGetRasterSampleOverview(GDALRasterBandH , int ) nothrow @nogc;
GDALRasterBandH  GDALGetRasterSampleOverviewEx(GDALRasterBandH , GUIntBig ) nothrow @nogc;
CPLErr  GDALFillRaster(GDALRasterBandH hBand, double dfRealValue, 
    double dfImaginaryValue) nothrow @nogc;
CPLErr  GDALComputeBandStats(GDALRasterBandH hBand, int nSampleStep, 
    double *pdfMean, double *pdfStdDev, GDALProgressFunc pfnProgress, 
    void *pProgressData) nothrow @nogc;

extern (C):
CPLErr  GDALOverviewMagnitudeCorrection(GDALRasterBandH hBaseBand, 
    int nOverviewCount, GDALRasterBandH *pahOverviews, 
    GDALProgressFunc pfnProgress, void *pProgressData) nothrow @nogc;

extern (System):
GDALRasterAttributeTableH  GDALGetDefaultRAT(GDALRasterBandH hBand) nothrow @nogc;
CPLErr  GDALSetDefaultRAT(GDALRasterBandH , GDALRasterAttributeTableH ) nothrow @nogc;
CPLErr  GDALAddDerivedBandPixelFunc(const char *pszName, 
    GDALDerivedPixelFunc pfnPixelFunc) nothrow @nogc;

GDALRasterBandH  GDALGetMaskBand(GDALRasterBandH hBand) nothrow @nogc;
int  GDALGetMaskFlags(GDALRasterBandH hBand) nothrow @nogc;
CPLErr  GDALCreateMaskBand(GDALRasterBandH hBand, int nFlags) nothrow @nogc;

enum GMF_ALL_VALID   = 0x01;
enum GMF_PER_DATASET = 0x02;
enum GMF_ALPHA       = 0x04;
enum GMF_NODATA      = 0x08;
/* ==================================================================== */
/*     GDALAsyncReader                                                  */
/* ==================================================================== */

GDALAsyncStatusType  GDALARGetNextUpdatedRegion(GDALAsyncReaderH hARIO, 
    double dfTimeout, int *pnXBufOff, int *pnYBufOff, int *pnXBufSize, 
    int *pnYBufSize) nothrow @nogc;
int  GDALARLockBuffer(GDALAsyncReaderH hARIO, double dfTimeout) nothrow @nogc;
void  GDALARUnlockBuffer(GDALAsyncReaderH hARIO) nothrow @nogc;

/* -------------------------------------------------------------------- */
/*      Helper functions.                                               */
/* -------------------------------------------------------------------- */
int  GDALGeneralCmdLineProcessor(int nArgc, char ***ppapszArgv, int nOptions) nothrow @nogc;
void  GDALSwapWords(void *pData, int nWordSize, int nWordCount, int nWordSkip) nothrow @nogc;
void  GDALSwapWordsEx(void *pData, int nWordSize, size_t nWordCount, 
    int nWordSkip) nothrow @nogc;

void  GDALCopyWords(void *pSrcData, GDALDataType eSrcType, int nSrcPixelOffset, 
    void *pDstData, GDALDataType eDstType, int nDstPixelOffset, int nWordCount) nothrow @nogc;

extern (C):
void  GDALCopyBits(GByte *pabySrcData, int nSrcOffset, int nSrcStep, 
    GByte *pabyDstData, int nDstOffset, int nDstStep, int nBitCount, 
    int nStepCount) nothrow @nogc;

extern (System):
int  GDALLoadWorldFile(const char *, double *) nothrow @nogc;
int  GDALReadWorldFile(const char *, const char *, double *) nothrow @nogc;
int  GDALWriteWorldFile(const char *, const char *, double *) nothrow @nogc;
int  GDALLoadTabFile(const char *, double *, char **, int *, GDAL_GCP **) nothrow @nogc;
int  GDALReadTabFile(const char *, double *, char **, int *, GDAL_GCP **) nothrow @nogc;
int  GDALLoadOziMapFile(const char *, double *, char **, int *, GDAL_GCP **) nothrow @nogc;
int  GDALReadOziMapFile(const char *, double *, char **, int *, GDAL_GCP **) nothrow @nogc;

const(char) * GDALDecToDMS(double , const char *, int ) nothrow @nogc;
double  GDALPackedDMSToDec(double ) nothrow @nogc;
double  GDALDecToPackedDMS(double ) nothrow @nogc;

/* Note to developers : please keep this section in sync with ogr_core.h */
const(char)* GDALVersionInfo( const char * ) nothrow @nogc;
int GDALCheckVersion( int nVersionMajor, int nVersionMinor,
    const char* pszCallingComponentName) nothrow @nogc;

/** Helper macro for GDALCheckVersion()
  @see GDALCheckVersion()
  */
void GDAL_CHECK_VERSION(const char* pszCallingComponentName) nothrow @nogc
{  
  GDALCheckVersion(GDAL_VERSION_MAJOR, GDAL_VERSION_MINOR, 
    pszCallingComponentName);
}

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
    double[20] adfLINE_NUM_COEFF;
    double[20] adfLINE_DEN_COEFF;
    double[20] adfSAMP_NUM_COEFF;
    double[20] adfSAMP_DEN_COEFF;
    double dfMIN_LONG;
    double dfMIN_LAT;
    double dfMAX_LONG;
    double dfMAX_LAT;
}
extern (C):
alias _N29 GDALRPCInfo;

//C     int CPL_DLL CPL_STDCALL GDALExtractRPCInfo( char **, GDALRPCInfo * );
extern (System):
int  GDALExtractRPCInfo(char **, GDALRPCInfo *) nothrow @nogc;

/* ==================================================================== */
/*      Color tables.                                                   */
/* ==================================================================== */

/** Color tuple */
struct _N30
{
    short c1; /*! gray, red, cyan or hue       */
    short c2; /*! green, magenta, or lightness */
    short c3; /*! blue, yellow, or saturation  */
    short c4; /*! alpha or blackband           */
}
extern (C):
alias _N30 GDALColorEntry;

extern (System):
GDALColorTableH  GDALCreateColorTable(GDALPaletteInterp ) nothrow @nogc;
void  GDALDestroyColorTable(GDALColorTableH ) nothrow @nogc;
GDALColorTableH  GDALCloneColorTable(GDALColorTableH ) nothrow @nogc;
GDALPaletteInterp  GDALGetPaletteInterpretation(GDALColorTableH ) nothrow @nogc;
int  GDALGetColorEntryCount(GDALColorTableH ) nothrow @nogc;
GDALColorEntry * GDALGetColorEntry(GDALColorTableH , int ) nothrow @nogc;
int  GDALGetColorEntryAsRGB(GDALColorTableH , int , GDALColorEntry *) nothrow @nogc;
void  GDALSetColorEntry(GDALColorTableH , int , GDALColorEntry *) nothrow @nogc;
void  GDALCreateColorRamp(GDALColorTableH hTable, int nStartIndex, 
    GDALColorEntry *psStartColor, int nEndIndex, GDALColorEntry *psEndColor) nothrow @nogc;

/* ==================================================================== */
/*      Raster Attribute Table				                            */
/* ==================================================================== */

/** Field type of raster attribute table */
enum
{
    GFT_Integer, /*! Integer field                 */
    GFT_Real,    /*! Floating point (double) field */
    GFT_String,  /*! String field                  */
}
extern (C):
alias int GDALRATFieldType;

/** Field usage of raster attribute table */
enum
{
    GFU_Generic    =  0,  /*! General purpose field.           */
    GFU_PixelCount =  1,  /*! Histogram pixel count            */
    GFU_Name       =  2,  /*! Class name                       */
    GFU_Min        =  3,  /*! Class range minimum              */
    GFU_Max        =  4,  /*! Class range maximum              */
    GFU_MinMax     =  5,  /*! Class value (min=max)            */
    GFU_Red        =  6,  /*! Red class color (0-255)          */
    GFU_Green      =  7,  /*! Green class color (0-255)        */
    GFU_Blue       =  8,  /*! Blue class color (0-255)         */
    GFU_Alpha      =  9,  /*! Alpha (0=transparent,255=opaque) */
    GFU_RedMin     = 10,  /*! Color Range Red Minimum          */
    GFU_GreenMin   = 11,  /*! Color Range Green Minimum        */
    GFU_BlueMin    = 12,  /*! Color Range Blue Minimum         */
    GFU_AlphaMin   = 13,  /*! Color Range Alpha Minimum        */
    GFU_RedMax     = 14,  /*! Color Range Red Maximum          */
    GFU_GreenMax   = 15,  /*! Color Range Green Maximum        */
    GFU_BlueMax    = 16,  /*! Color Range Blue Maximum         */
    GFU_AlphaMax   = 17,  /*! Color Range Alpha Maximum        */
    GFU_MaxCount,         /*! Class range maximum              */
}
alias int GDALRATFieldUsage;

extern (System):
GDALRasterAttributeTableH  GDALCreateRasterAttributeTable();
void  GDALDestroyRasterAttributeTable(GDALRasterAttributeTableH ) nothrow @nogc;

int  GDALRATGetColumnCount(GDALRasterAttributeTableH ) nothrow @nogc;

const(char) * GDALRATGetNameOfCol(GDALRasterAttributeTableH , int ) nothrow @nogc;
GDALRATFieldUsage  GDALRATGetUsageOfCol(GDALRasterAttributeTableH , int ) nothrow @nogc;
GDALRATFieldType  GDALRATGetTypeOfCol(GDALRasterAttributeTableH , int ) nothrow @nogc;

int  GDALRATGetColOfUsage(GDALRasterAttributeTableH , GDALRATFieldUsage ) nothrow @nogc;
int  GDALRATGetRowCount(GDALRasterAttributeTableH ) nothrow @nogc;

const(char) * GDALRATGetValueAsString(GDALRasterAttributeTableH , int , int ) nothrow @nogc;
int  GDALRATGetValueAsInt(GDALRasterAttributeTableH , int , int ) nothrow @nogc;
double  GDALRATGetValueAsDouble(GDALRasterAttributeTableH , int , int ) nothrow @nogc;

void  GDALRATSetValueAsString(GDALRasterAttributeTableH , int , int , const char *) nothrow @nogc;
void  GDALRATSetValueAsInt(GDALRasterAttributeTableH , int , int , int ) nothrow @nogc;
void  GDALRATSetValueAsDouble(GDALRasterAttributeTableH , int , int , double ) nothrow @nogc;

int  GDALRATChangesAreWrittenToFile(GDALRasterAttributeTableH hRAT) nothrow @nogc;

CPLErr  GDALRATValuesIOAsDouble(GDALRasterAttributeTableH hRAT, 
    GDALRWFlag eRWFlag, int iField, int iStartRow, int iLength, 
    double *pdfData) nothrow @nogc;
CPLErr  GDALRATValuesIOAsInteger(GDALRasterAttributeTableH hRAT, 
    GDALRWFlag eRWFlag, int iField, int iStartRow, int iLength, int *pnData) nothrow @nogc;
CPLErr  GDALRATValuesIOAsString(GDALRasterAttributeTableH hRAT, 
    GDALRWFlag eRWFlag, int iField, int iStartRow, int iLength, 
    char **papszStrList) nothrow @nogc;

void  GDALRATSetRowCount(GDALRasterAttributeTableH , int ) nothrow @nogc;
CPLErr  GDALRATCreateColumn(GDALRasterAttributeTableH , const char *,
 GDALRATFieldType , GDALRATFieldUsage ) nothrow @nogc;
CPLErr  GDALRATSetLinearBinning(GDALRasterAttributeTableH , double , double ) nothrow @nogc;
int  GDALRATGetLinearBinning(GDALRasterAttributeTableH , double *, double *) nothrow @nogc;
CPLErr  GDALRATInitializeFromColorTable(GDALRasterAttributeTableH , 
    GDALColorTableH ) nothrow @nogc;
GDALColorTableH  GDALRATTranslateToColorTable(GDALRasterAttributeTableH , 
    int nEntryCount) nothrow @nogc;
void  GDALRATDumpReadable(GDALRasterAttributeTableH , FILE *) nothrow @nogc;
GDALRasterAttributeTableH  GDALRATClone(GDALRasterAttributeTableH ) nothrow @nogc;

void * GDALRATSerializeJSON(GDALRasterAttributeTableH ) nothrow @nogc;

int  GDALRATGetRowOfValue(GDALRasterAttributeTableH , double ) nothrow @nogc;

/* ==================================================================== */
/*      GDAL Cache Management                                           */
/* ==================================================================== */

void  GDALSetCacheMax(int nBytes) nothrow @nogc;
int  GDALGetCacheMax() nothrow @nogc;
int  GDALGetCacheUsed() nothrow @nogc;
void  GDALSetCacheMax64(GIntBig nBytes) nothrow @nogc;
GIntBig  GDALGetCacheMax64() nothrow @nogc;
GIntBig  GDALGetCacheUsed64() nothrow @nogc;
int  GDALFlushCacheBlock() nothrow @nogc;

/* ==================================================================== */
/*      GDAL virtual memory                                             */
/* ==================================================================== */

extern (C):
/+

Documentation says the virtual memory only works on linux currently. Using the 
virtual memory requires me to create bindings to cpl_virtualmem.h, which then
has other requirements. So for the D binding, I chose to not support the virtual
memory portion of the API.

CPLVirtualMem * GDALDatasetGetVirtualMem(GDALDatasetH hDS, GDALRWFlag eRWFlag, 
    int nXOff, int nYOff, int nXSize, int nYSize, int nBufXSize, int nBufYSize, 
    GDALDataType eBufType, int nBandCount, int *panBandMap, int nPixelSpace, 
    GIntBig nLineSpace, GIntBig nBandSpace, size_t nCacheSize, 
    size_t nPageSizeHint, int bSingleThreadUsage, char **papszOptions);

CPLVirtualMem * GDALRasterBandGetVirtualMem(GDALRasterBandH hBand, 
    GDALRWFlag eRWFlag, int nXOff, int nYOff, int nXSize, int nYSize, 
    int nBufXSize, int nBufYSize, GDALDataType eBufType, int nPixelSpace, 
    GIntBig nLineSpace, size_t nCacheSize, size_t nPageSizeHint, 
    int bSingleThreadUsage, char **papszOptions);

CPLVirtualMem * GDALGetVirtualMemAuto(GDALRasterBandH hBand, 
    GDALRWFlag eRWFlag, int *pnPixelSpace, GIntBig *pnLineSpace, 
    char **papszOptions);

enum
{
    GTO_TIP, /*! Tile Interleaved by Pixel: tile (0,0) with internal band interleaved by pixel organization, tile (1, 0), ...                                  */
    GTO_BIT, /*! Band Interleaved by Tile : tile (0,0) of first band, tile (0,0) of second band, ... tile (1,0) of first band, tile (1,0) of second band, ... */
    GTO_BSQ, /*! Band SeQuential : all the tiles of first band, all the tiles of following band...                                                            */
}
alias int GDALTileOrganization;

CPLVirtualMem * GDALDatasetGetTiledVirtualMem(GDALDatasetH hDS, 
    GDALRWFlag eRWFlag, int nXOff, int nYOff, int nXSize, int nYSize, 
    int nTileXSize, int nTileYSize, GDALDataType eBufType, int nBandCount, 
    int *panBandMap, GDALTileOrganization eTileOrganization, size_t nCacheSize, 
    int bSingleThreadUsage, char **papszOptions);

CPLVirtualMem * GDALRasterBandGetTiledVirtualMem(GDALRasterBandH hBand, 
    GDALRWFlag eRWFlag, int nXOff, int nYOff, int nXSize, int nYSize, 
    int nTileXSize, int nTileYSize, GDALDataType eBufType, size_t nCacheSize, 
    int bSingleThreadUsage, char **papszOptions);
+/

/* ==================================================================== */
/*      VRTPansharpenedDataset class.                                   */
/* ==================================================================== */

GDALDatasetH  GDALCreatePansharpenedVRT(const char *pszXML, 
    GDALRasterBandH hPanchroBand, int nInputSpectralBands, 
    GDALRasterBandH *pahInputSpectralBands) nothrow @nogc;

/* =================================================================== */
/*      Misc API                                                        */
/* ==================================================================== */

CPLXMLNode * GDALGetJPEG2000Structure(const char *pszFilename, char **papszOptions) nothrow @nogc;
