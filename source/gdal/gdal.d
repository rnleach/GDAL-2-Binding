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

extern (Windows):

//C     int CPL_DLL CPL_STDCALL GDALGetDataTypeSize( GDALDataType );  // Deprecated.
deprecated ("Use GDALGetDataTypeSizeBits instead.") 
int  GDALGetDataTypeSize(GDALDataType );

int  GDALGetDataTypeSizeBits(GDALDataType eDataType);
int  GDALGetDataTypeSizeBytes(GDALDataType );
int  GDALDataTypeIsComplex(GDALDataType );
const(char) * GDALGetDataTypeName(GDALDataType );
GDALDataType  GDALGetDataTypeByName(const char *);
GDALDataType  GDALDataTypeUnion(GDALDataType , GDALDataType );

extern (C):
double  GDALAdjustValueToDataType(GDALDataType eDT, double dfValue, int *pbClamped, int *pbRounded);

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

extern (Windows):
const(char) * GDALGetAsyncStatusTypeName(GDALAsyncStatusType );
GDALAsyncStatusType  GDALGetAsyncStatusTypeByName(const char *);

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
void INIT_RASTERIO_EXTRA_ARG(ref GDALRasterIOExtraArg s)
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

const(char) * GDALGetColorInterpretationName(GDALColorInterp );
GDALColorInterp  GDALGetColorInterpretationByName(const char *pszName);

/*! Types of color interpretations for a GDALColorTable. */
enum
{
    GPI_Gray = 0, /*! Grayscale (in GDALColorEntry.c1)                       */
    GPI_RGB  = 1, /*! Red, Green, Blue and Alpha in (in c1, c2, c3 and c4)   */
    GPI_CMYK = 2, /*! Cyan, Magenta, Yellow and Black (in c1, c2, c3 and c4) */
    GPI_HLS  = 3, /*! Hue, Lightness and Saturation (in c1, c2, and c3)      */
}
alias int GDALPaletteInterp;

const(char) * GDALGetPaletteInterpretationName(GDALPaletteInterp );

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

extern (Windows):
void  GDALAllRegister();
GDALDatasetH  GDALCreate(GDALDriverH hDriver, const char *, int , int , int , GDALDataType , char **);
GDALDatasetH  GDALCreateCopy(GDALDriverH , const char *, GDALDatasetH , int , char **, GDALProgressFunc , void *);
GDALDriverH  GDALIdentifyDriver(const char *pszFilename, char **papszFileList);
GDALDatasetH  GDALOpen(const char *pszFilename, GDALAccess eAccess);
GDALDatasetH  GDALOpenShared(const char *, GDALAccess );

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

GDALDatasetH  GDALOpenEx(const char *pszFilename, uint nOpenFlags, const char **papszAllowedDrivers, const char **papszOpenOptions, const char **papszSiblingFiles);
int  GDALDumpOpenDatasets(FILE *); // This is the FILE in stdio.h
GDALDriverH  GDALGetDriverByName(const char *);
int  GDALGetDriverCount();
GDALDriverH  GDALGetDriver(int );
void  GDALDestroyDriver(GDALDriverH );
int  GDALRegisterDriver(GDALDriverH );
void  GDALDeregisterDriver(GDALDriverH );
void  GDALDestroyDriverManager();

extern (C):
void  GDALDestroy();

extern (Windows):
CPLErr  GDALDeleteDataset(GDALDriverH , const char *);
CPLErr  GDALRenameDataset(GDALDriverH , const char *pszNewName, const char *pszOldName);
CPLErr  GDALCopyDatasetFiles(GDALDriverH , const char *pszNewName, const char *pszOldName);
int  GDALValidateCreationOptions(GDALDriverH , char **papszCreationOptions);

/* The following are deprecated */
deprecated const(char) * GDALGetDriverShortName(GDALDriverH );
deprecated const(char) * GDALGetDriverLongName(GDALDriverH );
deprecated const(char) * GDALGetDriverHelpTopic(GDALDriverH );
deprecated const(char) * GDALGetDriverCreationOptionList(GDALDriverH );

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

extern (Windows):
void  GDALInitGCPs(int , GDAL_GCP *);
void  GDALDeinitGCPs(int , GDAL_GCP *);
GDAL_GCP * GDALDuplicateGCPs(int , GDAL_GCP *);

int  GDALGCPsToGeoTransform(int nGCPCount, GDAL_GCP *pasGCPs, double *padfGeoTransform, int bApproxOK);
int  GDALInvGeoTransform(double *padfGeoTransformIn, double *padfInvGeoTransformOut);
void  GDALApplyGeoTransform(double *, double , double , double *, double *);

extern (C):
void  GDALComposeGeoTransforms(double *padfGeoTransform1, double *padfGeoTransform2, double *padfGeoTransformOut);

/* ==================================================================== */
/*      major objects (dataset, and, driver, drivermanager).            */
/* ==================================================================== */
extern (Windows):
char ** GDALGetMetadataDomainList(GDALMajorObjectH hObject);
char ** GDALGetMetadata(GDALMajorObjectH , const char *);
CPLErr  GDALSetMetadata(GDALMajorObjectH , const char **, const char *);
const(char) * GDALGetMetadataItem(GDALMajorObjectH , const char *, const char *);
CPLErr  GDALSetMetadataItem(GDALMajorObjectH , const char *, const char *, const char *);
const(char) * GDALGetDescription(GDALMajorObjectH );
void  GDALSetDescription(GDALMajorObjectH , const char *);

/* ==================================================================== */
/*      GDALDataset class ... normally this represents one file.        */
/* ==================================================================== */
enum GDAL_DS_LAYER_CREATIONOPTIONLIST = "DS_LAYER_CREATIONOPTIONLIST";

GDALDriverH  GDALGetDatasetDriver(GDALDatasetH ); 
char ** GDALGetFileList(GDALDatasetH );
void  GDALClose(GDALDatasetH );
int  GDALGetRasterXSize(GDALDatasetH );
int  GDALGetRasterYSize(GDALDatasetH );
int  GDALGetRasterCount(GDALDatasetH );
GDALRasterBandH  GDALGetRasterBand(GDALDatasetH , int );

CPLErr  GDALAddBand(GDALDatasetH hDS, GDALDataType eType, char **papszOptions);
GDALAsyncReaderH  GDALBeginAsyncReader(GDALDatasetH hDS, int nXOff, int nYOff, int nXSize, int nYSize, void *pBuf, int nBufXSize, int nBufYSize, GDALDataType eBufType, int nBandCount, int *panBandMap, int nPixelSpace, int nLineSpace, int nBandSpace, char **papszOptions);
void  GDALEndAsyncReader(GDALDatasetH hDS, GDALAsyncReaderH hAsynchReaderH);
CPLErr  GDALDatasetRasterIO(GDALDatasetH hDS, GDALRWFlag eRWFlag, int nDSXOff, int nDSYOff, int nDSXSize, int nDSYSize, void *pBuffer, int nBXSize, int nBYSize, GDALDataType eBDataType, int nBandCount, int *panBandCount, int nPixelSpace, int nLineSpace, int nBandSpace);
CPLErr  GDALDatasetRasterIOEx(GDALDatasetH hDS, GDALRWFlag eRWFlag, int nDSXOff, int nDSYOff, int nDSXSize, int nDSYSize, void *pBuffer, int nBXSize, int nBYSize, GDALDataType eBDataType, int nBandCount, int *panBandCount, GSpacing nPixelSpace, GSpacing nLineSpace, GSpacing nBandSpace, GDALRasterIOExtraArg *psExtraArg);
CPLErr  GDALDatasetAdviseRead(GDALDatasetH hDS, int nDSXOff, int nDSYOff, int nDSXSize, int nDSYSize, int nBXSize, int nBYSize, GDALDataType eBDataType, int nBandCount, int *panBandCount, char **papszOptions);
const(char) * GDALGetProjectionRef(GDALDatasetH );
CPLErr  GDALSetProjection(GDALDatasetH , const char *);
CPLErr  GDALGetGeoTransform(GDALDatasetH , double *);
CPLErr  GDALSetGeoTransform(GDALDatasetH , double *);

int  GDALGetGCPCount(GDALDatasetH );
const(char) * GDALGetGCPProjection(GDALDatasetH );
GDAL_GCP * GDALGetGCPs(GDALDatasetH );
CPLErr  GDALSetGCPs(GDALDatasetH , int , GDAL_GCP *, const char *);

void * GDALGetInternalHandle(GDALDatasetH , const char *);
int  GDALReferenceDataset(GDALDatasetH );
int  GDALDereferenceDataset(GDALDatasetH );

CPLErr  GDALBuildOverviews(GDALDatasetH , const char *, int , int *, int , int *, GDALProgressFunc , void *);
void  GDALGetOpenDatasets(GDALDatasetH **hDS, int *pnCount);
int  GDALGetAccess(GDALDatasetH hDS);
void  GDALFlushCache(GDALDatasetH hDS);

CPLErr  GDALCreateDatasetMaskBand(GDALDatasetH hDS, int nFlags);

CPLErr  GDALDatasetCopyWholeRaster(GDALDatasetH hSrcDS, GDALDatasetH hDstDS, char **papszOptions, GDALProgressFunc pfnProgress, void *pProgressData);

CPLErr  GDALRasterBandCopyWholeRaster(GDALRasterBandH hSrcBand, GDALRasterBandH hDstBand, char **papszOptions, GDALProgressFunc pfnProgress, void *pProgressData);

extern (C):
CPLErr  GDALRegenerateOverviews(GDALRasterBandH hSrcBand, int nOverviewCount, GDALRasterBandH *pahOverviewBands, const char *pszResampling, GDALProgressFunc pfnProgress, void *pProgressData);

int  GDALDatasetGetLayerCount(GDALDatasetH );
OGRLayerH  GDALDatasetGetLayer(GDALDatasetH , int );
OGRLayerH  GDALDatasetGetLayerByName(GDALDatasetH , const char *);
OGRErr  GDALDatasetDeleteLayer(GDALDatasetH , int );
OGRLayerH  GDALDatasetCreateLayer(GDALDatasetH , const char *, OGRSpatialReferenceH , OGRwkbGeometryType , char **);
OGRLayerH  GDALDatasetCopyLayer(GDALDatasetH , OGRLayerH , const char *, char **);
int  GDALDatasetTestCapability(GDALDatasetH , const char *);
OGRLayerH  GDALDatasetExecuteSQL(GDALDatasetH , const char *, OGRGeometryH , const char *);
void  GDALDatasetReleaseResultSet(GDALDatasetH , OGRLayerH );
OGRStyleTableH  GDALDatasetGetStyleTable(GDALDatasetH );
void  GDALDatasetSetStyleTableDirectly(GDALDatasetH , OGRStyleTableH );
void  GDALDatasetSetStyleTable(GDALDatasetH , OGRStyleTableH );
OGRErr  GDALDatasetStartTransaction(GDALDatasetH hDS, int bForce);
OGRErr  GDALDatasetCommitTransaction(GDALDatasetH hDS);
OGRErr  GDALDatasetRollbackTransaction(GDALDatasetH hDS);

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

extern (Windows):
GDALDataType  GDALGetRasterDataType(GDALRasterBandH );
void  GDALGetBlockSize(GDALRasterBandH , int *pnXSize, int *pnYSize);

CPLErr  GDALRasterAdviseRead(GDALRasterBandH hRB, int nDSXOff, int nDSYOff, 
    int nDSXSize, int nDSYSize, int nBXSize, int nBYSize, 
    GDALDataType eBDataType, char **papszOptions);

CPLErr  GDALRasterIO(GDALRasterBandH hRBand, GDALRWFlag eRWFlag, int nDSXOff, 
    int nDSYOff, int nDSXSize, int nDSYSize, void *pBuffer, int nBXSize, 
    int nBYSize, GDALDataType eBDataType, int nPixelSpace, int nLineSpace);
CPLErr  GDALRasterIOEx(GDALRasterBandH hRBand, GDALRWFlag eRWFlag, int nDSXOff,
    int nDSYOff, int nDSXSize, int nDSYSize, void *pBuffer, int nBXSize, 
    int nBYSize, GDALDataType eBDataType, GSpacing nPixelSpace, 
    GSpacing nLineSpace, GDALRasterIOExtraArg *psExtraArg);
CPLErr  GDALReadBlock(GDALRasterBandH , int , int , void *);
CPLErr  GDALWriteBlock(GDALRasterBandH , int , int , void *);
int  GDALGetRasterBandXSize(GDALRasterBandH );
int  GDALGetRasterBandYSize(GDALRasterBandH );
GDALAccess  GDALGetRasterAccess(GDALRasterBandH );
int  GDALGetBandNumber(GDALRasterBandH );
GDALDatasetH  GDALGetBandDataset(GDALRasterBandH );

GDALColorInterp  GDALGetRasterColorInterpretation(GDALRasterBandH );
CPLErr  GDALSetRasterColorInterpretation(GDALRasterBandH , GDALColorInterp );
GDALColorTableH  GDALGetRasterColorTable(GDALRasterBandH );
CPLErr  GDALSetRasterColorTable(GDALRasterBandH , GDALColorTableH );
int  GDALHasArbitraryOverviews(GDALRasterBandH );
int  GDALGetOverviewCount(GDALRasterBandH );
GDALRasterBandH  GDALGetOverview(GDALRasterBandH , int );
double  GDALGetRasterNoDataValue(GDALRasterBandH , int *);
CPLErr  GDALSetRasterNoDataValue(GDALRasterBandH , double );
CPLErr  GDALDeleteRasterNoDataValue(GDALRasterBandH );
char ** GDALGetRasterCategoryNames(GDALRasterBandH );
CPLErr  GDALSetRasterCategoryNames(GDALRasterBandH , char **);
double  GDALGetRasterMinimum(GDALRasterBandH , int *pbSuccess);
double  GDALGetRasterMaximum(GDALRasterBandH , int *pbSuccess);
CPLErr  GDALGetRasterStatistics(GDALRasterBandH , int bApproxOK, int bForce, 
    double *pdfMin, double *pdfMax, double *pdfMean, double *pdfStdDev);
CPLErr  GDALComputeRasterStatistics(GDALRasterBandH , int bApproxOK, double 
    *pdfMin, double *pdfMax, double *pdfMean, double *pdfStdDev, 
    GDALProgressFunc pfnProgress, void *pProgressData);
CPLErr  GDALSetRasterStatistics(GDALRasterBandH hBand, double dfMin, 
    double dfMax, double dfMean, double dfStdDev);

const(char) * GDALGetRasterUnitType(GDALRasterBandH );
CPLErr  GDALSetRasterUnitType(GDALRasterBandH hBand, const char *pszNewValue);
double  GDALGetRasterOffset(GDALRasterBandH , int *pbSuccess);
CPLErr  GDALSetRasterOffset(GDALRasterBandH hBand, double dfNewOffset);
double  GDALGetRasterScale(GDALRasterBandH , int *pbSuccess);
CPLErr  GDALSetRasterScale(GDALRasterBandH hBand, double dfNewOffset);
void  GDALComputeRasterMinMax(GDALRasterBandH hBand, int bApproxOK, 
    double *adfMinMax);
CPLErr  GDALFlushRasterCache(GDALRasterBandH hBand);
CPLErr  GDALGetRasterHistogram(GDALRasterBandH hBand, double dfMin, 
    double dfMax, int nBuckets, int *panHistogram, int bIncludeOutOfRange, 
    int bApproxOK, GDALProgressFunc pfnProgress, void *pProgressData);
CPLErr  GDALGetRasterHistogramEx(GDALRasterBandH hBand, double dfMin, 
    double dfMax, int nBuckets, GUIntBig *panHistogram, int bIncludeOutOfRange, 
    int bApproxOK, GDALProgressFunc pfnProgress, void *pProgressData);
CPLErr  GDALGetDefaultHistogram(GDALRasterBandH hBand, double *pdfMin, 
    double *pdfMax, int *pnBuckets, int **ppanHistogram, int bForce, 
    GDALProgressFunc pfnProgress, void *pProgressData);
CPLErr  GDALGetDefaultHistogramEx(GDALRasterBandH hBand, double *pdfMin, 
    double *pdfMax, int *pnBuckets, GUIntBig **ppanHistogram, int bForce, 
    GDALProgressFunc pfnProgress, void *pProgressData);
CPLErr  GDALSetDefaultHistogram(GDALRasterBandH hBand, double dfMin, 
    double dfMax, int nBuckets, int *panHistogram);
CPLErr  GDALSetDefaultHistogramEx(GDALRasterBandH hBand, double dfMin, 
    double dfMax, int nBuckets, GUIntBig *panHistogram);
int  GDALGetRandomRasterSample(GDALRasterBandH , int , float *);
GDALRasterBandH  GDALGetRasterSampleOverview(GDALRasterBandH , int );
GDALRasterBandH  GDALGetRasterSampleOverviewEx(GDALRasterBandH , GUIntBig );
CPLErr  GDALFillRaster(GDALRasterBandH hBand, double dfRealValue, 
    double dfImaginaryValue);
CPLErr  GDALComputeBandStats(GDALRasterBandH hBand, int nSampleStep, 
    double *pdfMean, double *pdfStdDev, GDALProgressFunc pfnProgress, 
    void *pProgressData);

extern (C):
CPLErr  GDALOverviewMagnitudeCorrection(GDALRasterBandH hBaseBand, 
    int nOverviewCount, GDALRasterBandH *pahOverviews, 
    GDALProgressFunc pfnProgress, void *pProgressData);

extern (Windows):
GDALRasterAttributeTableH  GDALGetDefaultRAT(GDALRasterBandH hBand);
CPLErr  GDALSetDefaultRAT(GDALRasterBandH , GDALRasterAttributeTableH );
CPLErr  GDALAddDerivedBandPixelFunc(const char *pszName, 
    GDALDerivedPixelFunc pfnPixelFunc);

GDALRasterBandH  GDALGetMaskBand(GDALRasterBandH hBand);
int  GDALGetMaskFlags(GDALRasterBandH hBand);
CPLErr  GDALCreateMaskBand(GDALRasterBandH hBand, int nFlags);

enum GMF_ALL_VALID   = 0x01;
enum GMF_PER_DATASET = 0x02;
enum GMF_ALPHA       = 0x04;
enum GMF_NODATA      = 0x08;
/* ==================================================================== */
/*     GDALAsyncReader                                                  */
/* ==================================================================== */

GDALAsyncStatusType  GDALARGetNextUpdatedRegion(GDALAsyncReaderH hARIO, 
    double dfTimeout, int *pnXBufOff, int *pnYBufOff, int *pnXBufSize, 
    int *pnYBufSize);
int  GDALARLockBuffer(GDALAsyncReaderH hARIO, double dfTimeout);
void  GDALARUnlockBuffer(GDALAsyncReaderH hARIO);

/* -------------------------------------------------------------------- */
/*      Helper functions.                                               */
/* -------------------------------------------------------------------- */
int  GDALGeneralCmdLineProcessor(int nArgc, char ***ppapszArgv, int nOptions);
void  GDALSwapWords(void *pData, int nWordSize, int nWordCount, int nWordSkip);
void  GDALSwapWordsEx(void *pData, int nWordSize, size_t nWordCount, 
    int nWordSkip);

void  GDALCopyWords(void *pSrcData, GDALDataType eSrcType, int nSrcPixelOffset, 
    void *pDstData, GDALDataType eDstType, int nDstPixelOffset, int nWordCount);

extern (C):
void  GDALCopyBits(GByte *pabySrcData, int nSrcOffset, int nSrcStep, 
    GByte *pabyDstData, int nDstOffset, int nDstStep, int nBitCount, 
    int nStepCount);

extern (Windows):
int  GDALLoadWorldFile(const char *, double *);
int  GDALReadWorldFile(const char *, const char *, double *);
int  GDALWriteWorldFile(const char *, const char *, double *);
int  GDALLoadTabFile(const char *, double *, char **, int *, GDAL_GCP **);
int  GDALReadTabFile(const char *, double *, char **, int *, GDAL_GCP **);
int  GDALLoadOziMapFile(const char *, double *, char **, int *, GDAL_GCP **);
int  GDALReadOziMapFile(const char *, double *, char **, int *, GDAL_GCP **);

const(char) * GDALDecToDMS(double , const char *, int );
double  GDALPackedDMSToDec(double );
double  GDALDecToPackedDMS(double );

/* Note to developers : please keep this section in sync with ogr_core.h */
const(char)* GDALVersionInfo( const char * );
int GDALCheckVersion( int nVersionMajor, int nVersionMinor,
    const char* pszCallingComponentName);

/** Helper macro for GDALCheckVersion()
  @see GDALCheckVersion()
  */
void GDAL_CHECK_VERSION(const char* pszCallingComponentName)
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
extern (Windows):
int  GDALExtractRPCInfo(char **, GDALRPCInfo *);

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

extern (Windows):
GDALColorTableH  GDALCreateColorTable(GDALPaletteInterp );
void  GDALDestroyColorTable(GDALColorTableH );
GDALColorTableH  GDALCloneColorTable(GDALColorTableH );
GDALPaletteInterp  GDALGetPaletteInterpretation(GDALColorTableH );
int  GDALGetColorEntryCount(GDALColorTableH );
GDALColorEntry * GDALGetColorEntry(GDALColorTableH , int );
int  GDALGetColorEntryAsRGB(GDALColorTableH , int , GDALColorEntry *);
void  GDALSetColorEntry(GDALColorTableH , int , GDALColorEntry *);
void  GDALCreateColorRamp(GDALColorTableH hTable, int nStartIndex, 
    GDALColorEntry *psStartColor, int nEndIndex, GDALColorEntry *psEndColor);

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

extern (Windows):
GDALRasterAttributeTableH  GDALCreateRasterAttributeTable();
void  GDALDestroyRasterAttributeTable(GDALRasterAttributeTableH );

int  GDALRATGetColumnCount(GDALRasterAttributeTableH );

const(char) * GDALRATGetNameOfCol(GDALRasterAttributeTableH , int );
GDALRATFieldUsage  GDALRATGetUsageOfCol(GDALRasterAttributeTableH , int );
GDALRATFieldType  GDALRATGetTypeOfCol(GDALRasterAttributeTableH , int );

int  GDALRATGetColOfUsage(GDALRasterAttributeTableH , GDALRATFieldUsage );
int  GDALRATGetRowCount(GDALRasterAttributeTableH );

const(char) * GDALRATGetValueAsString(GDALRasterAttributeTableH , int , int );
int  GDALRATGetValueAsInt(GDALRasterAttributeTableH , int , int );
double  GDALRATGetValueAsDouble(GDALRasterAttributeTableH , int , int );

void  GDALRATSetValueAsString(GDALRasterAttributeTableH , int , int , const char *);
void  GDALRATSetValueAsInt(GDALRasterAttributeTableH , int , int , int );
void  GDALRATSetValueAsDouble(GDALRasterAttributeTableH , int , int , double );

int  GDALRATChangesAreWrittenToFile(GDALRasterAttributeTableH hRAT);

CPLErr  GDALRATValuesIOAsDouble(GDALRasterAttributeTableH hRAT, 
    GDALRWFlag eRWFlag, int iField, int iStartRow, int iLength, 
    double *pdfData);
CPLErr  GDALRATValuesIOAsInteger(GDALRasterAttributeTableH hRAT, 
    GDALRWFlag eRWFlag, int iField, int iStartRow, int iLength, int *pnData);
CPLErr  GDALRATValuesIOAsString(GDALRasterAttributeTableH hRAT, 
    GDALRWFlag eRWFlag, int iField, int iStartRow, int iLength, 
    char **papszStrList);

void  GDALRATSetRowCount(GDALRasterAttributeTableH , int );
CPLErr  GDALRATCreateColumn(GDALRasterAttributeTableH , const char *,
 GDALRATFieldType , GDALRATFieldUsage );
CPLErr  GDALRATSetLinearBinning(GDALRasterAttributeTableH , double , double );
int  GDALRATGetLinearBinning(GDALRasterAttributeTableH , double *, double *);
CPLErr  GDALRATInitializeFromColorTable(GDALRasterAttributeTableH , 
    GDALColorTableH );
GDALColorTableH  GDALRATTranslateToColorTable(GDALRasterAttributeTableH , 
    int nEntryCount);
void  GDALRATDumpReadable(GDALRasterAttributeTableH , FILE *);
GDALRasterAttributeTableH  GDALRATClone(GDALRasterAttributeTableH );

void * GDALRATSerializeJSON(GDALRasterAttributeTableH );

int  GDALRATGetRowOfValue(GDALRasterAttributeTableH , double );

/* ==================================================================== */
/*      GDAL Cache Management                                           */
/* ==================================================================== */

void  GDALSetCacheMax(int nBytes);
int  GDALGetCacheMax();
int  GDALGetCacheUsed();
void  GDALSetCacheMax64(GIntBig nBytes);
GIntBig  GDALGetCacheMax64();
GIntBig  GDALGetCacheUsed64();
int  GDALFlushCacheBlock();

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
    GDALRasterBandH *pahInputSpectralBands);

/* =================================================================== */
/*      Misc API                                                        */
/* ==================================================================== */

CPLXMLNode * GDALGetJPEG2000Structure(const char *pszFilename, char **papszOptions);
