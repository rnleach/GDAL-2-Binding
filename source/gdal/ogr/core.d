/* Converted to D from C:/devLibs/gdal21/include/ogr_core.h by htod */
module gdal.ogr.core;
/******************************************************************************
 * $Id: ogr_core.h 33680 2016-03-08 09:59:03Z rouault $
 *
 * Project:  OpenGIS Simple Features Reference Implementation
 * Purpose:  Define some core portability services for cross-platform OGR code.
 * Author:   Frank Warmerdam, warmerdam@pobox.com
 *
 ******************************************************************************
 * Copyright (c) 1999, Frank Warmerdam
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

import gdal.cpl.port;
import gdal.gdalversion;

/**
 * \file
 *
 * Core portability services for cross-platform OGR code.
 */

/**
 * Simple container for a bounding region.
 */
struct _N1
{
    double MinX;
    double MaxX;
    double MinY;
    double MaxY;
}
extern (C):
alias _N1 OGREnvelope;

/**
 * Simple container for a bounding region in 3D.
 */
struct _N2
{
    double MinX;
    double MaxX;
    double MinY;
    double MaxY;
    double MinZ;
    double MaxZ;
}
alias _N2 OGREnvelope3D;

void * OGRMalloc(size_t );
void * OGRCalloc(size_t , size_t );
void * OGRRealloc(void *, size_t );
char * OGRStrdup(char *);
void  OGRFree(void *);

alias int OGRErr;

enum OGRERR_NONE                      = 0;
enum OGRERR_NOT_ENOUGH_DATA           = 1;
enum OGRERR_NOT_ENOUGH_MEMORY         = 2;
enum OGRERR_UNSUPPORTED_GEOMETRY_TYPE = 3;
enum OGRERR_UNSUPPORTED_OPERATION     = 4;
enum OGRERR_CORRUPT_DATA              = 5;
enum OGRERR_FAILURE                   = 6;
enum OGRERR_UNSUPPORTED_SRS           = 7;
enum OGRERR_INVALID_HANDLE            = 8;
enum OGRERR_NON_EXISTING_FEATURE      = 9;
alias int OGRBoolean;

/* -------------------------------------------------------------------- */
/*      ogr_geometry.h related definitions.                             */
/* -------------------------------------------------------------------- */

/**
 * List of well known binary geometry types.  These are used within the BLOBs
 * but are also returned from OGRGeometry::getGeometryType() to identify the
 * type of a geometry object.
 */
enum
{
    wkbUnknown               =    0,
    wkbPoint                 =    1,
    wkbLineString            =    2,
    wkbPolygon               =    3,
    wkbMultiPoint            =    4,
    wkbMultiLineString       =    5,
    wkbMultiPolygon          =    6,
    wkbGeometryCollection    =    7,
    wkbCircularString        =    8,
    wkbCompoundCurve         =    9,
    wkbCurvePolygon          =   10,
    wkbMultiCurve            =   11,
    wkbMultiSurface          =   12,
    wkbCurve                 =   13,
    wkbSurface               =   14,
    wkbPolyhedralSurface     =   15,
    wkbTIN                   =   16,
    wkbTriangle              =   17,
    wkbNone                  =  100,
    wkbLinearRing            =  101,
    wkbCircularStringZ       = 1008,
    wkbCompoundCurveZ        = 1009,
    wkbCurvePolygonZ         = 1010,
    wkbMultiCurveZ           = 1011,
    wkbMultiSurfaceZ         = 1012,
    wkbCurveZ                = 1013,
    wkbSurfaceZ              = 1014,
    wkbPolyhedralSurfaceZ    = 1015,
    wkbTINZ                  = 1016,
    wkbTriangleZ             = 1017,
    wkbPointM                = 2001,
    wkbLineStringM           = 2002,
    wkbPolygonM              = 2003,
    wkbMultiPointM           = 2004,
    wkbMultiLineStringM      = 2005,
    wkbMultiPolygonM         = 2006,
    wkbGeometryCollectionM   = 2007,
    wkbCircularStringM       = 2008,
    wkbCompoundCurveM        = 2009,
    wkbCurvePolygonM         = 2010,
    wkbMultiCurveM           = 2011,
    wkbMultiSurfaceM         = 2012,
    wkbCurveM                = 2013,
    wkbSurfaceM              = 2014,
    wkbPolyhedralSurfaceM    = 2015,
    wkbTINM                  = 2016,
    wkbTriangleM             = 2017,
    wkbPointZM               = 3001,
    wkbLineStringZM          = 3002,
    wkbPolygonZM             = 3003,
    wkbMultiPointZM          = 3004,
    wkbMultiLineStringZM     = 3005,
    wkbMultiPolygonZM        = 3006,
    wkbGeometryCollectionZM  = 3007,
    wkbCircularStringZM      = 3008,
    wkbCompoundCurveZM       = 3009,
    wkbCurvePolygonZM        = 3010,
    wkbMultiCurveZM          = 3011,
    wkbMultiSurfaceZM        = 3012,
    wkbCurveZM               = 3013,
    wkbSurfaceZM             = 3014,
    wkbPolyhedralSurfaceZM   = 3015,
    wkbTINZM                 = 3016,
    wkbTriangleZM            = 3017,
    wkbPoint25D              = -2147483647, // 0x80000001
    wkbLineString25D         = -2147483646, // 0x80000002
    wkbPolygon25D            = -2147483645, // 0x80000003
    wkbMultiPoint25D         = -2147483644, // 0x80000004
    wkbMultiLineString25D    = -2147483643, // 0x80000005
    wkbMultiPolygon25D       = -2147483642, // 0x80000006
    wkbGeometryCollection25D = -2147483641, // 0x80000007
}
alias int OGRwkbGeometryType;

/**
 * Output variants of WKB we support.
 *
 * 99-402 was a short-lived extension to SFSQL 1.1 that used a high-bit flag
 * to indicate the presence of Z coordinates in a WKB geometry.
 *
 * SQL/MM Part 3 and SFSQL 1.2 use offsets of 1000 (Z), 2000 (M) and 3000 (ZM)
 * to indicate the present of higher dimensional coordinates in a WKB geometry.
 * Reference: <a href="https://portal.opengeospatial.org/files/?artifact_id=320243">
 * 09-009_Committee_Draft_ISOIEC_CD_13249-3_SQLMM_Spatial.pdf</a>,
 * ISO/IEC JTC 1/SC 32 N 1820, ISO/IEC CD 13249-3:201x(E), Date: 2009-01-16.
 * The codes are also found in §8.2.3 of <a href="http://portal.opengeospatial.org/files/?artifact_id=25355">
 * OGC 06-103r4 "OpenGIS® Implementation Standard for Geographic information - Simple feature access - Part 1: Common architecture", v1.2.1</a>
 */
enum
{
    wkbVariantOldOgc,    /**< Old-style 99-402 extended dimension (Z) WKB types */
    wkbVariantIso,       /**< SFSQL 1.2 and ISO SQL/MM Part 3 extended dimension (Z&M) WKB types */
    wkbVariantPostGIS1,  /**< PostGIS 1.X has different codes for CurvePolygon, MultiCurve and MultiSurface */
}
alias int OGRwkbVariant;

/** @deprecated in GDAL 2.0. Use wkbHasZ() or wkbSetZ() instead */
deprecated enum wkb25DBit = 0x80000000;

/** Return the 2D geometry type corresponding to the specified geometry type */
alias wkbFlatten = OGR_GT_Flatten;

/** Return if the geometry type is a 3D geometry type
  * @since GDAL 2.0
  */
bool  wkbHasZ(OGRwkbGeometryType x) { return OGR_GT_HasZ(x) != 0; }

/** Return the 3D geometry type corresponding to the specified geometry type.
  * @since GDAL 2.0
  */
alias wkbSetZ = OGR_GT_SetZ;

/** Return if the geometry type is a measured geometry type
  * @since GDAL 2.1
  */
bool wkbHasM(OGRwkbGeometryType x) { return OGR_GT_HasM(x) != 0; }

/** Return the measured geometry type corresponding to the specified geometry type.
  * @since GDAL 2.1
  */
alias wkbSetM = OGR_GT_SetM;

enum ogrZMarker = 0x21125711;

char * OGRGeometryTypeToName(OGRwkbGeometryType eType);
OGRwkbGeometryType  OGRMergeGeometryTypes(OGRwkbGeometryType eMain, OGRwkbGeometryType eExtra);
OGRwkbGeometryType  OGRMergeGeometryTypesEx(OGRwkbGeometryType eMain, OGRwkbGeometryType eExtra, int bAllowPromotingToCurves);
OGRwkbGeometryType  OGR_GT_Flatten(OGRwkbGeometryType eType);
OGRwkbGeometryType  OGR_GT_SetZ(OGRwkbGeometryType eType);
OGRwkbGeometryType  OGR_GT_SetM(OGRwkbGeometryType eType);
OGRwkbGeometryType  OGR_GT_SetModifier(OGRwkbGeometryType eType, int bSetZ, int bSetM);
int  OGR_GT_HasZ(OGRwkbGeometryType eType);
int  OGR_GT_HasM(OGRwkbGeometryType eType);
int  OGR_GT_IsSubClassOf(OGRwkbGeometryType eType, OGRwkbGeometryType eSuperType);
int  OGR_GT_IsCurve(OGRwkbGeometryType );
int  OGR_GT_IsSurface(OGRwkbGeometryType );
int  OGR_GT_IsNonLinear(OGRwkbGeometryType );
OGRwkbGeometryType  OGR_GT_GetCollection(OGRwkbGeometryType eType);
OGRwkbGeometryType  OGR_GT_GetCurve(OGRwkbGeometryType eType);
OGRwkbGeometryType  OGR_GT_GetLinear(OGRwkbGeometryType eType);

enum
{
    wkbXDR,  /* MSB/Sun/Motoroloa: Most Significant Byte First   */
    wkbNDR,  /* LSB/Intel/Vax: Least Significant Byte First      */
}
alias int OGRwkbByteOrder;



/** Alter field name.
 * Used by OGR_L_AlterFieldDefn().
 */
enum ALTER_NAME_FLAG = 0x1;

/** Alter field type.
 * Used by OGR_L_AlterFieldDefn().
 */
enum ALTER_TYPE_FLAG = 0x2;

/** Alter field width and precision.
 * Used by OGR_L_AlterFieldDefn().
 */
enum ALTER_WIDTH_PRECISION_FLAG = 0x4;

/** Alter field NOT NULL constraint.
 * Used by OGR_L_AlterFieldDefn().
 * @since GDAL 2.0
 */
enum ALTER_NULLABLE_FLAG = 0x8;

/** Alter field DEFAULT value.
 * Used by OGR_L_AlterFieldDefn().
 * @since GDAL 2.0
 */
enum ALTER_DEFAULT_FLAG = 0x10;

/** Alter all parameters of field definition.
 * Used by OGR_L_AlterFieldDefn().
 */
enum ALTER_ALL_FLAG = (ALTER_NAME_FLAG | ALTER_TYPE_FLAG | ALTER_WIDTH_PRECISION_FLAG | ALTER_NULLABLE_FLAG | ALTER_DEFAULT_FLAG);


/** Validate that fields respect not-null constraints.
 * Used by OGR_F_Validate().
 * @since GDAL 2.0
 */
enum OGR_F_VAL_NULL = 0x00000001;

/** Validate that geometries respect geometry column type.
 * Used by OGR_F_Validate().
 * @since GDAL 2.0
 */
enum OGR_F_VAL_GEOM_TYPE = 0x00000002;

/** Validate that (string) fields respect field width.
 * Used by OGR_F_Validate().
 * @since GDAL 2.0
 */
enum OGR_F_VAL_WIDTH = 0x00000004;

/** Allow fields that are null when there's an associated default value.
 * This can be used for drivers where the low-level layers will automatically set the
 * field value to the associated default value.
 * This flag only makes sense if OGR_F_VAL_NULL is set too.
 * Used by OGR_F_Validate().
 * @since GDAL 2.0
 */
enum OGR_F_VAL_ALLOW_NULL_WHEN_DEFAULT = 0x00000008;

/** Allow geometry fields to have a different coordinate dimension that their
 * geometry column type.
 * This flag only makes sense if OGR_F_VAL_GEOM_TYPE is set too.
 * Used by OGR_F_Validate().
 * @since GDAL 2.1
 */
enum OGR_F_VAL_ALLOW_DIFFERENT_GEOM_DIM = 0x00000010;

/** Enable all validation tests (except OGR_F_VAL_ALLOW_DIFFERENT_GEOM_DIM)
 * Used by OGR_F_Validate().
 * @since GDAL 2.0
 */
enum OGR_F_VAL_ALL = (0x7FFFFFFF & ~OGR_F_VAL_ALLOW_DIFFERENT_GEOM_DIM);

/************************************************************************/
/*                  ogr_feature.h related definitions.                  */
/************************************************************************/

/**
 * List of feature field types.  This list is likely to be extended in the
 * future ... avoid coding applications based on the assumption that all
 * field types can be known.
 */
enum
{
    OFTInteger        =  0, /** Simple 32bit integer */
    OFTIntegerList    =  1, /** List of 32bit integers */
    OFTReal           =  2, /** Double Precision floating point */
    OFTRealList       =  3, /** List of doubles */
    OFTString         =  4, /** String of ASCII chars */
    OFTStringList     =  5, /** Array of strings */
    OFTWideString     =  6, /** deprecated */
    OFTWideStringList =  7, /** deprecated */
    OFTBinary         =  8, /** Raw Binary data */
    OFTDate           =  9, /** Date */
    OFTTime           = 10, /** Time */
    OFTDateTime       = 11, /** Date and Time */
    OFTInteger64      = 12, /** Single 64bit integer */
    OFTInteger64List  = 13, /** List of 64bit integers */
    OFTMaxType        = 13,
}
alias int OGRFieldType;

/**
 * List of field subtypes. A subtype represents a hint, a restriction of the
 * main type, that is not strictly necessary to consult.
 * This list is likely to be extended in the
 * future ... avoid coding applications based on the assumption that all
 * field types can be known.
 * Most subtypes only make sense for a restricted set of main types.
 * @since GDAL 2.0
 */
enum
{
    OFSTNone       = 0, /** No subtype. This is the default value                                             */
    OFSTBoolean    = 1, /** Boolean integer. Only valid for OFTInteger and OFTIntegerList.                    */
    OFSTInt16      = 2, /** Signed 16-bit integer. Only valid for OFTInteger and OFTIntegerList.              */
    OFSTFloat32    = 3, /** Single precision (32 bit) floating point. Only valid for OFTReal and OFTRealList. */
    OFSTMaxSubType = 3,
}
alias int OGRFieldSubType;

/**
 * Display justification for field values.
 */
enum
{
    OJUndefined = 0,
    OJLeft      = 1,
    OJRight     = 2,
}
alias int OGRJustification;

const OGRNullFID = -1;
const OGRUnsetMarker = -21121;
/************************************************************************/
/*                               OGRField                               */
/************************************************************************/

/**
 * OGRFeature field attribute value union.
 */
struct _N10
{
    int nCount;
    int *paList;
}
alias _N10 IntegerList;

struct _N11
{
    int nCount;
    GIntBig *paList;
}
alias _N11 Integer64List;

struct _N12
{
    int nCount;
    double *paList;
}
alias _N12 RealList;

struct _N13
{
    int nCount;
    char **paList;
}
alias _N13 StringList;

struct _N14
{
    int nCount;
    GByte *paData;
}
alias _N14 Binary;

struct _N15
{
    int nMarker1;
    int nMarker2;
}
alias _N15 Set;

struct _N16
{
    GInt16 Year;
    GByte Month;
    GByte Day;
    GByte Hour;
    GByte Minute;
    GByte TZFlag;   /* 0=unknown, 1=localtime(ambiguous), 100=GMT, 104=GMT+1, 80=GMT-5, etc                        */
    GByte Reserved; /* must be set to 0                                                                            */
    float Second;   /* with millisecond accuracy. at the end of the structure, so as to keep it 12 bytes on 32 bit */
} 
alias _N16 Date;

union _N9
{
    int Integer;
    GIntBig Integer64;
    double Real;
    char *String;
    _N10 IntegerList;
    _N11 Integer64List;
    _N12 RealList;
    _N13 StringList;
    _N14 Binary;
    _N15 Set;
    _N16 Date;
}
alias _N9 OGRField;

int OGR_GET_MS(double floatingpoint_sec)
{ 
  return 
    cast(int)((floatingpoint_sec - cast(int)(floatingpoint_sec)) * 1000 + 0.5);
}

int  OGRParseDate(char *pszInput, OGRField *psOutput, int nOptions);

/* -------------------------------------------------------------------- */
/*      Constants from ogrsf_frmts.h for capabilities.                  */
/* -------------------------------------------------------------------- */
enum OLCRandomRead           = "RandomRead";
enum OLCSequentialWrite      = "SequentialWrite";
enum OLCRandomWrite          = "RandomWrite";
enum OLCFastSpatialFilter    = "FastSpatialFilter";
enum OLCFastFeatureCount     = "FastFeatureCount";
enum OLCFastGetExtent        = "FastGetExtent";
enum OLCCreateField          = "CreateField";
enum OLCDeleteField          = "DeleteField";
enum OLCReorderFields        = "ReorderFields";
enum OLCAlterFieldDefn       = "AlterFieldDefn";
enum OLCTransactions         = "Transactions";
enum OLCDeleteFeature        = "DeleteFeature";
enum OLCFastSetNextByIndex   = "FastSetNextByIndex";
enum OLCStringsAsUTF8        = "StringsAsUTF8";
enum OLCIgnoreFields         = "IgnoreFields";
enum OLCCreateGeomField      = "CreateGeomField";
enum OLCCurveGeometries      = "CurveGeometries";
enum OLCMeasuredGeometries   = "MeasuredGeometries";
enum ODsCCreateLayer         = "CreateLayer";
enum ODsCDeleteLayer         = "DeleteLayer";
enum ODsCCreateGeomFieldAfterCreateLayer    = "CreateGeomFieldAfterCreateLayer";
enum ODsCCurveGeometries     = "CurveGeometries";
enum ODsCTransactions        = "Transactions";
enum ODsCEmulatedTransactions  = "EmulatedTransactions";
enum ODsCMeasuredGeometries  = "MeasuredGeometries";
enum ODrCCreateDataSource    = "CreateDataSource";
enum ODrCDeleteDataSource    = "DeleteDataSource";

/* -------------------------------------------------------------------- */
/*      Layer metadata items.                                           */
/* -------------------------------------------------------------------- */
/** Capability set to YES as metadata on a layer that has features with
  * 64 bit identifiers.
  @since GDAL 2.0
  */
enum OLMD_FID64 = "OLMD_FID64";

/************************************************************************/
/*                  ogr_featurestyle.h related definitions.             */
/************************************************************************/

/**
 * OGRStyleTool derived class types (returned by GetType()).
 */
enum ogr_style_tool_class_id
{
    OGRSTCNone   = 0,
    OGRSTCPen    = 1,
    OGRSTCBrush  = 2,
    OGRSTCSymbol = 3,
    OGRSTCLabel  = 4,
    OGRSTCVector = 5,
}
alias ogr_style_tool_class_id OGRSTClassId;

/**
 * List of units supported by OGRStyleTools.
 */
enum ogr_style_tool_units_id
{
    OGRSTUGround = 0,
    OGRSTUPixel  = 1,
    OGRSTUPoints = 2,
    OGRSTUMM     = 3,
    OGRSTUCM     = 4,
    OGRSTUInches = 5,
}
alias ogr_style_tool_units_id OGRSTUnitId;

/**
 * List of parameters for use with OGRStylePen.
 */
enum ogr_style_tool_param_pen_id
{
    OGRSTPenColor     = 0,
    OGRSTPenWidth     = 1,
    OGRSTPenPattern   = 2,
    OGRSTPenId        = 3,
    OGRSTPenPerOffset = 4,
    OGRSTPenCap       = 5,
    OGRSTPenJoin      = 6,
    OGRSTPenPriority  = 7,
    OGRSTPenLast      = 8,
}
alias ogr_style_tool_param_pen_id OGRSTPenParam;

/**
 * List of parameters for use with OGRStyleBrush.
 */
enum ogr_style_tool_param_brush_id
{
    OGRSTBrushFColor   = 0,
    OGRSTBrushBColor   = 1,
    OGRSTBrushId       = 2,
    OGRSTBrushAngle    = 3,
    OGRSTBrushSize     = 4,
    OGRSTBrushDx       = 5,
    OGRSTBrushDy       = 6,
    OGRSTBrushPriority = 7,
    OGRSTBrushLast     = 8,
}
alias ogr_style_tool_param_brush_id OGRSTBrushParam;


/**
 * List of parameters for use with OGRStyleSymbol.
 */
enum ogr_style_tool_param_symbol_id
{
    OGRSTSymbolId       =  0,
    OGRSTSymbolAngle    =  1,
    OGRSTSymbolColor    =  2,
    OGRSTSymbolSize     =  3,
    OGRSTSymbolDx       =  4,
    OGRSTSymbolDy       =  5,
    OGRSTSymbolStep     =  6,
    OGRSTSymbolPerp     =  7,
    OGRSTSymbolOffset   =  8,
    OGRSTSymbolPriority =  9,
    OGRSTSymbolFontName = 10,
    OGRSTSymbolOColor   = 11,
    OGRSTSymbolLast     = 12,
}
alias ogr_style_tool_param_symbol_id OGRSTSymbolParam;

/**
 * List of parameters for use with OGRStyleLabel.
 */
enum ogr_style_tool_param_label_id
{
    OGRSTLabelFontName   =  0,
    OGRSTLabelSize       =  1,
    OGRSTLabelTextString =  2,
    OGRSTLabelAngle      =  3,
    OGRSTLabelFColor     =  4,
    OGRSTLabelBColor     =  5,
    OGRSTLabelPlacement  =  6,
    OGRSTLabelAnchor     =  7,
    OGRSTLabelDx         =  8,
    OGRSTLabelDy         =  9,
    OGRSTLabelPerp       = 10,
    OGRSTLabelBold       = 11,
    OGRSTLabelItalic     = 12,
    OGRSTLabelUnderline  = 13,
    OGRSTLabelPriority   = 14,
    OGRSTLabelStrikeout  = 15,
    OGRSTLabelStretch    = 16,
    OGRSTLabelAdjHor     = 17,
    OGRSTLabelAdjVert    = 18,
    OGRSTLabelHColor     = 19,
    OGRSTLabelOColor     = 20,
    OGRSTLabelLast       = 21,
}
alias ogr_style_tool_param_label_id OGRSTLabelParam;

/* ------------------------------------------------------------------- */
/*                        Version checking                             */
/* -------------------------------------------------------------------- */

/* Note to developers : please keep this section in sync with gdal.h */

extern (Windows):
char * GDALVersionInfo(char *);


/** Return TRUE if GDAL library version at runtime matches nVersionMajor.nVersionMinor.

    The purpose of this method is to ensure that calling code will run with the GDAL
    version it is compiled for. It is primarily indented for external plugins.

    @param nVersionMajor Major version to be tested against
    @param nVersionMinor Minor version to be tested against
    @param pszCallingComponentName If not NULL, in case of version mismatch, the method
                                   will issue a failure mentioning the name of
                                   the calling component.
  */
int  GDALCheckVersion(int nVersionMajor, int nVersionMinor, char *pszCallingComponentName);

/** Helper macro for GDALCheckVersion */



