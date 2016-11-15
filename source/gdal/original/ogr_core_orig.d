/* Converted to D from C:/devLibs/gdal21/include/ogr_core.h by htod */
module ./ogrcore;
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

//C     #ifndef OGR_CORE_H_INCLUDED
//C     #define OGR_CORE_H_INCLUDED

//C     #include "cpl_port.h"
import cpl_port;
//C     #include "gdal_version.h"
import gdal_version;

/**
 * \file
 *
 * Core portability services for cross-platform OGR code.
 */

/**
 * Simple container for a bounding region.
 */

//C     #if defined(__cplusplus) && !defined(CPL_SUPRESS_CPLUSPLUS)
//C     class CPL_DLL OGREnvelope
//C     {
//C       public:
//C             OGREnvelope() : MinX(0.0), MaxX(0.0), MinY(0.0), MaxY(0.0)
//C             {
//C             }

//C             OGREnvelope(const OGREnvelope& oOther) :
//C                 MinX(oOther.MinX),MaxX(oOther.MaxX), MinY(oOther.MinY), MaxY(oOther.MaxY)
//C             {
//C             }

//C         double      MinX;
//C         double      MaxX;
//C         double      MinY;
//C         double      MaxY;

//C     #ifdef HAVE_GCC_DIAGNOSTIC_PUSH
//C     #pragma GCC diagnostic push
//C     #pragma GCC diagnostic ignored "-Wfloat-equal"
//C     #endif
//C         int  IsInit() const { return MinX != 0 || MinY != 0 || MaxX != 0 || MaxY != 0; }

//C     #ifdef HAVE_GCC_DIAGNOSTIC_PUSH
//C     #pragma GCC diagnostic pop
//C     #endif

//C         void Merge( OGREnvelope const& sOther ) {
//C             if( IsInit() )
//C             {
//C                 MinX = MIN(MinX,sOther.MinX);
//C                 MaxX = MAX(MaxX,sOther.MaxX);
//C                 MinY = MIN(MinY,sOther.MinY);
//C                 MaxY = MAX(MaxY,sOther.MaxY);
//C             }
//C             else
//C             {
//C                 MinX = sOther.MinX;
//C                 MaxX = sOther.MaxX;
//C                 MinY = sOther.MinY;
//C                 MaxY = sOther.MaxY;
//C             }
//C         }
//C         void Merge( double dfX, double dfY ) {
//C             if( IsInit() )
//C             {
//C                 MinX = MIN(MinX,dfX);
//C                 MaxX = MAX(MaxX,dfX);
//C                 MinY = MIN(MinY,dfY);
//C                 MaxY = MAX(MaxY,dfY);
//C             }
//C             else
//C             {
//C                 MinX = MaxX = dfX;
//C                 MinY = MaxY = dfY;
//C             }
//C         }

//C         void Intersect( OGREnvelope const& sOther ) {
//C             if(Intersects(sOther))
//C             {
//C                 if( IsInit() )
//C                 {
//C                     MinX = MAX(MinX,sOther.MinX);
//C                     MaxX = MIN(MaxX,sOther.MaxX);
//C                     MinY = MAX(MinY,sOther.MinY);
//C                     MaxY = MIN(MaxY,sOther.MaxY);
//C                 }
//C                 else
//C                 {
//C                     MinX = sOther.MinX;
//C                     MaxX = sOther.MaxX;
//C                     MinY = sOther.MinY;
//C                     MaxY = sOther.MaxY;
//C                 }
//C             }
//C             else
//C             {
//C                 MinX = 0;
//C                 MaxX = 0;
//C                 MinY = 0;
//C                 MaxY = 0;
//C             }
//C         }

//C         int Intersects(OGREnvelope const& other) const
//C         {
//C             return MinX <= other.MaxX && MaxX >= other.MinX &&
//C                    MinY <= other.MaxY && MaxY >= other.MinY;
//C         }

//C         int Contains(OGREnvelope const& other) const
//C         {
//C             return MinX <= other.MinX && MinY <= other.MinY &&
//C                    MaxX >= other.MaxX && MaxY >= other.MaxY;
//C         }
//C     };
//C     #else
//C     typedef struct
//C     {
//C         double      MinX;
//C         double      MaxX;
//C         double      MinY;
//C         double      MaxY;
//C     } OGREnvelope;
struct _N1
{
    double MinX;
    double MaxX;
    double MinY;
    double MaxY;
}
extern (C):
alias _N1 OGREnvelope;
//C     #endif


/**
 * Simple container for a bounding region in 3D.
 */

//C     #if defined(__cplusplus) && !defined(CPL_SURESS_CPLUSPLUS)
//C     class CPL_DLL OGREnvelope3D : public OGREnvelope
//C     {
//C       public:
//C             OGREnvelope3D() : OGREnvelope(), MinZ(0.0), MaxZ(0.0)
//C             {
//C             }

//C             OGREnvelope3D(const OGREnvelope3D& oOther) :
//C                                 OGREnvelope(oOther),
//C                                 MinZ(oOther.MinZ), MaxZ(oOther.MaxZ)
//C             {
//C             }

//C         double      MinZ;
//C         double      MaxZ;

//C     #ifdef HAVE_GCC_DIAGNOSTIC_PUSH
//C     #pragma GCC diagnostic push
//C     #pragma GCC diagnostic ignored "-Wfloat-equal"
//C     #endif
//C         int  IsInit() const { return MinX != 0 || MinY != 0 || MaxX != 0 || MaxY != 0 || MinZ != 0 || MaxZ != 0; }
//C     #ifdef HAVE_GCC_DIAGNOSTIC_PUSH
//C     #pragma GCC diagnostic pop
//C     #endif

//C         void Merge( OGREnvelope3D const& sOther ) {
//C             if( IsInit() )
//C             {
//C                 MinX = MIN(MinX,sOther.MinX);
//C                 MaxX = MAX(MaxX,sOther.MaxX);
//C                 MinY = MIN(MinY,sOther.MinY);
//C                 MaxY = MAX(MaxY,sOther.MaxY);
//C                 MinZ = MIN(MinZ,sOther.MinZ);
//C                 MaxZ = MAX(MaxZ,sOther.MaxZ);
//C             }
//C             else
//C             {
//C                 MinX = sOther.MinX;
//C                 MaxX = sOther.MaxX;
//C                 MinY = sOther.MinY;
//C                 MaxY = sOther.MaxY;
//C                 MinZ = sOther.MinZ;
//C                 MaxZ = sOther.MaxZ;
//C             }
//C         }
//C         void Merge( double dfX, double dfY, double dfZ ) {
//C             if( IsInit() )
//C             {
//C                 MinX = MIN(MinX,dfX);
//C                 MaxX = MAX(MaxX,dfX);
//C                 MinY = MIN(MinY,dfY);
//C                 MaxY = MAX(MaxY,dfY);
//C                 MinZ = MIN(MinZ,dfZ);
//C                 MaxZ = MAX(MaxZ,dfZ);
//C             }
//C             else
//C             {
//C                 MinX = MaxX = dfX;
//C                 MinY = MaxY = dfY;
//C                 MinZ = MaxZ = dfZ;
//C             }
//C         }

//C         void Intersect( OGREnvelope3D const& sOther ) {
//C             if(Intersects(sOther))
//C             {
//C                 if( IsInit() )
//C                 {
//C                     MinX = MAX(MinX,sOther.MinX);
//C                     MaxX = MIN(MaxX,sOther.MaxX);
//C                     MinY = MAX(MinY,sOther.MinY);
//C                     MaxY = MIN(MaxY,sOther.MaxY);
//C                     MinZ = MAX(MinZ,sOther.MinZ);
//C                     MaxZ = MIN(MaxZ,sOther.MaxZ);
//C                 }
//C                 else
//C                 {
//C                     MinX = sOther.MinX;
//C                     MaxX = sOther.MaxX;
//C                     MinY = sOther.MinY;
//C                     MaxY = sOther.MaxY;
//C                     MinZ = sOther.MinZ;
//C                     MaxZ = sOther.MaxZ;
//C                 }
//C             }
//C             else
//C             {
//C                 MinX = 0;
//C                 MaxX = 0;
//C                 MinY = 0;
//C                 MaxY = 0;
//C                 MinZ = 0;
//C                 MaxZ = 0;
//C             }
//C         }

//C         int Intersects(OGREnvelope3D const& other) const
//C         {
//C             return MinX <= other.MaxX && MaxX >= other.MinX &&
//C                    MinY <= other.MaxY && MaxY >= other.MinY &&
//C                    MinZ <= other.MaxZ && MaxZ >= other.MinZ;
//C         }

//C         int Contains(OGREnvelope3D const& other) const
//C         {
//C             return MinX <= other.MinX && MinY <= other.MinY &&
//C                    MaxX >= other.MaxX && MaxY >= other.MaxY &&
//C                    MinZ <= other.MinZ && MaxZ >= other.MaxZ;
//C         }
//C     };
//C     #else
//C     typedef struct
//C     {
//C         double      MinX;
//C         double      MaxX;
//C         double      MinY;
//C         double      MaxY;
//C         double      MinZ;
//C         double      MaxZ;
//C     } OGREnvelope3D;
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
//C     #endif


//C     CPL_C_START

//C     void CPL_DLL *OGRMalloc( size_t );
void * OGRMalloc(size_t );
//C     void CPL_DLL *OGRCalloc( size_t, size_t );
void * OGRCalloc(size_t , size_t );
//C     void CPL_DLL *OGRRealloc( void *, size_t );
void * OGRRealloc(void *, size_t );
//C     char CPL_DLL *OGRStrdup( const char * );
char * OGRStrdup(char *);
//C     void CPL_DLL OGRFree( void * );
void  OGRFree(void *);

//C     #ifdef STRICT_OGRERR_TYPE
//C     typedef enum
//C     {
//C         OGRERR_NONE,
//C         OGRERR_NOT_ENOUGH_DATA,
//C         OGRERR_NOT_ENOUGH_MEMORY,
//C         OGRERR_UNSUPPORTED_GEOMETRY_TYPE,
//C         OGRERR_UNSUPPORTED_OPERATION,
//C         OGRERR_CORRUPT_DATA,
//C         OGRERR_FAILURE,
//C         OGRERR_UNSUPPORTED_SRS,
//C         OGRERR_INVALID_HANDLE,
//C         OGRERR_NON_EXISTING_FEATURE
//C     } OGRErr;
//C     #else
//C     typedef int OGRErr;
alias int OGRErr;

//C     #define OGRERR_NONE                0
//C     #define OGRERR_NOT_ENOUGH_DATA     1    /* not enough data to deserialize */
const OGRERR_NONE = 0;
//C     #define OGRERR_NOT_ENOUGH_MEMORY   2
const OGRERR_NOT_ENOUGH_DATA = 1;
//C     #define OGRERR_UNSUPPORTED_GEOMETRY_TYPE 3
const OGRERR_NOT_ENOUGH_MEMORY = 2;
//C     #define OGRERR_UNSUPPORTED_OPERATION 4
const OGRERR_UNSUPPORTED_GEOMETRY_TYPE = 3;
//C     #define OGRERR_CORRUPT_DATA        5
const OGRERR_UNSUPPORTED_OPERATION = 4;
//C     #define OGRERR_FAILURE             6
const OGRERR_CORRUPT_DATA = 5;
//C     #define OGRERR_UNSUPPORTED_SRS     7
const OGRERR_FAILURE = 6;
//C     #define OGRERR_INVALID_HANDLE      8
const OGRERR_UNSUPPORTED_SRS = 7;
//C     #define OGRERR_NON_EXISTING_FEATURE 9   /* added in GDAL 2.0 */
const OGRERR_INVALID_HANDLE = 8;

const OGRERR_NON_EXISTING_FEATURE = 9;
//C     #endif

//C     typedef int     OGRBoolean;
alias int OGRBoolean;

/* -------------------------------------------------------------------- */
/*      ogr_geometry.h related definitions.                             */
/* -------------------------------------------------------------------- */

/**
 * List of well known binary geometry types.  These are used within the BLOBs
 * but are also returned from OGRGeometry::getGeometryType() to identify the
 * type of a geometry object.
 */
//C     typedef enum
//C     {
//C         wkbUnknown = 0,         /**< unknown type, non-standard */

//C         wkbPoint = 1,           /**< 0-dimensional geometric object, standard WKB */
//C         wkbLineString = 2,      
/**< 1-dimensional geometric object with linear
                             *   interpolation between Points, standard WKB */
//C         wkbPolygon = 3,         
/**< planar 2-dimensional geometric object defined
                             *   by 1 exterior boundary and 0 or more interior
                             *   boundaries, standard WKB */
//C         wkbMultiPoint = 4,      /**< GeometryCollection of Points, standard WKB */
//C         wkbMultiLineString = 5, /**< GeometryCollection of LineStrings, standard WKB */
//C         wkbMultiPolygon = 6,    /**< GeometryCollection of Polygons, standard WKB */
//C         wkbGeometryCollection = 7, 
/**< geometric object that is a collection of 1
                                    or more geometric objects, standard WKB */

//C         wkbCircularString = 8,  
/**< one or more circular arc segments connected end to end,
                             *   ISO SQL/MM Part 3. GDAL &gt;= 2.0 */
//C         wkbCompoundCurve = 9,   /**< sequence of contiguous curves, ISO SQL/MM Part 3. GDAL &gt;= 2.0 */
//C         wkbCurvePolygon = 10,   
/**< planar surface, defined by 1 exterior boundary
                             *   and zero or more interior boundaries, that are curves.
                             *    ISO SQL/MM Part 3. GDAL &gt;= 2.0 */
//C         wkbMultiCurve = 11,     /**< GeometryCollection of Curves, ISO SQL/MM Part 3. GDAL &gt;= 2.0 */
//C         wkbMultiSurface = 12,   /**< GeometryCollection of Surfaces, ISO SQL/MM Part 3. GDAL &gt;= 2.0 */
//C         wkbCurve = 13,          /**< Curve (abstract type). ISO SQL/MM Part 3. GDAL &gt;= 2.1 */
//C         wkbSurface = 14,        /**< Surface (abstract type). ISO SQL/MM Part 3. GDAL &gt;= 2.1 */
//C         wkbPolyhedralSurface = 15,
/**< a contiguous collection of polygons, which share common boundary segments,
                               *   ISO SQL/MM Part 3. Reserved in GDAL &gt;= 2.1 but not yet implemented */
//C         wkbTIN = 16,              
/**< a PolyhedralSurface consisting only of Triangle patches
                               *    ISO SQL/MM Part 3. Reserved in GDAL &gt;= 2.1 but not yet implemented */
//C         wkbTriangle = 17,         /** < a Triangle. ISO SQL/MM Part 3. Reserved in GDAL &gt;= 2.1 but not yet implemented */

//C         wkbNone = 100,          /**< non-standard, for pure attribute records */
//C         wkbLinearRing = 101,    /**< non-standard, just for createGeometry() */

//C         wkbCircularStringZ = 1008,  /**< wkbCircularString with Z component. ISO SQL/MM Part 3. GDAL &gt;= 2.0 */
//C         wkbCompoundCurveZ = 1009,   /**< wkbCompoundCurve with Z component. ISO SQL/MM Part 3. GDAL &gt;= 2.0 */
//C         wkbCurvePolygonZ = 1010,    /**< wkbCurvePolygon with Z component. ISO SQL/MM Part 3. GDAL &gt;= 2.0 */
//C         wkbMultiCurveZ = 1011,      /**< wkbMultiCurve with Z component. ISO SQL/MM Part 3. GDAL &gt;= 2.0 */
//C         wkbMultiSurfaceZ = 1012,    /**< wkbMultiSurface with Z component. ISO SQL/MM Part 3. GDAL &gt;= 2.0 */
//C         wkbCurveZ = 1013,           /**< wkbCurve with Z component. ISO SQL/MM Part 3. GDAL &gt;= 2.1 */
//C         wkbSurfaceZ = 1014,         /**< wkbSurface with Z component. ISO SQL/MM Part 3. GDAL &gt;= 2.1 */
//C         wkbPolyhedralSurfaceZ = 1015,  /**< ISO SQL/MM Part 3. Reserved in GDAL &gt;= 2.1 but not yet implemented */
//C         wkbTINZ = 1016,                /**< ISO SQL/MM Part 3. Reserved in GDAL &gt;= 2.1 but not yet implemented */
//C         wkbTriangleZ = 1017,           /**< ISO SQL/MM Part 3. Reserved in GDAL &gt;= 2.1 but not yet implemented */

//C         wkbPointM = 2001,              /**< ISO SQL/MM Part 3. GDAL &gt;= 2.1 */
//C         wkbLineStringM = 2002,         /**< ISO SQL/MM Part 3. GDAL &gt;= 2.1 */
//C         wkbPolygonM = 2003,            /**< ISO SQL/MM Part 3. GDAL &gt;= 2.1 */
//C         wkbMultiPointM = 2004,         /**< ISO SQL/MM Part 3. GDAL &gt;= 2.1 */
//C         wkbMultiLineStringM = 2005,    /**< ISO SQL/MM Part 3. GDAL &gt;= 2.1 */
//C         wkbMultiPolygonM = 2006,       /**< ISO SQL/MM Part 3. GDAL &gt;= 2.1 */
//C         wkbGeometryCollectionM = 2007, /**< ISO SQL/MM Part 3. GDAL &gt;= 2.1 */
//C         wkbCircularStringM = 2008,     /**< ISO SQL/MM Part 3. GDAL &gt;= 2.1 */
//C         wkbCompoundCurveM = 2009,      /**< ISO SQL/MM Part 3. GDAL &gt;= 2.1 */
//C         wkbCurvePolygonM = 2010,       /**< ISO SQL/MM Part 3. GDAL &gt;= 2.1 */
//C         wkbMultiCurveM = 2011,         /**< ISO SQL/MM Part 3. GDAL &gt;= 2.1 */
//C         wkbMultiSurfaceM = 2012,       /**< ISO SQL/MM Part 3. GDAL &gt;= 2.1 */
//C         wkbCurveM = 2013,              /**< ISO SQL/MM Part 3. GDAL &gt;= 2.1 */
//C         wkbSurfaceM = 2014,            /**< ISO SQL/MM Part 3. GDAL &gt;= 2.1 */
//C         wkbPolyhedralSurfaceM = 2015,  /**< ISO SQL/MM Part 3. Reserved in GDAL &gt;= 2.1 but not yet implemented */
//C         wkbTINM = 2016,                /**< ISO SQL/MM Part 3. Reserved in GDAL &gt;= 2.1 but not yet implemented */
//C         wkbTriangleM = 2017,           /**< ISO SQL/MM Part 3. Reserved in GDAL &gt;= 2.1 but not yet implemented */

//C         wkbPointZM = 3001,              /**< ISO SQL/MM Part 3. GDAL &gt;= 2.1 */
//C         wkbLineStringZM = 3002,         /**< ISO SQL/MM Part 3. GDAL &gt;= 2.1 */
//C         wkbPolygonZM = 3003,            /**< ISO SQL/MM Part 3. GDAL &gt;= 2.1 */
//C         wkbMultiPointZM = 3004,         /**< ISO SQL/MM Part 3. GDAL &gt;= 2.1 */
//C         wkbMultiLineStringZM = 3005,    /**< ISO SQL/MM Part 3. GDAL &gt;= 2.1 */
//C         wkbMultiPolygonZM = 3006,       /**< ISO SQL/MM Part 3. GDAL &gt;= 2.1 */
//C         wkbGeometryCollectionZM = 3007, /**< ISO SQL/MM Part 3. GDAL &gt;= 2.1 */
//C         wkbCircularStringZM = 3008,     /**< ISO SQL/MM Part 3. GDAL &gt;= 2.1 */
//C         wkbCompoundCurveZM = 3009,      /**< ISO SQL/MM Part 3. GDAL &gt;= 2.1 */
//C         wkbCurvePolygonZM = 3010,       /**< ISO SQL/MM Part 3. GDAL &gt;= 2.1 */
//C         wkbMultiCurveZM = 3011,         /**< ISO SQL/MM Part 3. GDAL &gt;= 2.1 */
//C         wkbMultiSurfaceZM = 3012,       /**< ISO SQL/MM Part 3. GDAL &gt;= 2.1 */
//C         wkbCurveZM = 3013,              /**< ISO SQL/MM Part 3. GDAL &gt;= 2.1 */
//C         wkbSurfaceZM = 3014,            /**< ISO SQL/MM Part 3. GDAL &gt;= 2.1 */
//C         wkbPolyhedralSurfaceZM = 3015,  /**< ISO SQL/MM Part 3. Reserved in GDAL &gt;= 2.1 but not yet implemented */
//C         wkbTINZM = 3016,                /**< ISO SQL/MM Part 3. Reserved in GDAL &gt;= 2.1 but not yet implemented */
//C         wkbTriangleZM = 3017,           /**< ISO SQL/MM Part 3. Reserved in GDAL &gt;= 2.1 but not yet implemented */

//C         wkbPoint25D = 0x80000001, /**< 2.5D extension as per 99-402 */
//C         wkbLineString25D = 0x80000002, /**< 2.5D extension as per 99-402 */
//C         wkbPolygon25D = 0x80000003, /**< 2.5D extension as per 99-402 */
//C         wkbMultiPoint25D = 0x80000004, /**< 2.5D extension as per 99-402 */
//C         wkbMultiLineString25D = 0x80000005, /**< 2.5D extension as per 99-402 */
//C         wkbMultiPolygon25D = 0x80000006, /**< 2.5D extension as per 99-402 */
//C         wkbGeometryCollection25D = 0x80000007 /**< 2.5D extension as per 99-402 */

//C     } OGRwkbGeometryType;
enum
{
    wkbUnknown,
    wkbPoint,
    wkbLineString,
    wkbPolygon,
    wkbMultiPoint,
    wkbMultiLineString,
    wkbMultiPolygon,
    wkbGeometryCollection,
    wkbCircularString,
    wkbCompoundCurve,
    wkbCurvePolygon,
    wkbMultiCurve,
    wkbMultiSurface,
    wkbCurve,
    wkbSurface,
    wkbPolyhedralSurface,
    wkbTIN,
    wkbTriangle,
    wkbNone = 100,
    wkbLinearRing,
    wkbCircularStringZ = 1008,
    wkbCompoundCurveZ,
    wkbCurvePolygonZ,
    wkbMultiCurveZ,
    wkbMultiSurfaceZ,
    wkbCurveZ,
    wkbSurfaceZ,
    wkbPolyhedralSurfaceZ,
    wkbTINZ,
    wkbTriangleZ,
    wkbPointM = 2001,
    wkbLineStringM,
    wkbPolygonM,
    wkbMultiPointM,
    wkbMultiLineStringM,
    wkbMultiPolygonM,
    wkbGeometryCollectionM,
    wkbCircularStringM,
    wkbCompoundCurveM,
    wkbCurvePolygonM,
    wkbMultiCurveM,
    wkbMultiSurfaceM,
    wkbCurveM,
    wkbSurfaceM,
    wkbPolyhedralSurfaceM,
    wkbTINM,
    wkbTriangleM,
    wkbPointZM = 3001,
    wkbLineStringZM,
    wkbPolygonZM,
    wkbMultiPointZM,
    wkbMultiLineStringZM,
    wkbMultiPolygonZM,
    wkbGeometryCollectionZM,
    wkbCircularStringZM,
    wkbCompoundCurveZM,
    wkbCurvePolygonZM,
    wkbMultiCurveZM,
    wkbMultiSurfaceZM,
    wkbCurveZM,
    wkbSurfaceZM,
    wkbPolyhedralSurfaceZM,
    wkbTINZM,
    wkbTriangleZM,
    wkbPoint25D = -2147483647,
    wkbLineString25D,
    wkbPolygon25D,
    wkbMultiPoint25D,
    wkbMultiLineString25D,
    wkbMultiPolygon25D,
    wkbGeometryCollection25D,
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
//C     typedef enum
//C     {
//C         wkbVariantOldOgc, /**< Old-style 99-402 extended dimension (Z) WKB types */
//C         wkbVariantIso,  /**< SFSQL 1.2 and ISO SQL/MM Part 3 extended dimension (Z&M) WKB types */
//C         wkbVariantPostGIS1 /**< PostGIS 1.X has different codes for CurvePolygon, MultiCurve and MultiSurface */
//C     } OGRwkbVariant;
enum
{
    wkbVariantOldOgc,
    wkbVariantIso,
    wkbVariantPostGIS1,
}
alias int OGRwkbVariant;


/** @deprecated in GDAL 2.0. Use wkbHasZ() or wkbSetZ() instead */
//C     #ifndef GDAL_COMPILATION
//C     #define wkb25DBit 0x80000000
//C     #endif
const wkb25DBit = 0x80000000;

/** Return the 2D geometry type corresponding to the specified geometry type */
//C     #define wkbFlatten(x)  OGR_GT_Flatten((OGRwkbGeometryType)(x))

/** Return if the geometry type is a 3D geometry type
  * @since GDAL 2.0
  */
//C     #define wkbHasZ(x)     (OGR_GT_HasZ(x) != 0)

/** Return the 3D geometry type corresponding to the specified geometry type.
  * @since GDAL 2.0
  */
//C     #define wkbSetZ(x)     OGR_GT_SetZ(x)

/** Return if the geometry type is a measured geometry type
  * @since GDAL 2.1
  */
//C     #define wkbHasM(x)     (OGR_GT_HasM(x) != 0)

/** Return the measured geometry type corresponding to the specified geometry type.
  * @since GDAL 2.1
  */
//C     #define wkbSetM(x)     OGR_GT_SetM(x)

//C     #define ogrZMarker 0x21125711

const ogrZMarker = 0x21125711;
//C     const char CPL_DLL * OGRGeometryTypeToName( OGRwkbGeometryType eType );
char * OGRGeometryTypeToName(OGRwkbGeometryType eType);
//C     OGRwkbGeometryType CPL_DLL OGRMergeGeometryTypes( OGRwkbGeometryType eMain,
//C                                                       OGRwkbGeometryType eExtra );
OGRwkbGeometryType  OGRMergeGeometryTypes(OGRwkbGeometryType eMain, OGRwkbGeometryType eExtra);
//C     OGRwkbGeometryType CPL_DLL OGRMergeGeometryTypesEx( OGRwkbGeometryType eMain,
//C                                                         OGRwkbGeometryType eExtra,
//C                                                         int bAllowPromotingToCurves );
OGRwkbGeometryType  OGRMergeGeometryTypesEx(OGRwkbGeometryType eMain, OGRwkbGeometryType eExtra, int bAllowPromotingToCurves);
//C     OGRwkbGeometryType CPL_DLL OGR_GT_Flatten( OGRwkbGeometryType eType );
OGRwkbGeometryType  OGR_GT_Flatten(OGRwkbGeometryType eType);
//C     OGRwkbGeometryType CPL_DLL OGR_GT_SetZ( OGRwkbGeometryType eType );
OGRwkbGeometryType  OGR_GT_SetZ(OGRwkbGeometryType eType);
//C     OGRwkbGeometryType CPL_DLL OGR_GT_SetM( OGRwkbGeometryType eType );
OGRwkbGeometryType  OGR_GT_SetM(OGRwkbGeometryType eType);
//C     OGRwkbGeometryType CPL_DLL OGR_GT_SetModifier( OGRwkbGeometryType eType, int bSetZ, int bSetM );
OGRwkbGeometryType  OGR_GT_SetModifier(OGRwkbGeometryType eType, int bSetZ, int bSetM);
//C     int                CPL_DLL OGR_GT_HasZ( OGRwkbGeometryType eType );
int  OGR_GT_HasZ(OGRwkbGeometryType eType);
//C     int                CPL_DLL OGR_GT_HasM( OGRwkbGeometryType eType );
int  OGR_GT_HasM(OGRwkbGeometryType eType);
//C     int                CPL_DLL OGR_GT_IsSubClassOf( OGRwkbGeometryType eType,
//C                                                     OGRwkbGeometryType eSuperType );
int  OGR_GT_IsSubClassOf(OGRwkbGeometryType eType, OGRwkbGeometryType eSuperType);
//C     int                CPL_DLL OGR_GT_IsCurve( OGRwkbGeometryType );
int  OGR_GT_IsCurve(OGRwkbGeometryType );
//C     int                CPL_DLL OGR_GT_IsSurface( OGRwkbGeometryType );
int  OGR_GT_IsSurface(OGRwkbGeometryType );
//C     int                CPL_DLL OGR_GT_IsNonLinear( OGRwkbGeometryType );
int  OGR_GT_IsNonLinear(OGRwkbGeometryType );
//C     OGRwkbGeometryType CPL_DLL OGR_GT_GetCollection( OGRwkbGeometryType eType );
OGRwkbGeometryType  OGR_GT_GetCollection(OGRwkbGeometryType eType);
//C     OGRwkbGeometryType CPL_DLL OGR_GT_GetCurve( OGRwkbGeometryType eType );
OGRwkbGeometryType  OGR_GT_GetCurve(OGRwkbGeometryType eType);
//C     OGRwkbGeometryType CPL_DLL OGR_GT_GetLinear( OGRwkbGeometryType eType );
OGRwkbGeometryType  OGR_GT_GetLinear(OGRwkbGeometryType eType);

//C     typedef enum
//C     {
//C         wkbXDR = 0,         /* MSB/Sun/Motoroloa: Most Significant Byte First   */
//C         wkbNDR = 1          /* LSB/Intel/Vax: Least Significant Byte First      */
//C     } OGRwkbByteOrder;
enum
{
    wkbXDR,
    wkbNDR,
}
alias int OGRwkbByteOrder;

//C     #ifndef NO_HACK_FOR_IBM_DB2_V72
//C     #  define HACK_FOR_IBM_DB2_V72
//C     #endif

//C     #ifdef HACK_FOR_IBM_DB2_V72
//C     #  define DB2_V72_FIX_BYTE_ORDER(x) ((((x) & 0x31) == (x)) ? ((x) & 0x1) : (x))
//C     #  define DB2_V72_UNFIX_BYTE_ORDER(x) ((unsigned char) (OGRGeometry::bGenerate_DB2_V72_BYTE_ORDER ? ((x) | 0x30) : (x)))
//C     #else
//C     #  define DB2_V72_FIX_BYTE_ORDER(x) (x)
//C     #  define DB2_V72_UNFIX_BYTE_ORDER(x) (x)
//C     #endif

/** Alter field name.
 * Used by OGR_L_AlterFieldDefn().
 */
//C     #define ALTER_NAME_FLAG            0x1

const ALTER_NAME_FLAG = 0x1;
/** Alter field type.
 * Used by OGR_L_AlterFieldDefn().
 */
//C     #define ALTER_TYPE_FLAG            0x2

const ALTER_TYPE_FLAG = 0x2;
/** Alter field width and precision.
 * Used by OGR_L_AlterFieldDefn().
 */
//C     #define ALTER_WIDTH_PRECISION_FLAG 0x4

const ALTER_WIDTH_PRECISION_FLAG = 0x4;
/** Alter field NOT NULL constraint.
 * Used by OGR_L_AlterFieldDefn().
 * @since GDAL 2.0
 */
//C     #define ALTER_NULLABLE_FLAG        0x8

const ALTER_NULLABLE_FLAG = 0x8;
/** Alter field DEFAULT value.
 * Used by OGR_L_AlterFieldDefn().
 * @since GDAL 2.0
 */
//C     #define ALTER_DEFAULT_FLAG         0x10

const ALTER_DEFAULT_FLAG = 0x10;
/** Alter all parameters of field definition.
 * Used by OGR_L_AlterFieldDefn().
 */
//C     #define ALTER_ALL_FLAG             (ALTER_NAME_FLAG | ALTER_TYPE_FLAG | ALTER_WIDTH_PRECISION_FLAG | ALTER_NULLABLE_FLAG | ALTER_DEFAULT_FLAG)


/** Validate that fields respect not-null constraints.
 * Used by OGR_F_Validate().
 * @since GDAL 2.0
 */
//C     #define OGR_F_VAL_NULL           0x00000001

const OGR_F_VAL_NULL = 0x00000001;
/** Validate that geometries respect geometry column type.
 * Used by OGR_F_Validate().
 * @since GDAL 2.0
 */
//C     #define OGR_F_VAL_GEOM_TYPE      0x00000002

const OGR_F_VAL_GEOM_TYPE = 0x00000002;
/** Validate that (string) fields respect field width.
 * Used by OGR_F_Validate().
 * @since GDAL 2.0
 */
//C     #define OGR_F_VAL_WIDTH          0x00000004

const OGR_F_VAL_WIDTH = 0x00000004;
/** Allow fields that are null when there's an associated default value.
 * This can be used for drivers where the low-level layers will automatically set the
 * field value to the associated default value.
 * This flag only makes sense if OGR_F_VAL_NULL is set too.
 * Used by OGR_F_Validate().
 * @since GDAL 2.0
 */
//C     #define OGR_F_VAL_ALLOW_NULL_WHEN_DEFAULT       0x00000008

const OGR_F_VAL_ALLOW_NULL_WHEN_DEFAULT = 0x00000008;
/** Allow geometry fields to have a different coordinate dimension that their
 * geometry column type.
 * This flag only makes sense if OGR_F_VAL_GEOM_TYPE is set too.
 * Used by OGR_F_Validate().
 * @since GDAL 2.1
 */
//C     #define OGR_F_VAL_ALLOW_DIFFERENT_GEOM_DIM       0x00000010

const OGR_F_VAL_ALLOW_DIFFERENT_GEOM_DIM = 0x00000010;
/** Enable all validation tests (except OGR_F_VAL_ALLOW_DIFFERENT_GEOM_DIM)
 * Used by OGR_F_Validate().
 * @since GDAL 2.0
 */
//C     #define OGR_F_VAL_ALL            (0x7FFFFFFF & ~OGR_F_VAL_ALLOW_DIFFERENT_GEOM_DIM)

/************************************************************************/
/*                  ogr_feature.h related definitions.                  */
/************************************************************************/

/**
 * List of feature field types.  This list is likely to be extended in the
 * future ... avoid coding applications based on the assumption that all
 * field types can be known.
 */

//C     typedef enum
//C     {
  /** Simple 32bit integer */
//C                        OFTInteger = 0,
  /** List of 32bit integers */
//C                      OFTIntegerList = 1,
  /** Double Precision floating point */
//C             OFTReal = 2,
  /** List of doubles */
//C                             OFTRealList = 3,
  /** String of ASCII chars */
//C                       OFTString = 4,
  /** Array of strings */
//C                            OFTStringList = 5,
  /** deprecated */
//C                                  OFTWideString = 6,
  /** deprecated */
//C                                  OFTWideStringList = 7,
  /** Raw Binary data */
//C                             OFTBinary = 8,
  /** Date */
//C                                        OFTDate = 9,
  /** Time */
//C                                        OFTTime = 10,
  /** Date and Time */
//C                               OFTDateTime = 11,
  /** Single 64bit integer */
//C                        OFTInteger64 = 12,
  /** List of 64bit integers */
//C                      OFTInteger64List = 13,
//C                                                     OFTMaxType = 13
//C     } OGRFieldType;
enum
{
    OFTInteger,
    OFTIntegerList,
    OFTReal,
    OFTRealList,
    OFTString,
    OFTStringList,
    OFTWideString,
    OFTWideStringList,
    OFTBinary,
    OFTDate,
    OFTTime,
    OFTDateTime,
    OFTInteger64,
    OFTInteger64List,
    OFTMaxType = 13,
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
//C     typedef enum
//C     {
    /** No subtype. This is the default value */
//C             OFSTNone = 0,
    /** Boolean integer. Only valid for OFTInteger and OFTIntegerList.*/
//C                                                             OFSTBoolean = 1,
    /** Signed 16-bit integer. Only valid for OFTInteger and OFTIntegerList. */
//C                                                             OFSTInt16 = 2,
    /** Single precision (32 bit) floating point. Only valid for OFTReal and OFTRealList. */
//C                                                             OFSTFloat32 = 3,
//C                                                             OFSTMaxSubType = 3
//C     } OGRFieldSubType;
enum
{
    OFSTNone,
    OFSTBoolean,
    OFSTInt16,
    OFSTFloat32,
    OFSTMaxSubType = 3,
}
alias int OGRFieldSubType;

/**
 * Display justification for field values.
 */

//C     typedef enum
//C     {
//C         OJUndefined = 0,
//C         OJLeft = 1,
//C         OJRight = 2
//C     } OGRJustification;
enum
{
    OJUndefined,
    OJLeft,
    OJRight,
}
alias int OGRJustification;

//C     #define OGRNullFID            -1
//C     #define OGRUnsetMarker        -21121
const OGRNullFID = -1;

const OGRUnsetMarker = -21121;
/************************************************************************/
/*                               OGRField                               */
/************************************************************************/

/**
 * OGRFeature field attribute value union.
 */

//C     typedef union {
//C         int         Integer;
//C         GIntBig     Integer64;
//C         double      Real;
//C         char       *String;

//C         struct {
//C             int     nCount;
//C             int     *paList;
//C         } IntegerList;
struct _N10
{
    int nCount;
    int *paList;
}

//C         struct {
//C             int     nCount;
//C             GIntBig *paList;
//C         } Integer64List;
struct _N11
{
    int nCount;
    GIntBig *paList;
}

//C         struct {
//C             int     nCount;
//C             double  *paList;
//C         } RealList;
struct _N12
{
    int nCount;
    double *paList;
}

//C         struct {
//C             int     nCount;
//C             char    **paList;
//C         } StringList;
struct _N13
{
    int nCount;
    char **paList;
}

//C         struct {
//C             int     nCount;
//C             GByte   *paData;
//C         } Binary;
struct _N14
{
    int nCount;
    GByte *paData;
}

//C         struct {
//C             int     nMarker1;
//C             int     nMarker2;
//C         } Set;
struct _N15
{
    int nMarker1;
    int nMarker2;
}

//C         struct {
//C             GInt16  Year;
//C             GByte   Month;
//C             GByte   Day;
//C             GByte   Hour;
//C             GByte   Minute;
//C             GByte   TZFlag; 
/* 0=unknown, 1=localtime(ambiguous),
                           100=GMT, 104=GMT+1, 80=GMT-5, etc */
//C             GByte   Reserved; /* must be set to 0 */
//C             float   Second; /* with millisecond accuracy. at the end of the structure, so as to keep it 12 bytes on 32 bit */
//C         } Date;
struct _N16
{
    GInt16 Year;
    GByte Month;
    GByte Day;
    GByte Hour;
    GByte Minute;
    GByte TZFlag;
    GByte Reserved;
    float Second;
}
//C     } OGRField;
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

//C     #define OGR_GET_MS(floatingpoint_sec)   (int)(((floatingpoint_sec) - (int)(floatingpoint_sec)) * 1000 + 0.5)

//C     int CPL_DLL OGRParseDate( const char *pszInput, OGRField *psOutput,
//C                               int nOptions );
int  OGRParseDate(char *pszInput, OGRField *psOutput, int nOptions);

/* -------------------------------------------------------------------- */
/*      Constants from ogrsf_frmts.h for capabilities.                  */
/* -------------------------------------------------------------------- */
//C     #define OLCRandomRead          "RandomRead"
//C     #define OLCSequentialWrite     "SequentialWrite"
//C     #define OLCRandomWrite         "RandomWrite"
//C     #define OLCFastSpatialFilter   "FastSpatialFilter"
//C     #define OLCFastFeatureCount    "FastFeatureCount"
//C     #define OLCFastGetExtent       "FastGetExtent"
//C     #define OLCCreateField         "CreateField"
//C     #define OLCDeleteField         "DeleteField"
//C     #define OLCReorderFields       "ReorderFields"
//C     #define OLCAlterFieldDefn      "AlterFieldDefn"
//C     #define OLCTransactions        "Transactions"
//C     #define OLCDeleteFeature       "DeleteFeature"
//C     #define OLCFastSetNextByIndex  "FastSetNextByIndex"
//C     #define OLCStringsAsUTF8       "StringsAsUTF8"
//C     #define OLCIgnoreFields        "IgnoreFields"
//C     #define OLCCreateGeomField     "CreateGeomField"
//C     #define OLCCurveGeometries     "CurveGeometries"
//C     #define OLCMeasuredGeometries  "MeasuredGeometries"

//C     #define ODsCCreateLayer        "CreateLayer"
//C     #define ODsCDeleteLayer        "DeleteLayer"
//C     #define ODsCCreateGeomFieldAfterCreateLayer   "CreateGeomFieldAfterCreateLayer"
//C     #define ODsCCurveGeometries    "CurveGeometries"
//C     #define ODsCTransactions       "Transactions"
//C     #define ODsCEmulatedTransactions "EmulatedTransactions"
//C     #define ODsCMeasuredGeometries "MeasuredGeometries"

//C     #define ODrCCreateDataSource   "CreateDataSource"
//C     #define ODrCDeleteDataSource   "DeleteDataSource"

/* -------------------------------------------------------------------- */
/*      Layer metadata items.                                           */
/* -------------------------------------------------------------------- */
/** Capability set to YES as metadata on a layer that has features with
  * 64 bit identifiers.
  @since GDAL 2.0
  */
//C     #define OLMD_FID64             "OLMD_FID64"

/************************************************************************/
/*                  ogr_featurestyle.h related definitions.             */
/************************************************************************/

/**
 * OGRStyleTool derived class types (returned by GetType()).
 */

//C     typedef enum ogr_style_tool_class_id
//C     {
//C         OGRSTCNone   = 0,
//C         OGRSTCPen    = 1,
//C         OGRSTCBrush  = 2,
//C         OGRSTCSymbol = 3,
//C         OGRSTCLabel  = 4,
//C         OGRSTCVector = 5
//C     } OGRSTClassId;
enum ogr_style_tool_class_id
{
    OGRSTCNone,
    OGRSTCPen,
    OGRSTCBrush,
    OGRSTCSymbol,
    OGRSTCLabel,
    OGRSTCVector,
}
alias ogr_style_tool_class_id OGRSTClassId;

/**
 * List of units supported by OGRStyleTools.
 */
//C     typedef enum ogr_style_tool_units_id
//C     {
//C         OGRSTUGround = 0,
//C         OGRSTUPixel  = 1,
//C         OGRSTUPoints = 2,
//C         OGRSTUMM     = 3,
//C         OGRSTUCM     = 4,
//C         OGRSTUInches = 5
//C     } OGRSTUnitId;
enum ogr_style_tool_units_id
{
    OGRSTUGround,
    OGRSTUPixel,
    OGRSTUPoints,
    OGRSTUMM,
    OGRSTUCM,
    OGRSTUInches,
}
alias ogr_style_tool_units_id OGRSTUnitId;

/**
 * List of parameters for use with OGRStylePen.
 */
//C     typedef enum ogr_style_tool_param_pen_id
//C     {
//C         OGRSTPenColor       = 0,
//C         OGRSTPenWidth       = 1,
//C         OGRSTPenPattern     = 2,
//C         OGRSTPenId          = 3,
//C         OGRSTPenPerOffset   = 4,
//C         OGRSTPenCap         = 5,
//C         OGRSTPenJoin        = 6,
//C         OGRSTPenPriority    = 7,
//C         OGRSTPenLast        = 8

//C     } OGRSTPenParam;
enum ogr_style_tool_param_pen_id
{
    OGRSTPenColor,
    OGRSTPenWidth,
    OGRSTPenPattern,
    OGRSTPenId,
    OGRSTPenPerOffset,
    OGRSTPenCap,
    OGRSTPenJoin,
    OGRSTPenPriority,
    OGRSTPenLast,
}
alias ogr_style_tool_param_pen_id OGRSTPenParam;

/**
 * List of parameters for use with OGRStyleBrush.
 */
//C     typedef enum ogr_style_tool_param_brush_id
//C     {
//C         OGRSTBrushFColor    = 0,
//C         OGRSTBrushBColor    = 1,
//C         OGRSTBrushId        = 2,
//C         OGRSTBrushAngle     = 3,
//C         OGRSTBrushSize      = 4,
//C         OGRSTBrushDx        = 5,
//C         OGRSTBrushDy        = 6,
//C         OGRSTBrushPriority  = 7,
//C         OGRSTBrushLast      = 8

//C     } OGRSTBrushParam;
enum ogr_style_tool_param_brush_id
{
    OGRSTBrushFColor,
    OGRSTBrushBColor,
    OGRSTBrushId,
    OGRSTBrushAngle,
    OGRSTBrushSize,
    OGRSTBrushDx,
    OGRSTBrushDy,
    OGRSTBrushPriority,
    OGRSTBrushLast,
}
alias ogr_style_tool_param_brush_id OGRSTBrushParam;


/**
 * List of parameters for use with OGRStyleSymbol.
 */
//C     typedef enum ogr_style_tool_param_symbol_id
//C     {
//C         OGRSTSymbolId       = 0,
//C         OGRSTSymbolAngle    = 1,
//C         OGRSTSymbolColor    = 2,
//C         OGRSTSymbolSize     = 3,
//C         OGRSTSymbolDx       = 4,
//C         OGRSTSymbolDy       = 5,
//C         OGRSTSymbolStep     = 6,
//C         OGRSTSymbolPerp     = 7,
//C         OGRSTSymbolOffset   = 8,
//C         OGRSTSymbolPriority = 9,
//C         OGRSTSymbolFontName = 10,
//C         OGRSTSymbolOColor   = 11,
//C         OGRSTSymbolLast     = 12

//C     } OGRSTSymbolParam;
enum ogr_style_tool_param_symbol_id
{
    OGRSTSymbolId,
    OGRSTSymbolAngle,
    OGRSTSymbolColor,
    OGRSTSymbolSize,
    OGRSTSymbolDx,
    OGRSTSymbolDy,
    OGRSTSymbolStep,
    OGRSTSymbolPerp,
    OGRSTSymbolOffset,
    OGRSTSymbolPriority,
    OGRSTSymbolFontName,
    OGRSTSymbolOColor,
    OGRSTSymbolLast,
}
alias ogr_style_tool_param_symbol_id OGRSTSymbolParam;

/**
 * List of parameters for use with OGRStyleLabel.
 */
//C     typedef enum ogr_style_tool_param_label_id
//C     {
//C         OGRSTLabelFontName  = 0,
//C         OGRSTLabelSize      = 1,
//C         OGRSTLabelTextString = 2,
//C         OGRSTLabelAngle     = 3,
//C         OGRSTLabelFColor    = 4,
//C         OGRSTLabelBColor    = 5,
//C         OGRSTLabelPlacement = 6,
//C         OGRSTLabelAnchor    = 7,
//C         OGRSTLabelDx        = 8,
//C         OGRSTLabelDy        = 9,
//C         OGRSTLabelPerp      = 10,
//C         OGRSTLabelBold      = 11,
//C         OGRSTLabelItalic    = 12,
//C         OGRSTLabelUnderline = 13,
//C         OGRSTLabelPriority  = 14,
//C         OGRSTLabelStrikeout = 15,
//C         OGRSTLabelStretch   = 16,
//C         OGRSTLabelAdjHor    = 17,
//C         OGRSTLabelAdjVert   = 18,
//C         OGRSTLabelHColor    = 19,
//C         OGRSTLabelOColor    = 20,
//C         OGRSTLabelLast      = 21

//C     } OGRSTLabelParam;
enum ogr_style_tool_param_label_id
{
    OGRSTLabelFontName,
    OGRSTLabelSize,
    OGRSTLabelTextString,
    OGRSTLabelAngle,
    OGRSTLabelFColor,
    OGRSTLabelBColor,
    OGRSTLabelPlacement,
    OGRSTLabelAnchor,
    OGRSTLabelDx,
    OGRSTLabelDy,
    OGRSTLabelPerp,
    OGRSTLabelBold,
    OGRSTLabelItalic,
    OGRSTLabelUnderline,
    OGRSTLabelPriority,
    OGRSTLabelStrikeout,
    OGRSTLabelStretch,
    OGRSTLabelAdjHor,
    OGRSTLabelAdjVert,
    OGRSTLabelHColor,
    OGRSTLabelOColor,
    OGRSTLabelLast,
}
alias ogr_style_tool_param_label_id OGRSTLabelParam;

/* ------------------------------------------------------------------- */
/*                        Version checking                             */
/* -------------------------------------------------------------------- */

/* Note to developers : please keep this section in sync with gdal.h */

//C     #ifndef GDAL_VERSION_INFO_DEFINED
//C     #define GDAL_VERSION_INFO_DEFINED
//C     const char CPL_DLL * CPL_STDCALL GDALVersionInfo( const char * );
extern (Windows):
char * GDALVersionInfo(char *);
//C     #endif

//C     #ifndef GDAL_CHECK_VERSION

/** Return TRUE if GDAL library version at runtime matches nVersionMajor.nVersionMinor.

    The purpose of this method is to ensure that calling code will run with the GDAL
    version it is compiled for. It is primarily indented for external plugins.

    @param nVersionMajor Major version to be tested against
    @param nVersionMinor Minor version to be tested against
    @param pszCallingComponentName If not NULL, in case of version mismatch, the method
                                   will issue a failure mentioning the name of
                                   the calling component.
  */
//C     int CPL_DLL CPL_STDCALL GDALCheckVersion( int nVersionMajor, int nVersionMinor,
//C                                               const char* pszCallingComponentName);
int  GDALCheckVersion(int nVersionMajor, int nVersionMinor, char *pszCallingComponentName);

/** Helper macro for GDALCheckVersion */
//C     #define GDAL_CHECK_VERSION(pszCallingComponentName)  GDALCheckVersion(GDAL_VERSION_MAJOR, GDAL_VERSION_MINOR, pszCallingComponentName)

//C     #endif

//C     CPL_C_END

//C     #endif /* ndef OGR_CORE_H_INCLUDED */
