/* Converted to D from C:/devLibs/gdal21/include/ogr_api.h by htod */
module ./ograpi;
/******************************************************************************
 * $Id: ogr_api.h 33631 2016-03-04 06:28:09Z goatbar $
 *
 * Project:  OpenGIS Simple Features Reference Implementation
 * Purpose:  C API for OGR Geometry, Feature, Layers, DataSource and drivers.
 * Author:   Frank Warmerdam, warmerdam@pobox.com
 *
 ******************************************************************************
 * Copyright (c) 2002, Frank Warmerdam
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

//C     #ifndef OGR_API_H_INCLUDED
//C     #define OGR_API_H_INCLUDED

/**
 * \file ogr_api.h
 *
 * C API and defines for OGRFeature, OGRGeometry, and OGRDataSource
 * related classes.
 *
 * See also: ogr_geometry.h, ogr_feature.h, ogrsf_frmts.h, ogr_featurestyle.h
 */

//C     #include "cpl_progress.h"
import cpl_progress;
//C     #include "cpl_minixml.h"
import cpl_minixml;
//C     #include "ogr_core.h"
import ogr_core;

//C     CPL_C_START

/* -------------------------------------------------------------------- */
/*      Geometry related functions (ogr_geometry.h)                     */
/* -------------------------------------------------------------------- */
//C     #ifdef DEBUG
//C     typedef struct OGRGeometryHS *OGRGeometryH;
//C     #else
//C     typedef void *OGRGeometryH;
extern (C):
alias void *OGRGeometryH;
//C     #endif

//C     #ifndef DEFINED_OGRSpatialReferenceH
//C     #define DEFINED_OGRSpatialReferenceH

//C     #ifdef DEBUG
//C     typedef struct OGRSpatialReferenceHS *OGRSpatialReferenceH;
//C     typedef struct OGRCoordinateTransformationHS *OGRCoordinateTransformationH;
//C     #else
//C     typedef void *OGRSpatialReferenceH;
alias void *OGRSpatialReferenceH;
//C     typedef void *OGRCoordinateTransformationH;
alias void *OGRCoordinateTransformationH;
//C     #endif

//C     #endif

//C     struct _CPLXMLNode;

/* From base OGRGeometry class */

//C     OGRErr CPL_DLL OGR_G_CreateFromWkb( unsigned char *, OGRSpatialReferenceH,
//C                                         OGRGeometryH *, int );
OGRErr  OGR_G_CreateFromWkb(ubyte *, OGRSpatialReferenceH , OGRGeometryH *, int );
//C     OGRErr CPL_DLL OGR_G_CreateFromWkt( char **, OGRSpatialReferenceH,
//C                                         OGRGeometryH * );
OGRErr  OGR_G_CreateFromWkt(char **, OGRSpatialReferenceH , OGRGeometryH *);
//C     OGRErr CPL_DLL OGR_G_CreateFromFgf( unsigned char *, OGRSpatialReferenceH,
//C                                         OGRGeometryH *, int, int * );
OGRErr  OGR_G_CreateFromFgf(ubyte *, OGRSpatialReferenceH , OGRGeometryH *, int , int *);
//C     void   CPL_DLL OGR_G_DestroyGeometry( OGRGeometryH );
void  OGR_G_DestroyGeometry(OGRGeometryH );
//C     OGRGeometryH CPL_DLL OGR_G_CreateGeometry( OGRwkbGeometryType ) CPL_WARN_UNUSED_RESULT;
OGRGeometryH  OGR_G_CreateGeometry(OGRwkbGeometryType );
//C     OGRGeometryH CPL_DLL
//C     OGR_G_ApproximateArcAngles(
//C         double dfCenterX, double dfCenterY, double dfZ,
//C         double dfPrimaryRadius, double dfSecondaryAxis, double dfRotation,
//C         double dfStartAngle, double dfEndAngle,
//C         double dfMaxAngleStepSizeDegrees ) CPL_WARN_UNUSED_RESULT;
OGRGeometryH  OGR_G_ApproximateArcAngles(double dfCenterX, double dfCenterY, double dfZ, double dfPrimaryRadius, double dfSecondaryAxis, double dfRotation, double dfStartAngle, double dfEndAngle, double dfMaxAngleStepSizeDegrees);

//C     OGRGeometryH CPL_DLL OGR_G_ForceToPolygon( OGRGeometryH ) CPL_WARN_UNUSED_RESULT;
OGRGeometryH  OGR_G_ForceToPolygon(OGRGeometryH );
//C     OGRGeometryH CPL_DLL OGR_G_ForceToLineString( OGRGeometryH ) CPL_WARN_UNUSED_RESULT;
OGRGeometryH  OGR_G_ForceToLineString(OGRGeometryH );
//C     OGRGeometryH CPL_DLL OGR_G_ForceToMultiPolygon( OGRGeometryH ) CPL_WARN_UNUSED_RESULT;
OGRGeometryH  OGR_G_ForceToMultiPolygon(OGRGeometryH );
//C     OGRGeometryH CPL_DLL OGR_G_ForceToMultiPoint( OGRGeometryH ) CPL_WARN_UNUSED_RESULT;
OGRGeometryH  OGR_G_ForceToMultiPoint(OGRGeometryH );
//C     OGRGeometryH CPL_DLL OGR_G_ForceToMultiLineString( OGRGeometryH ) CPL_WARN_UNUSED_RESULT;
OGRGeometryH  OGR_G_ForceToMultiLineString(OGRGeometryH );
//C     OGRGeometryH CPL_DLL OGR_G_ForceTo( OGRGeometryH hGeom,
//C                                         OGRwkbGeometryType eTargetType,
//C                                         char** papszOptions ) CPL_WARN_UNUSED_RESULT;
OGRGeometryH  OGR_G_ForceTo(OGRGeometryH hGeom, OGRwkbGeometryType eTargetType, char **papszOptions);

//C     int    CPL_DLL OGR_G_GetDimension( OGRGeometryH );
int  OGR_G_GetDimension(OGRGeometryH );
//C     int    CPL_DLL OGR_G_GetCoordinateDimension( OGRGeometryH );
int  OGR_G_GetCoordinateDimension(OGRGeometryH );
//C     int    CPL_DLL OGR_G_CoordinateDimension( OGRGeometryH );
int  OGR_G_CoordinateDimension(OGRGeometryH );
//C     void   CPL_DLL OGR_G_SetCoordinateDimension( OGRGeometryH, int );
void  OGR_G_SetCoordinateDimension(OGRGeometryH , int );
//C     int    CPL_DLL OGR_G_Is3D( OGRGeometryH );
int  OGR_G_Is3D(OGRGeometryH );
//C     int    CPL_DLL OGR_G_IsMeasured( OGRGeometryH );
int  OGR_G_IsMeasured(OGRGeometryH );
//C     void   CPL_DLL OGR_G_Set3D( OGRGeometryH, int );
void  OGR_G_Set3D(OGRGeometryH , int );
//C     void   CPL_DLL OGR_G_SetMeasured( OGRGeometryH, int );
void  OGR_G_SetMeasured(OGRGeometryH , int );
//C     OGRGeometryH CPL_DLL OGR_G_Clone( OGRGeometryH ) CPL_WARN_UNUSED_RESULT;
OGRGeometryH  OGR_G_Clone(OGRGeometryH );
//C     void   CPL_DLL OGR_G_GetEnvelope( OGRGeometryH, OGREnvelope * );
void  OGR_G_GetEnvelope(OGRGeometryH , OGREnvelope *);
//C     void   CPL_DLL OGR_G_GetEnvelope3D( OGRGeometryH, OGREnvelope3D * );
void  OGR_G_GetEnvelope3D(OGRGeometryH , OGREnvelope3D *);
//C     OGRErr CPL_DLL OGR_G_ImportFromWkb( OGRGeometryH, unsigned char *, int );
OGRErr  OGR_G_ImportFromWkb(OGRGeometryH , ubyte *, int );
//C     OGRErr CPL_DLL OGR_G_ExportToWkb( OGRGeometryH, OGRwkbByteOrder, unsigned char*);
OGRErr  OGR_G_ExportToWkb(OGRGeometryH , OGRwkbByteOrder , ubyte *);
//C     OGRErr CPL_DLL OGR_G_ExportToIsoWkb( OGRGeometryH, OGRwkbByteOrder, unsigned char*);
OGRErr  OGR_G_ExportToIsoWkb(OGRGeometryH , OGRwkbByteOrder , ubyte *);
//C     int    CPL_DLL OGR_G_WkbSize( OGRGeometryH hGeom );
int  OGR_G_WkbSize(OGRGeometryH hGeom);
//C     OGRErr CPL_DLL OGR_G_ImportFromWkt( OGRGeometryH, char ** );
OGRErr  OGR_G_ImportFromWkt(OGRGeometryH , char **);
//C     OGRErr CPL_DLL OGR_G_ExportToWkt( OGRGeometryH, char ** );
OGRErr  OGR_G_ExportToWkt(OGRGeometryH , char **);
//C     OGRErr CPL_DLL OGR_G_ExportToIsoWkt( OGRGeometryH, char ** );
OGRErr  OGR_G_ExportToIsoWkt(OGRGeometryH , char **);
//C     OGRwkbGeometryType CPL_DLL OGR_G_GetGeometryType( OGRGeometryH );
OGRwkbGeometryType  OGR_G_GetGeometryType(OGRGeometryH );
//C     const char CPL_DLL *OGR_G_GetGeometryName( OGRGeometryH );
char * OGR_G_GetGeometryName(OGRGeometryH );
//C     void   CPL_DLL OGR_G_DumpReadable( OGRGeometryH, FILE *, const char * );
void  OGR_G_DumpReadable(OGRGeometryH , FILE *, char *);
//C     void   CPL_DLL OGR_G_FlattenTo2D( OGRGeometryH );
void  OGR_G_FlattenTo2D(OGRGeometryH );
//C     void   CPL_DLL OGR_G_CloseRings( OGRGeometryH );
void  OGR_G_CloseRings(OGRGeometryH );

//C     OGRGeometryH CPL_DLL OGR_G_CreateFromGML( const char * ) CPL_WARN_UNUSED_RESULT;
OGRGeometryH  OGR_G_CreateFromGML(char *);
//C     char   CPL_DLL *OGR_G_ExportToGML( OGRGeometryH ) CPL_WARN_UNUSED_RESULT;
char * OGR_G_ExportToGML(OGRGeometryH );
//C     char   CPL_DLL *OGR_G_ExportToGMLEx( OGRGeometryH, char** papszOptions ) CPL_WARN_UNUSED_RESULT;
char * OGR_G_ExportToGMLEx(OGRGeometryH , char **papszOptions);

//C     OGRGeometryH CPL_DLL OGR_G_CreateFromGMLTree( const CPLXMLNode * ) CPL_WARN_UNUSED_RESULT;
OGRGeometryH  OGR_G_CreateFromGMLTree(CPLXMLNode *);
//C     CPLXMLNode CPL_DLL *OGR_G_ExportToGMLTree( OGRGeometryH ) CPL_WARN_UNUSED_RESULT;
CPLXMLNode * OGR_G_ExportToGMLTree(OGRGeometryH );
//C     CPLXMLNode CPL_DLL *OGR_G_ExportEnvelopeToGMLTree( OGRGeometryH ) CPL_WARN_UNUSED_RESULT;
CPLXMLNode * OGR_G_ExportEnvelopeToGMLTree(OGRGeometryH );

//C     char   CPL_DLL *OGR_G_ExportToKML( OGRGeometryH, const char* pszAltitudeMode ) CPL_WARN_UNUSED_RESULT;
char * OGR_G_ExportToKML(OGRGeometryH , char *pszAltitudeMode);

//C     char   CPL_DLL *OGR_G_ExportToJson( OGRGeometryH ) CPL_WARN_UNUSED_RESULT;
char * OGR_G_ExportToJson(OGRGeometryH );
//C     char   CPL_DLL *OGR_G_ExportToJsonEx( OGRGeometryH, char** papszOptions ) CPL_WARN_UNUSED_RESULT;
char * OGR_G_ExportToJsonEx(OGRGeometryH , char **papszOptions);
//C     OGRGeometryH CPL_DLL OGR_G_CreateGeometryFromJson( const char* ) CPL_WARN_UNUSED_RESULT;
OGRGeometryH  OGR_G_CreateGeometryFromJson(char *);

//C     void   CPL_DLL OGR_G_AssignSpatialReference( OGRGeometryH,
//C                                                  OGRSpatialReferenceH );
void  OGR_G_AssignSpatialReference(OGRGeometryH , OGRSpatialReferenceH );
//C     OGRSpatialReferenceH CPL_DLL OGR_G_GetSpatialReference( OGRGeometryH );
OGRSpatialReferenceH  OGR_G_GetSpatialReference(OGRGeometryH );
//C     OGRErr CPL_DLL OGR_G_Transform( OGRGeometryH, OGRCoordinateTransformationH );
OGRErr  OGR_G_Transform(OGRGeometryH , OGRCoordinateTransformationH );
//C     OGRErr CPL_DLL OGR_G_TransformTo( OGRGeometryH, OGRSpatialReferenceH );
OGRErr  OGR_G_TransformTo(OGRGeometryH , OGRSpatialReferenceH );

//C     OGRGeometryH CPL_DLL OGR_G_Simplify( OGRGeometryH hThis, double tolerance ) CPL_WARN_UNUSED_RESULT;
OGRGeometryH  OGR_G_Simplify(OGRGeometryH hThis, double tolerance);
//C     OGRGeometryH CPL_DLL OGR_G_SimplifyPreserveTopology( OGRGeometryH hThis, double tolerance ) CPL_WARN_UNUSED_RESULT;
OGRGeometryH  OGR_G_SimplifyPreserveTopology(OGRGeometryH hThis, double tolerance);
//C     OGRGeometryH CPL_DLL OGR_G_DelaunayTriangulation( OGRGeometryH hThis, double dfTolerance, int bOnlyEdges ) CPL_WARN_UNUSED_RESULT;
OGRGeometryH  OGR_G_DelaunayTriangulation(OGRGeometryH hThis, double dfTolerance, int bOnlyEdges);

//C     void   CPL_DLL OGR_G_Segmentize(OGRGeometryH hGeom, double dfMaxLength );
void  OGR_G_Segmentize(OGRGeometryH hGeom, double dfMaxLength);
//C     int    CPL_DLL OGR_G_Intersects( OGRGeometryH, OGRGeometryH );
int  OGR_G_Intersects(OGRGeometryH , OGRGeometryH );
//C     int    CPL_DLL OGR_G_Equals( OGRGeometryH, OGRGeometryH );
int  OGR_G_Equals(OGRGeometryH , OGRGeometryH );
/*int    CPL_DLL OGR_G_EqualsExact( OGRGeometryH, OGRGeometryH, double );*/
//C     int    CPL_DLL OGR_G_Disjoint( OGRGeometryH, OGRGeometryH );
int  OGR_G_Disjoint(OGRGeometryH , OGRGeometryH );
//C     int    CPL_DLL OGR_G_Touches( OGRGeometryH, OGRGeometryH );
int  OGR_G_Touches(OGRGeometryH , OGRGeometryH );
//C     int    CPL_DLL OGR_G_Crosses( OGRGeometryH, OGRGeometryH );
int  OGR_G_Crosses(OGRGeometryH , OGRGeometryH );
//C     int    CPL_DLL OGR_G_Within( OGRGeometryH, OGRGeometryH );
int  OGR_G_Within(OGRGeometryH , OGRGeometryH );
//C     int    CPL_DLL OGR_G_Contains( OGRGeometryH, OGRGeometryH );
int  OGR_G_Contains(OGRGeometryH , OGRGeometryH );
//C     int    CPL_DLL OGR_G_Overlaps( OGRGeometryH, OGRGeometryH );
int  OGR_G_Overlaps(OGRGeometryH , OGRGeometryH );

//C     OGRGeometryH CPL_DLL OGR_G_Boundary( OGRGeometryH ) CPL_WARN_UNUSED_RESULT;
OGRGeometryH  OGR_G_Boundary(OGRGeometryH );
//C     OGRGeometryH CPL_DLL OGR_G_ConvexHull( OGRGeometryH ) CPL_WARN_UNUSED_RESULT;
OGRGeometryH  OGR_G_ConvexHull(OGRGeometryH );
//C     OGRGeometryH CPL_DLL OGR_G_Buffer( OGRGeometryH, double, int ) CPL_WARN_UNUSED_RESULT;
OGRGeometryH  OGR_G_Buffer(OGRGeometryH , double , int );
//C     OGRGeometryH CPL_DLL OGR_G_Intersection( OGRGeometryH, OGRGeometryH ) CPL_WARN_UNUSED_RESULT;
OGRGeometryH  OGR_G_Intersection(OGRGeometryH , OGRGeometryH );
//C     OGRGeometryH CPL_DLL OGR_G_Union( OGRGeometryH, OGRGeometryH ) CPL_WARN_UNUSED_RESULT;
OGRGeometryH  OGR_G_Union(OGRGeometryH , OGRGeometryH );
//C     OGRGeometryH CPL_DLL OGR_G_UnionCascaded( OGRGeometryH ) CPL_WARN_UNUSED_RESULT;
OGRGeometryH  OGR_G_UnionCascaded(OGRGeometryH );
//C     OGRGeometryH CPL_DLL OGR_G_PointOnSurface( OGRGeometryH ) CPL_WARN_UNUSED_RESULT;
OGRGeometryH  OGR_G_PointOnSurface(OGRGeometryH );
/*OGRGeometryH CPL_DLL OGR_G_Polygonize( OGRGeometryH *, int);*/
/*OGRGeometryH CPL_DLL OGR_G_Polygonizer_getCutEdges( OGRGeometryH *, int);*/
/*OGRGeometryH CPL_DLL OGR_G_LineMerge( OGRGeometryH );*/

//C     OGRGeometryH CPL_DLL OGR_G_Difference( OGRGeometryH, OGRGeometryH ) CPL_WARN_UNUSED_RESULT;
OGRGeometryH  OGR_G_Difference(OGRGeometryH , OGRGeometryH );
//C     OGRGeometryH CPL_DLL OGR_G_SymDifference( OGRGeometryH, OGRGeometryH ) CPL_WARN_UNUSED_RESULT;
OGRGeometryH  OGR_G_SymDifference(OGRGeometryH , OGRGeometryH );
//C     double CPL_DLL OGR_G_Distance( OGRGeometryH, OGRGeometryH );
double  OGR_G_Distance(OGRGeometryH , OGRGeometryH );
//C     double CPL_DLL OGR_G_Length( OGRGeometryH );
double  OGR_G_Length(OGRGeometryH );
//C     double CPL_DLL OGR_G_Area( OGRGeometryH );
double  OGR_G_Area(OGRGeometryH );
//C     int    CPL_DLL OGR_G_Centroid( OGRGeometryH, OGRGeometryH );
int  OGR_G_Centroid(OGRGeometryH , OGRGeometryH );
//C     OGRGeometryH CPL_DLL OGR_G_Value( OGRGeometryH, double dfDistance ) CPL_WARN_UNUSED_RESULT;
OGRGeometryH  OGR_G_Value(OGRGeometryH , double dfDistance);

//C     void   CPL_DLL OGR_G_Empty( OGRGeometryH );
void  OGR_G_Empty(OGRGeometryH );
//C     int    CPL_DLL OGR_G_IsEmpty( OGRGeometryH );
int  OGR_G_IsEmpty(OGRGeometryH );
//C     int    CPL_DLL OGR_G_IsValid( OGRGeometryH );
int  OGR_G_IsValid(OGRGeometryH );
/*char    CPL_DLL *OGR_G_IsValidReason( OGRGeometryH );*/
//C     int    CPL_DLL OGR_G_IsSimple( OGRGeometryH );
int  OGR_G_IsSimple(OGRGeometryH );
//C     int    CPL_DLL OGR_G_IsRing( OGRGeometryH );
int  OGR_G_IsRing(OGRGeometryH );

//C     OGRGeometryH CPL_DLL OGR_G_Polygonize( OGRGeometryH ) CPL_WARN_UNUSED_RESULT;
OGRGeometryH  OGR_G_Polygonize(OGRGeometryH );

/* backward compatibility (non-standard methods) */
//C     int    CPL_DLL OGR_G_Intersect( OGRGeometryH, OGRGeometryH ) CPL_WARN_DEPRECATED("Non standard method. Use OGR_G_Intersects() instead");
int  OGR_G_Intersect(OGRGeometryH , OGRGeometryH );
//C     int    CPL_DLL OGR_G_Equal( OGRGeometryH, OGRGeometryH ) CPL_WARN_DEPRECATED("Non standard method. Use OGR_G_Equals() instead");
int  OGR_G_Equal(OGRGeometryH , OGRGeometryH );
//C     OGRGeometryH CPL_DLL OGR_G_SymmetricDifference( OGRGeometryH, OGRGeometryH ) CPL_WARN_DEPRECATED("Non standard method. Use OGR_G_SymDifference() instead");
OGRGeometryH  OGR_G_SymmetricDifference(OGRGeometryH , OGRGeometryH );
//C     double CPL_DLL OGR_G_GetArea( OGRGeometryH ) CPL_WARN_DEPRECATED("Non standard method. Use OGR_G_Area() instead");
double  OGR_G_GetArea(OGRGeometryH );
//C     OGRGeometryH CPL_DLL OGR_G_GetBoundary( OGRGeometryH ) CPL_WARN_DEPRECATED("Non standard method. Use OGR_G_Boundary() instead");
OGRGeometryH  OGR_G_GetBoundary(OGRGeometryH );

/* Methods for getting/setting vertices in points, line strings and rings */
//C     int    CPL_DLL OGR_G_GetPointCount( OGRGeometryH );
int  OGR_G_GetPointCount(OGRGeometryH );
//C     int    CPL_DLL OGR_G_GetPoints( OGRGeometryH hGeom,
//C                                     void* pabyX, int nXStride,
//C                                     void* pabyY, int nYStride,
//C                                     void* pabyZ, int nZStride);
int  OGR_G_GetPoints(OGRGeometryH hGeom, void *pabyX, int nXStride, void *pabyY, int nYStride, void *pabyZ, int nZStride);
//C     int    CPL_DLL OGR_G_GetPointsZM( OGRGeometryH hGeom,
//C                                       void* pabyX, int nXStride,
//C                                       void* pabyY, int nYStride,
//C                                       void* pabyZ, int nZStride,
//C                                       void* pabyM, int nMStride);
int  OGR_G_GetPointsZM(OGRGeometryH hGeom, void *pabyX, int nXStride, void *pabyY, int nYStride, void *pabyZ, int nZStride, void *pabyM, int nMStride);
//C     double CPL_DLL OGR_G_GetX( OGRGeometryH, int );
double  OGR_G_GetX(OGRGeometryH , int );
//C     double CPL_DLL OGR_G_GetY( OGRGeometryH, int );
double  OGR_G_GetY(OGRGeometryH , int );
//C     double CPL_DLL OGR_G_GetZ( OGRGeometryH, int );
double  OGR_G_GetZ(OGRGeometryH , int );
//C     double CPL_DLL OGR_G_GetM( OGRGeometryH, int );
double  OGR_G_GetM(OGRGeometryH , int );
//C     void   CPL_DLL OGR_G_GetPoint( OGRGeometryH, int iPoint,
//C                                    double *, double *, double * );
void  OGR_G_GetPoint(OGRGeometryH , int iPoint, double *, double *, double *);
//C     void   CPL_DLL OGR_G_GetPointZM( OGRGeometryH, int iPoint,
//C                                      double *, double *, double *, double * );
void  OGR_G_GetPointZM(OGRGeometryH , int iPoint, double *, double *, double *, double *);
//C     void   CPL_DLL OGR_G_SetPointCount( OGRGeometryH hGeom, int nNewPointCount );
void  OGR_G_SetPointCount(OGRGeometryH hGeom, int nNewPointCount);
//C     void   CPL_DLL OGR_G_SetPoint( OGRGeometryH, int iPoint,
//C                                    double, double, double );
void  OGR_G_SetPoint(OGRGeometryH , int iPoint, double , double , double );
//C     void   CPL_DLL OGR_G_SetPoint_2D( OGRGeometryH, int iPoint,
//C                                       double, double );
void  OGR_G_SetPoint_2D(OGRGeometryH , int iPoint, double , double );
//C     void   CPL_DLL OGR_G_SetPointM( OGRGeometryH, int iPoint,
//C                                     double, double, double );
void  OGR_G_SetPointM(OGRGeometryH , int iPoint, double , double , double );
//C     void   CPL_DLL OGR_G_SetPointZM( OGRGeometryH, int iPoint,
//C                                      double, double, double, double );
void  OGR_G_SetPointZM(OGRGeometryH , int iPoint, double , double , double , double );
//C     void   CPL_DLL OGR_G_AddPoint( OGRGeometryH, double, double, double );
void  OGR_G_AddPoint(OGRGeometryH , double , double , double );
//C     void   CPL_DLL OGR_G_AddPoint_2D( OGRGeometryH, double, double );
void  OGR_G_AddPoint_2D(OGRGeometryH , double , double );
//C     void   CPL_DLL OGR_G_AddPointM( OGRGeometryH, double, double, double );
void  OGR_G_AddPointM(OGRGeometryH , double , double , double );
//C     void   CPL_DLL OGR_G_AddPointZM( OGRGeometryH, double, double, double, double );
void  OGR_G_AddPointZM(OGRGeometryH , double , double , double , double );
//C     void   CPL_DLL OGR_G_SetPoints( OGRGeometryH hGeom, int nPointsIn,
//C                                     void* pabyX, int nXStride,
//C                                     void* pabyY, int nYStride,
//C                                     void* pabyZ, int nZStride );
void  OGR_G_SetPoints(OGRGeometryH hGeom, int nPointsIn, void *pabyX, int nXStride, void *pabyY, int nYStride, void *pabyZ, int nZStride);
//C     void   CPL_DLL OGR_G_SetPointsZM( OGRGeometryH hGeom, int nPointsIn,
//C                                       void* pabyX, int nXStride,
//C                                       void* pabyY, int nYStride,
//C                                       void* pabyZ, int nZStride,
//C                                       void* pabyM, int nMStride );
void  OGR_G_SetPointsZM(OGRGeometryH hGeom, int nPointsIn, void *pabyX, int nXStride, void *pabyY, int nYStride, void *pabyZ, int nZStride, void *pabyM, int nMStride);

/* Methods for getting/setting rings and members collections */

//C     int    CPL_DLL OGR_G_GetGeometryCount( OGRGeometryH );
int  OGR_G_GetGeometryCount(OGRGeometryH );
//C     OGRGeometryH CPL_DLL OGR_G_GetGeometryRef( OGRGeometryH, int );
OGRGeometryH  OGR_G_GetGeometryRef(OGRGeometryH , int );
//C     OGRErr CPL_DLL OGR_G_AddGeometry( OGRGeometryH, OGRGeometryH );
OGRErr  OGR_G_AddGeometry(OGRGeometryH , OGRGeometryH );
//C     OGRErr CPL_DLL OGR_G_AddGeometryDirectly( OGRGeometryH, OGRGeometryH );
OGRErr  OGR_G_AddGeometryDirectly(OGRGeometryH , OGRGeometryH );
//C     OGRErr CPL_DLL OGR_G_RemoveGeometry( OGRGeometryH, int, int );
OGRErr  OGR_G_RemoveGeometry(OGRGeometryH , int , int );

//C     int CPL_DLL OGR_G_HasCurveGeometry( OGRGeometryH, int bLookForNonLinear );
int  OGR_G_HasCurveGeometry(OGRGeometryH , int bLookForNonLinear);
//C     OGRGeometryH CPL_DLL OGR_G_GetLinearGeometry( OGRGeometryH hGeom,
//C                                                   double dfMaxAngleStepSizeDegrees,
//C                                                   char** papszOptions) CPL_WARN_UNUSED_RESULT;
OGRGeometryH  OGR_G_GetLinearGeometry(OGRGeometryH hGeom, double dfMaxAngleStepSizeDegrees, char **papszOptions);
//C     OGRGeometryH CPL_DLL OGR_G_GetCurveGeometry( OGRGeometryH hGeom,
//C                                                  char** papszOptions ) CPL_WARN_UNUSED_RESULT;
OGRGeometryH  OGR_G_GetCurveGeometry(OGRGeometryH hGeom, char **papszOptions);

//C     OGRGeometryH CPL_DLL OGRBuildPolygonFromEdges( OGRGeometryH hLinesAsCollection,
//C                                            int bBestEffort,
//C                                            int bAutoClose,
//C                                            double dfTolerance,
//C                                            OGRErr * peErr ) CPL_WARN_UNUSED_RESULT;
OGRGeometryH  OGRBuildPolygonFromEdges(OGRGeometryH hLinesAsCollection, int bBestEffort, int bAutoClose, double dfTolerance, OGRErr *peErr);

//C     OGRErr CPL_DLL OGRSetGenerate_DB2_V72_BYTE_ORDER(
//C         int bGenerate_DB2_V72_BYTE_ORDER );
OGRErr  OGRSetGenerate_DB2_V72_BYTE_ORDER(int bGenerate_DB2_V72_BYTE_ORDER);

//C     int CPL_DLL OGRGetGenerate_DB2_V72_BYTE_ORDER(void);
int  OGRGetGenerate_DB2_V72_BYTE_ORDER();

//C     void CPL_DLL OGRSetNonLinearGeometriesEnabledFlag(int bFlag);
void  OGRSetNonLinearGeometriesEnabledFlag(int bFlag);
//C     int CPL_DLL OGRGetNonLinearGeometriesEnabledFlag(void);
int  OGRGetNonLinearGeometriesEnabledFlag();

/* -------------------------------------------------------------------- */
/*      Feature related (ogr_feature.h)                                 */
/* -------------------------------------------------------------------- */

//C     #ifdef DEBUG
//C     typedef struct OGRFieldDefnHS   *OGRFieldDefnH;
//C     typedef struct OGRFeatureDefnHS *OGRFeatureDefnH;
//C     typedef struct OGRFeatureHS     *OGRFeatureH;
//C     typedef struct OGRStyleTableHS *OGRStyleTableH;
//C     #else
//C     typedef void *OGRFieldDefnH;
alias void *OGRFieldDefnH;
//C     typedef void *OGRFeatureDefnH;
alias void *OGRFeatureDefnH;
//C     typedef void *OGRFeatureH;
alias void *OGRFeatureH;
//C     typedef void *OGRStyleTableH;
alias void *OGRStyleTableH;
//C     #endif
//C     typedef struct OGRGeomFieldDefnHS *OGRGeomFieldDefnH;
alias OGRGeomFieldDefnHS *OGRGeomFieldDefnH;

/* OGRFieldDefn */

//C     OGRFieldDefnH CPL_DLL OGR_Fld_Create( const char *, OGRFieldType ) CPL_WARN_UNUSED_RESULT;
OGRFieldDefnH  OGR_Fld_Create(char *, OGRFieldType );
//C     void   CPL_DLL OGR_Fld_Destroy( OGRFieldDefnH );
void  OGR_Fld_Destroy(OGRFieldDefnH );

//C     void   CPL_DLL OGR_Fld_SetName( OGRFieldDefnH, const char * );
void  OGR_Fld_SetName(OGRFieldDefnH , char *);
//C     const char CPL_DLL *OGR_Fld_GetNameRef( OGRFieldDefnH );
char * OGR_Fld_GetNameRef(OGRFieldDefnH );
//C     OGRFieldType CPL_DLL OGR_Fld_GetType( OGRFieldDefnH );
OGRFieldType  OGR_Fld_GetType(OGRFieldDefnH );
//C     void   CPL_DLL OGR_Fld_SetType( OGRFieldDefnH, OGRFieldType );
void  OGR_Fld_SetType(OGRFieldDefnH , OGRFieldType );
//C     OGRFieldSubType CPL_DLL OGR_Fld_GetSubType( OGRFieldDefnH );
OGRFieldSubType  OGR_Fld_GetSubType(OGRFieldDefnH );
//C     void   CPL_DLL OGR_Fld_SetSubType( OGRFieldDefnH, OGRFieldSubType );
void  OGR_Fld_SetSubType(OGRFieldDefnH , OGRFieldSubType );
//C     OGRJustification CPL_DLL OGR_Fld_GetJustify( OGRFieldDefnH );
OGRJustification  OGR_Fld_GetJustify(OGRFieldDefnH );
//C     void   CPL_DLL OGR_Fld_SetJustify( OGRFieldDefnH, OGRJustification );
void  OGR_Fld_SetJustify(OGRFieldDefnH , OGRJustification );
//C     int    CPL_DLL OGR_Fld_GetWidth( OGRFieldDefnH );
int  OGR_Fld_GetWidth(OGRFieldDefnH );
//C     void   CPL_DLL OGR_Fld_SetWidth( OGRFieldDefnH, int );
void  OGR_Fld_SetWidth(OGRFieldDefnH , int );
//C     int    CPL_DLL OGR_Fld_GetPrecision( OGRFieldDefnH );
int  OGR_Fld_GetPrecision(OGRFieldDefnH );
//C     void   CPL_DLL OGR_Fld_SetPrecision( OGRFieldDefnH, int );
void  OGR_Fld_SetPrecision(OGRFieldDefnH , int );
//C     void   CPL_DLL OGR_Fld_Set( OGRFieldDefnH, const char *, OGRFieldType,
//C                                 int, int, OGRJustification );
void  OGR_Fld_Set(OGRFieldDefnH , char *, OGRFieldType , int , int , OGRJustification );
//C     int    CPL_DLL OGR_Fld_IsIgnored( OGRFieldDefnH hDefn );
int  OGR_Fld_IsIgnored(OGRFieldDefnH hDefn);
//C     void   CPL_DLL OGR_Fld_SetIgnored( OGRFieldDefnH hDefn, int );
void  OGR_Fld_SetIgnored(OGRFieldDefnH hDefn, int );
//C     int    CPL_DLL OGR_Fld_IsNullable( OGRFieldDefnH hDefn );
int  OGR_Fld_IsNullable(OGRFieldDefnH hDefn);
//C     void   CPL_DLL OGR_Fld_SetNullable( OGRFieldDefnH hDefn, int );
void  OGR_Fld_SetNullable(OGRFieldDefnH hDefn, int );
//C     const char CPL_DLL *OGR_Fld_GetDefault( OGRFieldDefnH hDefn );
char * OGR_Fld_GetDefault(OGRFieldDefnH hDefn);
//C     void   CPL_DLL OGR_Fld_SetDefault( OGRFieldDefnH hDefn, const char* );
void  OGR_Fld_SetDefault(OGRFieldDefnH hDefn, char *);
//C     int    CPL_DLL OGR_Fld_IsDefaultDriverSpecific( OGRFieldDefnH hDefn );
int  OGR_Fld_IsDefaultDriverSpecific(OGRFieldDefnH hDefn);

//C     const char CPL_DLL *OGR_GetFieldTypeName( OGRFieldType );
char * OGR_GetFieldTypeName(OGRFieldType );
//C     const char CPL_DLL *OGR_GetFieldSubTypeName( OGRFieldSubType );
char * OGR_GetFieldSubTypeName(OGRFieldSubType );
//C     int CPL_DLL OGR_AreTypeSubTypeCompatible( OGRFieldType eType,
//C                                               OGRFieldSubType eSubType );
int  OGR_AreTypeSubTypeCompatible(OGRFieldType eType, OGRFieldSubType eSubType);

/* OGRGeomFieldDefnH */

//C     OGRGeomFieldDefnH    CPL_DLL OGR_GFld_Create( const char *, OGRwkbGeometryType ) CPL_WARN_UNUSED_RESULT;
OGRGeomFieldDefnH  OGR_GFld_Create(char *, OGRwkbGeometryType );
//C     void                 CPL_DLL OGR_GFld_Destroy( OGRGeomFieldDefnH );
void  OGR_GFld_Destroy(OGRGeomFieldDefnH );

//C     void                 CPL_DLL OGR_GFld_SetName( OGRGeomFieldDefnH, const char * );
void  OGR_GFld_SetName(OGRGeomFieldDefnH , char *);
//C     const char           CPL_DLL *OGR_GFld_GetNameRef( OGRGeomFieldDefnH );
char * OGR_GFld_GetNameRef(OGRGeomFieldDefnH );

//C     OGRwkbGeometryType   CPL_DLL OGR_GFld_GetType( OGRGeomFieldDefnH );
OGRwkbGeometryType  OGR_GFld_GetType(OGRGeomFieldDefnH );
//C     void                 CPL_DLL OGR_GFld_SetType( OGRGeomFieldDefnH, OGRwkbGeometryType );
void  OGR_GFld_SetType(OGRGeomFieldDefnH , OGRwkbGeometryType );

//C     OGRSpatialReferenceH CPL_DLL OGR_GFld_GetSpatialRef( OGRGeomFieldDefnH );
OGRSpatialReferenceH  OGR_GFld_GetSpatialRef(OGRGeomFieldDefnH );
//C     void                 CPL_DLL OGR_GFld_SetSpatialRef( OGRGeomFieldDefnH,
//C                                                          OGRSpatialReferenceH hSRS );
void  OGR_GFld_SetSpatialRef(OGRGeomFieldDefnH , OGRSpatialReferenceH hSRS);

//C     int                  CPL_DLL OGR_GFld_IsNullable( OGRGeomFieldDefnH hDefn );
int  OGR_GFld_IsNullable(OGRGeomFieldDefnH hDefn);
//C     void                 CPL_DLL OGR_GFld_SetNullable( OGRGeomFieldDefnH hDefn, int );
void  OGR_GFld_SetNullable(OGRGeomFieldDefnH hDefn, int );

//C     int                  CPL_DLL OGR_GFld_IsIgnored( OGRGeomFieldDefnH hDefn );
int  OGR_GFld_IsIgnored(OGRGeomFieldDefnH hDefn);
//C     void                 CPL_DLL OGR_GFld_SetIgnored( OGRGeomFieldDefnH hDefn, int );
void  OGR_GFld_SetIgnored(OGRGeomFieldDefnH hDefn, int );

/* OGRFeatureDefn */

//C     OGRFeatureDefnH CPL_DLL OGR_FD_Create( const char * ) CPL_WARN_UNUSED_RESULT;
OGRFeatureDefnH  OGR_FD_Create(char *);
//C     void   CPL_DLL OGR_FD_Destroy( OGRFeatureDefnH );
void  OGR_FD_Destroy(OGRFeatureDefnH );
//C     void   CPL_DLL OGR_FD_Release( OGRFeatureDefnH );
void  OGR_FD_Release(OGRFeatureDefnH );
//C     const char CPL_DLL *OGR_FD_GetName( OGRFeatureDefnH );
char * OGR_FD_GetName(OGRFeatureDefnH );
//C     int    CPL_DLL OGR_FD_GetFieldCount( OGRFeatureDefnH );
int  OGR_FD_GetFieldCount(OGRFeatureDefnH );
//C     OGRFieldDefnH CPL_DLL OGR_FD_GetFieldDefn( OGRFeatureDefnH, int );
OGRFieldDefnH  OGR_FD_GetFieldDefn(OGRFeatureDefnH , int );
//C     int    CPL_DLL OGR_FD_GetFieldIndex( OGRFeatureDefnH, const char * );
int  OGR_FD_GetFieldIndex(OGRFeatureDefnH , char *);
//C     void   CPL_DLL OGR_FD_AddFieldDefn( OGRFeatureDefnH, OGRFieldDefnH );
void  OGR_FD_AddFieldDefn(OGRFeatureDefnH , OGRFieldDefnH );
//C     OGRErr CPL_DLL OGR_FD_DeleteFieldDefn( OGRFeatureDefnH hDefn, int iField );
OGRErr  OGR_FD_DeleteFieldDefn(OGRFeatureDefnH hDefn, int iField);
//C     OGRErr CPL_DLL OGR_FD_ReorderFieldDefns( OGRFeatureDefnH hDefn, int* panMap );
OGRErr  OGR_FD_ReorderFieldDefns(OGRFeatureDefnH hDefn, int *panMap);
//C     OGRwkbGeometryType CPL_DLL OGR_FD_GetGeomType( OGRFeatureDefnH );
OGRwkbGeometryType  OGR_FD_GetGeomType(OGRFeatureDefnH );
//C     void   CPL_DLL OGR_FD_SetGeomType( OGRFeatureDefnH, OGRwkbGeometryType );
void  OGR_FD_SetGeomType(OGRFeatureDefnH , OGRwkbGeometryType );
//C     int    CPL_DLL OGR_FD_IsGeometryIgnored( OGRFeatureDefnH );
int  OGR_FD_IsGeometryIgnored(OGRFeatureDefnH );
//C     void   CPL_DLL OGR_FD_SetGeometryIgnored( OGRFeatureDefnH, int );
void  OGR_FD_SetGeometryIgnored(OGRFeatureDefnH , int );
//C     int    CPL_DLL OGR_FD_IsStyleIgnored( OGRFeatureDefnH );
int  OGR_FD_IsStyleIgnored(OGRFeatureDefnH );
//C     void   CPL_DLL OGR_FD_SetStyleIgnored( OGRFeatureDefnH, int );
void  OGR_FD_SetStyleIgnored(OGRFeatureDefnH , int );
//C     int    CPL_DLL OGR_FD_Reference( OGRFeatureDefnH );
int  OGR_FD_Reference(OGRFeatureDefnH );
//C     int    CPL_DLL OGR_FD_Dereference( OGRFeatureDefnH );
int  OGR_FD_Dereference(OGRFeatureDefnH );
//C     int    CPL_DLL OGR_FD_GetReferenceCount( OGRFeatureDefnH );
int  OGR_FD_GetReferenceCount(OGRFeatureDefnH );

//C     int               CPL_DLL OGR_FD_GetGeomFieldCount( OGRFeatureDefnH hFDefn );
int  OGR_FD_GetGeomFieldCount(OGRFeatureDefnH hFDefn);
//C     OGRGeomFieldDefnH CPL_DLL OGR_FD_GetGeomFieldDefn( OGRFeatureDefnH hFDefn,
//C                                                        int i );
OGRGeomFieldDefnH  OGR_FD_GetGeomFieldDefn(OGRFeatureDefnH hFDefn, int i);
//C     int               CPL_DLL OGR_FD_GetGeomFieldIndex( OGRFeatureDefnH hFDefn,
//C                                                         const char *pszName);
int  OGR_FD_GetGeomFieldIndex(OGRFeatureDefnH hFDefn, char *pszName);

//C     void              CPL_DLL OGR_FD_AddGeomFieldDefn( OGRFeatureDefnH hFDefn,
//C                                                        OGRGeomFieldDefnH hGFldDefn);
void  OGR_FD_AddGeomFieldDefn(OGRFeatureDefnH hFDefn, OGRGeomFieldDefnH hGFldDefn);
//C     OGRErr            CPL_DLL OGR_FD_DeleteGeomFieldDefn( OGRFeatureDefnH hFDefn,
//C                                                           int iGeomField );
OGRErr  OGR_FD_DeleteGeomFieldDefn(OGRFeatureDefnH hFDefn, int iGeomField);
//C     int               CPL_DLL OGR_FD_IsSame( OGRFeatureDefnH hFDefn,
//C                                              OGRFeatureDefnH hOtherFDefn );
int  OGR_FD_IsSame(OGRFeatureDefnH hFDefn, OGRFeatureDefnH hOtherFDefn);
/* OGRFeature */

//C     OGRFeatureH CPL_DLL OGR_F_Create( OGRFeatureDefnH ) CPL_WARN_UNUSED_RESULT;
OGRFeatureH  OGR_F_Create(OGRFeatureDefnH );
//C     void   CPL_DLL OGR_F_Destroy( OGRFeatureH );
void  OGR_F_Destroy(OGRFeatureH );
//C     OGRFeatureDefnH CPL_DLL OGR_F_GetDefnRef( OGRFeatureH );
OGRFeatureDefnH  OGR_F_GetDefnRef(OGRFeatureH );

//C     OGRErr CPL_DLL OGR_F_SetGeometryDirectly( OGRFeatureH, OGRGeometryH );
OGRErr  OGR_F_SetGeometryDirectly(OGRFeatureH , OGRGeometryH );
//C     OGRErr CPL_DLL OGR_F_SetGeometry( OGRFeatureH, OGRGeometryH );
OGRErr  OGR_F_SetGeometry(OGRFeatureH , OGRGeometryH );
//C     OGRGeometryH CPL_DLL OGR_F_GetGeometryRef( OGRFeatureH );
OGRGeometryH  OGR_F_GetGeometryRef(OGRFeatureH );
//C     OGRGeometryH CPL_DLL OGR_F_StealGeometry( OGRFeatureH ) CPL_WARN_UNUSED_RESULT;
OGRGeometryH  OGR_F_StealGeometry(OGRFeatureH );
//C     OGRFeatureH CPL_DLL OGR_F_Clone( OGRFeatureH ) CPL_WARN_UNUSED_RESULT;
OGRFeatureH  OGR_F_Clone(OGRFeatureH );
//C     int    CPL_DLL OGR_F_Equal( OGRFeatureH, OGRFeatureH );
int  OGR_F_Equal(OGRFeatureH , OGRFeatureH );

//C     int    CPL_DLL OGR_F_GetFieldCount( OGRFeatureH );
int  OGR_F_GetFieldCount(OGRFeatureH );
//C     OGRFieldDefnH CPL_DLL OGR_F_GetFieldDefnRef( OGRFeatureH, int );
OGRFieldDefnH  OGR_F_GetFieldDefnRef(OGRFeatureH , int );
//C     int    CPL_DLL OGR_F_GetFieldIndex( OGRFeatureH, const char * );
int  OGR_F_GetFieldIndex(OGRFeatureH , char *);

//C     int    CPL_DLL OGR_F_IsFieldSet( OGRFeatureH, int );
int  OGR_F_IsFieldSet(OGRFeatureH , int );
//C     void   CPL_DLL OGR_F_UnsetField( OGRFeatureH, int );
void  OGR_F_UnsetField(OGRFeatureH , int );
//C     OGRField CPL_DLL *OGR_F_GetRawFieldRef( OGRFeatureH, int );
OGRField * OGR_F_GetRawFieldRef(OGRFeatureH , int );

//C     int    CPL_DLL OGR_F_GetFieldAsInteger( OGRFeatureH, int );
int  OGR_F_GetFieldAsInteger(OGRFeatureH , int );
//C     GIntBig CPL_DLL OGR_F_GetFieldAsInteger64( OGRFeatureH, int );
GIntBig  OGR_F_GetFieldAsInteger64(OGRFeatureH , int );
//C     double CPL_DLL OGR_F_GetFieldAsDouble( OGRFeatureH, int );
double  OGR_F_GetFieldAsDouble(OGRFeatureH , int );
//C     const char CPL_DLL *OGR_F_GetFieldAsString( OGRFeatureH, int );
char * OGR_F_GetFieldAsString(OGRFeatureH , int );
//C     const int CPL_DLL *OGR_F_GetFieldAsIntegerList( OGRFeatureH, int, int * );
int * OGR_F_GetFieldAsIntegerList(OGRFeatureH , int , int *);
//C     const GIntBig CPL_DLL *OGR_F_GetFieldAsInteger64List( OGRFeatureH, int, int * );
GIntBig * OGR_F_GetFieldAsInteger64List(OGRFeatureH , int , int *);
//C     const double CPL_DLL *OGR_F_GetFieldAsDoubleList( OGRFeatureH, int, int * );
double * OGR_F_GetFieldAsDoubleList(OGRFeatureH , int , int *);
//C     char  CPL_DLL **OGR_F_GetFieldAsStringList( OGRFeatureH, int );
char ** OGR_F_GetFieldAsStringList(OGRFeatureH , int );
//C     GByte CPL_DLL *OGR_F_GetFieldAsBinary( OGRFeatureH, int, int * );
GByte * OGR_F_GetFieldAsBinary(OGRFeatureH , int , int *);
//C     int   CPL_DLL  OGR_F_GetFieldAsDateTime( OGRFeatureH, int, int *, int *, int *,
//C                                              int *, int *, int *, int * );
int  OGR_F_GetFieldAsDateTime(OGRFeatureH , int , int *, int *, int *, int *, int *, int *, int *);
//C     int   CPL_DLL OGR_F_GetFieldAsDateTimeEx( OGRFeatureH hFeat, int iField,
//C                                     int *pnYear, int *pnMonth, int *pnDay,
//C                                     int *pnHour, int *pnMinute, float *pfSecond,
//C                                     int *pnTZFlag );
int  OGR_F_GetFieldAsDateTimeEx(OGRFeatureH hFeat, int iField, int *pnYear, int *pnMonth, int *pnDay, int *pnHour, int *pnMinute, float *pfSecond, int *pnTZFlag);

//C     void   CPL_DLL OGR_F_SetFieldInteger( OGRFeatureH, int, int );
void  OGR_F_SetFieldInteger(OGRFeatureH , int , int );
//C     void   CPL_DLL OGR_F_SetFieldInteger64( OGRFeatureH, int, GIntBig );
void  OGR_F_SetFieldInteger64(OGRFeatureH , int , GIntBig );
//C     void   CPL_DLL OGR_F_SetFieldDouble( OGRFeatureH, int, double );
void  OGR_F_SetFieldDouble(OGRFeatureH , int , double );
//C     void   CPL_DLL OGR_F_SetFieldString( OGRFeatureH, int, const char * );
void  OGR_F_SetFieldString(OGRFeatureH , int , char *);
//C     void   CPL_DLL OGR_F_SetFieldIntegerList( OGRFeatureH, int, int, int * );
void  OGR_F_SetFieldIntegerList(OGRFeatureH , int , int , int *);
//C     void   CPL_DLL OGR_F_SetFieldInteger64List( OGRFeatureH, int, int, const GIntBig * );
void  OGR_F_SetFieldInteger64List(OGRFeatureH , int , int , GIntBig *);
//C     void   CPL_DLL OGR_F_SetFieldDoubleList( OGRFeatureH, int, int, double * );
void  OGR_F_SetFieldDoubleList(OGRFeatureH , int , int , double *);
//C     void   CPL_DLL OGR_F_SetFieldStringList( OGRFeatureH, int, char ** );
void  OGR_F_SetFieldStringList(OGRFeatureH , int , char **);
//C     void   CPL_DLL OGR_F_SetFieldRaw( OGRFeatureH, int, OGRField * );
void  OGR_F_SetFieldRaw(OGRFeatureH , int , OGRField *);
//C     void   CPL_DLL OGR_F_SetFieldBinary( OGRFeatureH, int, int, GByte * );
void  OGR_F_SetFieldBinary(OGRFeatureH , int , int , GByte *);
//C     void   CPL_DLL OGR_F_SetFieldDateTime( OGRFeatureH, int,
//C                                            int, int, int, int, int, int, int );
void  OGR_F_SetFieldDateTime(OGRFeatureH , int , int , int , int , int , int , int , int );
//C     void   CPL_DLL OGR_F_SetFieldDateTimeEx( OGRFeatureH, int,
//C                                            int, int, int, int, int, float, int );
void  OGR_F_SetFieldDateTimeEx(OGRFeatureH , int , int , int , int , int , int , float , int );

//C     int               CPL_DLL OGR_F_GetGeomFieldCount( OGRFeatureH hFeat );
int  OGR_F_GetGeomFieldCount(OGRFeatureH hFeat);
//C     OGRGeomFieldDefnH CPL_DLL OGR_F_GetGeomFieldDefnRef( OGRFeatureH hFeat,
//C                                                          int iField );
OGRGeomFieldDefnH  OGR_F_GetGeomFieldDefnRef(OGRFeatureH hFeat, int iField);
//C     int               CPL_DLL OGR_F_GetGeomFieldIndex( OGRFeatureH hFeat,
//C                                                        const char *pszName);
int  OGR_F_GetGeomFieldIndex(OGRFeatureH hFeat, char *pszName);

//C     OGRGeometryH      CPL_DLL OGR_F_GetGeomFieldRef( OGRFeatureH hFeat,
//C                                                      int iField );
OGRGeometryH  OGR_F_GetGeomFieldRef(OGRFeatureH hFeat, int iField);
//C     OGRErr            CPL_DLL OGR_F_SetGeomFieldDirectly( OGRFeatureH hFeat,
//C                                                           int iField,
//C                                                           OGRGeometryH hGeom );
OGRErr  OGR_F_SetGeomFieldDirectly(OGRFeatureH hFeat, int iField, OGRGeometryH hGeom);
//C     OGRErr            CPL_DLL OGR_F_SetGeomField( OGRFeatureH hFeat,
//C                                                   int iField, OGRGeometryH hGeom );
OGRErr  OGR_F_SetGeomField(OGRFeatureH hFeat, int iField, OGRGeometryH hGeom);

//C     GIntBig CPL_DLL OGR_F_GetFID( OGRFeatureH );
GIntBig  OGR_F_GetFID(OGRFeatureH );
//C     OGRErr CPL_DLL OGR_F_SetFID( OGRFeatureH, GIntBig );
OGRErr  OGR_F_SetFID(OGRFeatureH , GIntBig );
//C     void   CPL_DLL OGR_F_DumpReadable( OGRFeatureH, FILE * );
void  OGR_F_DumpReadable(OGRFeatureH , FILE *);
//C     OGRErr CPL_DLL OGR_F_SetFrom( OGRFeatureH, OGRFeatureH, int );
OGRErr  OGR_F_SetFrom(OGRFeatureH , OGRFeatureH , int );
//C     OGRErr CPL_DLL OGR_F_SetFromWithMap( OGRFeatureH, OGRFeatureH, int , int * );
OGRErr  OGR_F_SetFromWithMap(OGRFeatureH , OGRFeatureH , int , int *);

//C     const char CPL_DLL *OGR_F_GetStyleString( OGRFeatureH );
char * OGR_F_GetStyleString(OGRFeatureH );
//C     void   CPL_DLL OGR_F_SetStyleString( OGRFeatureH, const char * );
void  OGR_F_SetStyleString(OGRFeatureH , char *);
//C     void   CPL_DLL OGR_F_SetStyleStringDirectly( OGRFeatureH, char * );
void  OGR_F_SetStyleStringDirectly(OGRFeatureH , char *);
//C     OGRStyleTableH CPL_DLL OGR_F_GetStyleTable( OGRFeatureH );
OGRStyleTableH  OGR_F_GetStyleTable(OGRFeatureH );
//C     void   CPL_DLL OGR_F_SetStyleTableDirectly( OGRFeatureH, OGRStyleTableH );
void  OGR_F_SetStyleTableDirectly(OGRFeatureH , OGRStyleTableH );
//C     void   CPL_DLL OGR_F_SetStyleTable( OGRFeatureH, OGRStyleTableH );
void  OGR_F_SetStyleTable(OGRFeatureH , OGRStyleTableH );

//C     const char CPL_DLL *OGR_F_GetNativeData( OGRFeatureH );
char * OGR_F_GetNativeData(OGRFeatureH );
//C     void CPL_DLL OGR_F_SetNativeData( OGRFeatureH, const char* );
void  OGR_F_SetNativeData(OGRFeatureH , char *);
//C     const char CPL_DLL *OGR_F_GetNativeMediaType( OGRFeatureH );
char * OGR_F_GetNativeMediaType(OGRFeatureH );
//C     void CPL_DLL OGR_F_SetNativeMediaType( OGRFeatureH, const char* );
void  OGR_F_SetNativeMediaType(OGRFeatureH , char *);

//C     void   CPL_DLL OGR_F_FillUnsetWithDefault( OGRFeatureH hFeat,
//C                                                int bNotNullableOnly,
//C                                                char** papszOptions );
void  OGR_F_FillUnsetWithDefault(OGRFeatureH hFeat, int bNotNullableOnly, char **papszOptions);
//C     int    CPL_DLL OGR_F_Validate( OGRFeatureH, int nValidateFlags, int bEmitError );
int  OGR_F_Validate(OGRFeatureH , int nValidateFlags, int bEmitError);

/* -------------------------------------------------------------------- */
/*      ogrsf_frmts.h                                                   */
/* -------------------------------------------------------------------- */

//C     #ifdef DEBUG
//C     typedef struct OGRLayerHS      *OGRLayerH;
//C     typedef struct OGRDataSourceHS *OGRDataSourceH;
//C     typedef struct OGRDriverHS     *OGRSFDriverH;
//C     #else
//C     typedef void *OGRLayerH;
alias void *OGRLayerH;
//C     typedef void *OGRDataSourceH;
alias void *OGRDataSourceH;
//C     typedef void *OGRSFDriverH;
alias void *OGRSFDriverH;
//C     #endif

/* OGRLayer */

//C     const char CPL_DLL* OGR_L_GetName( OGRLayerH );
char * OGR_L_GetName(OGRLayerH );
//C     OGRwkbGeometryType CPL_DLL OGR_L_GetGeomType( OGRLayerH );
OGRwkbGeometryType  OGR_L_GetGeomType(OGRLayerH );
//C     OGRGeometryH CPL_DLL OGR_L_GetSpatialFilter( OGRLayerH );
OGRGeometryH  OGR_L_GetSpatialFilter(OGRLayerH );
//C     void   CPL_DLL OGR_L_SetSpatialFilter( OGRLayerH, OGRGeometryH );
void  OGR_L_SetSpatialFilter(OGRLayerH , OGRGeometryH );
//C     void   CPL_DLL OGR_L_SetSpatialFilterRect( OGRLayerH,
//C                                                double, double, double, double );
void  OGR_L_SetSpatialFilterRect(OGRLayerH , double , double , double , double );
//C     void     CPL_DLL OGR_L_SetSpatialFilterEx( OGRLayerH, int iGeomField,
//C                                                OGRGeometryH hGeom );
void  OGR_L_SetSpatialFilterEx(OGRLayerH , int iGeomField, OGRGeometryH hGeom);
//C     void     CPL_DLL OGR_L_SetSpatialFilterRectEx( OGRLayerH, int iGeomField,
//C                                                    double dfMinX, double dfMinY,
//C                                                    double dfMaxX, double dfMaxY );
void  OGR_L_SetSpatialFilterRectEx(OGRLayerH , int iGeomField, double dfMinX, double dfMinY, double dfMaxX, double dfMaxY);
//C     OGRErr CPL_DLL OGR_L_SetAttributeFilter( OGRLayerH, const char * );
OGRErr  OGR_L_SetAttributeFilter(OGRLayerH , char *);
//C     void   CPL_DLL OGR_L_ResetReading( OGRLayerH );
void  OGR_L_ResetReading(OGRLayerH );
//C     OGRFeatureH CPL_DLL OGR_L_GetNextFeature( OGRLayerH ) CPL_WARN_UNUSED_RESULT;
OGRFeatureH  OGR_L_GetNextFeature(OGRLayerH );
//C     OGRErr CPL_DLL OGR_L_SetNextByIndex( OGRLayerH, GIntBig );
OGRErr  OGR_L_SetNextByIndex(OGRLayerH , GIntBig );
//C     OGRFeatureH CPL_DLL OGR_L_GetFeature( OGRLayerH, GIntBig )  CPL_WARN_UNUSED_RESULT;
OGRFeatureH  OGR_L_GetFeature(OGRLayerH , GIntBig );
//C     OGRErr CPL_DLL OGR_L_SetFeature( OGRLayerH, OGRFeatureH ) CPL_WARN_UNUSED_RESULT;
OGRErr  OGR_L_SetFeature(OGRLayerH , OGRFeatureH );
//C     OGRErr CPL_DLL OGR_L_CreateFeature( OGRLayerH, OGRFeatureH ) CPL_WARN_UNUSED_RESULT;
OGRErr  OGR_L_CreateFeature(OGRLayerH , OGRFeatureH );
//C     OGRErr CPL_DLL OGR_L_DeleteFeature( OGRLayerH, GIntBig ) CPL_WARN_UNUSED_RESULT;
OGRErr  OGR_L_DeleteFeature(OGRLayerH , GIntBig );
//C     OGRFeatureDefnH CPL_DLL OGR_L_GetLayerDefn( OGRLayerH );
OGRFeatureDefnH  OGR_L_GetLayerDefn(OGRLayerH );
//C     OGRSpatialReferenceH CPL_DLL OGR_L_GetSpatialRef( OGRLayerH );
OGRSpatialReferenceH  OGR_L_GetSpatialRef(OGRLayerH );
//C     int    CPL_DLL OGR_L_FindFieldIndex( OGRLayerH, const char *, int bExactMatch );
int  OGR_L_FindFieldIndex(OGRLayerH , char *, int bExactMatch);
//C     GIntBig CPL_DLL OGR_L_GetFeatureCount( OGRLayerH, int );
GIntBig  OGR_L_GetFeatureCount(OGRLayerH , int );
//C     OGRErr CPL_DLL OGR_L_GetExtent( OGRLayerH, OGREnvelope *, int );
OGRErr  OGR_L_GetExtent(OGRLayerH , OGREnvelope *, int );
//C     OGRErr  CPL_DLL OGR_L_GetExtentEx( OGRLayerH, int iGeomField,
//C                                        OGREnvelope *psExtent, int bForce );
OGRErr  OGR_L_GetExtentEx(OGRLayerH , int iGeomField, OGREnvelope *psExtent, int bForce);
//C     int    CPL_DLL OGR_L_TestCapability( OGRLayerH, const char * );
int  OGR_L_TestCapability(OGRLayerH , char *);
//C     OGRErr CPL_DLL OGR_L_CreateField( OGRLayerH, OGRFieldDefnH, int );
OGRErr  OGR_L_CreateField(OGRLayerH , OGRFieldDefnH , int );
//C     OGRErr CPL_DLL OGR_L_CreateGeomField( OGRLayerH hLayer,
//C                                           OGRGeomFieldDefnH hFieldDefn, int bForce );
OGRErr  OGR_L_CreateGeomField(OGRLayerH hLayer, OGRGeomFieldDefnH hFieldDefn, int bForce);
//C     OGRErr CPL_DLL OGR_L_DeleteField( OGRLayerH, int iField );
OGRErr  OGR_L_DeleteField(OGRLayerH , int iField);
//C     OGRErr CPL_DLL OGR_L_ReorderFields( OGRLayerH, int* panMap );
OGRErr  OGR_L_ReorderFields(OGRLayerH , int *panMap);
//C     OGRErr CPL_DLL OGR_L_ReorderField( OGRLayerH, int iOldFieldPos, int iNewFieldPos );
OGRErr  OGR_L_ReorderField(OGRLayerH , int iOldFieldPos, int iNewFieldPos);
//C     OGRErr CPL_DLL OGR_L_AlterFieldDefn( OGRLayerH, int iField, OGRFieldDefnH hNewFieldDefn, int nFlags );
OGRErr  OGR_L_AlterFieldDefn(OGRLayerH , int iField, OGRFieldDefnH hNewFieldDefn, int nFlags);
//C     OGRErr CPL_DLL OGR_L_StartTransaction( OGRLayerH )  CPL_WARN_UNUSED_RESULT;
OGRErr  OGR_L_StartTransaction(OGRLayerH );
//C     OGRErr CPL_DLL OGR_L_CommitTransaction( OGRLayerH )  CPL_WARN_UNUSED_RESULT;
OGRErr  OGR_L_CommitTransaction(OGRLayerH );
//C     OGRErr CPL_DLL OGR_L_RollbackTransaction( OGRLayerH );
OGRErr  OGR_L_RollbackTransaction(OGRLayerH );
//C     int    CPL_DLL OGR_L_Reference( OGRLayerH );
int  OGR_L_Reference(OGRLayerH );
//C     int    CPL_DLL OGR_L_Dereference( OGRLayerH );
int  OGR_L_Dereference(OGRLayerH );
//C     int    CPL_DLL OGR_L_GetRefCount( OGRLayerH );
int  OGR_L_GetRefCount(OGRLayerH );
//C     OGRErr CPL_DLL OGR_L_SyncToDisk( OGRLayerH );
OGRErr  OGR_L_SyncToDisk(OGRLayerH );
//C     GIntBig CPL_DLL OGR_L_GetFeaturesRead( OGRLayerH );
GIntBig  OGR_L_GetFeaturesRead(OGRLayerH );
//C     const char CPL_DLL *OGR_L_GetFIDColumn( OGRLayerH );
char * OGR_L_GetFIDColumn(OGRLayerH );
//C     const char CPL_DLL *OGR_L_GetGeometryColumn( OGRLayerH );
char * OGR_L_GetGeometryColumn(OGRLayerH );
//C     OGRStyleTableH CPL_DLL OGR_L_GetStyleTable( OGRLayerH );
OGRStyleTableH  OGR_L_GetStyleTable(OGRLayerH );
//C     void   CPL_DLL OGR_L_SetStyleTableDirectly( OGRLayerH, OGRStyleTableH );
void  OGR_L_SetStyleTableDirectly(OGRLayerH , OGRStyleTableH );
//C     void   CPL_DLL OGR_L_SetStyleTable( OGRLayerH, OGRStyleTableH );
void  OGR_L_SetStyleTable(OGRLayerH , OGRStyleTableH );
//C     OGRErr CPL_DLL OGR_L_SetIgnoredFields( OGRLayerH, const char** );
OGRErr  OGR_L_SetIgnoredFields(OGRLayerH , char **);
//C     OGRErr CPL_DLL OGR_L_Intersection( OGRLayerH, OGRLayerH, OGRLayerH, char**, GDALProgressFunc, void * );
OGRErr  OGR_L_Intersection(OGRLayerH , OGRLayerH , OGRLayerH , char **, GDALProgressFunc , void *);
//C     OGRErr CPL_DLL OGR_L_Union( OGRLayerH, OGRLayerH, OGRLayerH, char**, GDALProgressFunc, void * );
OGRErr  OGR_L_Union(OGRLayerH , OGRLayerH , OGRLayerH , char **, GDALProgressFunc , void *);
//C     OGRErr CPL_DLL OGR_L_SymDifference( OGRLayerH, OGRLayerH, OGRLayerH, char**, GDALProgressFunc, void * );
OGRErr  OGR_L_SymDifference(OGRLayerH , OGRLayerH , OGRLayerH , char **, GDALProgressFunc , void *);
//C     OGRErr CPL_DLL OGR_L_Identity( OGRLayerH, OGRLayerH, OGRLayerH, char**, GDALProgressFunc, void * );
OGRErr  OGR_L_Identity(OGRLayerH , OGRLayerH , OGRLayerH , char **, GDALProgressFunc , void *);
//C     OGRErr CPL_DLL OGR_L_Update( OGRLayerH, OGRLayerH, OGRLayerH, char**, GDALProgressFunc, void * );
OGRErr  OGR_L_Update(OGRLayerH , OGRLayerH , OGRLayerH , char **, GDALProgressFunc , void *);
//C     OGRErr CPL_DLL OGR_L_Clip( OGRLayerH, OGRLayerH, OGRLayerH, char**, GDALProgressFunc, void * );
OGRErr  OGR_L_Clip(OGRLayerH , OGRLayerH , OGRLayerH , char **, GDALProgressFunc , void *);
//C     OGRErr CPL_DLL OGR_L_Erase( OGRLayerH, OGRLayerH, OGRLayerH, char**, GDALProgressFunc, void * );
OGRErr  OGR_L_Erase(OGRLayerH , OGRLayerH , OGRLayerH , char **, GDALProgressFunc , void *);

/* OGRDataSource */

//C     void   CPL_DLL OGR_DS_Destroy( OGRDataSourceH );
void  OGR_DS_Destroy(OGRDataSourceH );
//C     const char CPL_DLL *OGR_DS_GetName( OGRDataSourceH );
char * OGR_DS_GetName(OGRDataSourceH );
//C     int    CPL_DLL OGR_DS_GetLayerCount( OGRDataSourceH );
int  OGR_DS_GetLayerCount(OGRDataSourceH );
//C     OGRLayerH CPL_DLL OGR_DS_GetLayer( OGRDataSourceH, int );
OGRLayerH  OGR_DS_GetLayer(OGRDataSourceH , int );
//C     OGRLayerH CPL_DLL OGR_DS_GetLayerByName( OGRDataSourceH, const char * );
OGRLayerH  OGR_DS_GetLayerByName(OGRDataSourceH , char *);
//C     OGRErr    CPL_DLL OGR_DS_DeleteLayer( OGRDataSourceH, int );
OGRErr  OGR_DS_DeleteLayer(OGRDataSourceH , int );
//C     OGRSFDriverH CPL_DLL OGR_DS_GetDriver( OGRDataSourceH );
OGRSFDriverH  OGR_DS_GetDriver(OGRDataSourceH );
//C     OGRLayerH CPL_DLL OGR_DS_CreateLayer( OGRDataSourceH, const char *,
//C                                           OGRSpatialReferenceH, OGRwkbGeometryType,
//C                                           char ** );
OGRLayerH  OGR_DS_CreateLayer(OGRDataSourceH , char *, OGRSpatialReferenceH , OGRwkbGeometryType , char **);
//C     OGRLayerH CPL_DLL OGR_DS_CopyLayer( OGRDataSourceH, OGRLayerH, const char *,
//C                                         char ** );
OGRLayerH  OGR_DS_CopyLayer(OGRDataSourceH , OGRLayerH , char *, char **);
//C     int    CPL_DLL OGR_DS_TestCapability( OGRDataSourceH, const char * );
int  OGR_DS_TestCapability(OGRDataSourceH , char *);
//C     OGRLayerH CPL_DLL OGR_DS_ExecuteSQL( OGRDataSourceH, const char *,
//C                                          OGRGeometryH, const char * );
OGRLayerH  OGR_DS_ExecuteSQL(OGRDataSourceH , char *, OGRGeometryH , char *);
//C     void   CPL_DLL OGR_DS_ReleaseResultSet( OGRDataSourceH, OGRLayerH );
void  OGR_DS_ReleaseResultSet(OGRDataSourceH , OGRLayerH );
//C     int    CPL_DLL OGR_DS_Reference( OGRDataSourceH );
int  OGR_DS_Reference(OGRDataSourceH );
//C     int    CPL_DLL OGR_DS_Dereference( OGRDataSourceH );
int  OGR_DS_Dereference(OGRDataSourceH );
//C     int    CPL_DLL OGR_DS_GetRefCount( OGRDataSourceH );
int  OGR_DS_GetRefCount(OGRDataSourceH );
//C     int    CPL_DLL OGR_DS_GetSummaryRefCount( OGRDataSourceH );
int  OGR_DS_GetSummaryRefCount(OGRDataSourceH );
//C     OGRErr CPL_DLL OGR_DS_SyncToDisk( OGRDataSourceH );
OGRErr  OGR_DS_SyncToDisk(OGRDataSourceH );
//C     OGRStyleTableH CPL_DLL OGR_DS_GetStyleTable( OGRDataSourceH );
OGRStyleTableH  OGR_DS_GetStyleTable(OGRDataSourceH );
//C     void   CPL_DLL OGR_DS_SetStyleTableDirectly( OGRDataSourceH, OGRStyleTableH );
void  OGR_DS_SetStyleTableDirectly(OGRDataSourceH , OGRStyleTableH );
//C     void   CPL_DLL OGR_DS_SetStyleTable( OGRDataSourceH, OGRStyleTableH );
void  OGR_DS_SetStyleTable(OGRDataSourceH , OGRStyleTableH );

/* OGRSFDriver */

//C     const char CPL_DLL *OGR_Dr_GetName( OGRSFDriverH );
char * OGR_Dr_GetName(OGRSFDriverH );
//C     OGRDataSourceH CPL_DLL OGR_Dr_Open( OGRSFDriverH, const char *, int ) CPL_WARN_UNUSED_RESULT;
OGRDataSourceH  OGR_Dr_Open(OGRSFDriverH , char *, int );
//C     int CPL_DLL OGR_Dr_TestCapability( OGRSFDriverH, const char * );
int  OGR_Dr_TestCapability(OGRSFDriverH , char *);
//C     OGRDataSourceH CPL_DLL OGR_Dr_CreateDataSource( OGRSFDriverH, const char *,
//C                                                     char ** ) CPL_WARN_UNUSED_RESULT;
OGRDataSourceH  OGR_Dr_CreateDataSource(OGRSFDriverH , char *, char **);
//C     OGRDataSourceH CPL_DLL OGR_Dr_CopyDataSource( OGRSFDriverH,  OGRDataSourceH,
//C                                                   const char *, char ** ) CPL_WARN_UNUSED_RESULT;
OGRDataSourceH  OGR_Dr_CopyDataSource(OGRSFDriverH , OGRDataSourceH , char *, char **);
//C     OGRErr CPL_DLL OGR_Dr_DeleteDataSource( OGRSFDriverH, const char * );
OGRErr  OGR_Dr_DeleteDataSource(OGRSFDriverH , char *);

/* OGRSFDriverRegistrar */

//C     OGRDataSourceH CPL_DLL OGROpen( const char *, int, OGRSFDriverH * ) CPL_WARN_UNUSED_RESULT;
OGRDataSourceH  OGROpen(char *, int , OGRSFDriverH *);
//C     OGRDataSourceH CPL_DLL OGROpenShared( const char *, int, OGRSFDriverH * ) CPL_WARN_UNUSED_RESULT;
OGRDataSourceH  OGROpenShared(char *, int , OGRSFDriverH *);
//C     OGRErr  CPL_DLL OGRReleaseDataSource( OGRDataSourceH );
OGRErr  OGRReleaseDataSource(OGRDataSourceH );
//C     void    CPL_DLL OGRRegisterDriver( OGRSFDriverH );
void  OGRRegisterDriver(OGRSFDriverH );
//C     void    CPL_DLL OGRDeregisterDriver( OGRSFDriverH );
void  OGRDeregisterDriver(OGRSFDriverH );
//C     int     CPL_DLL OGRGetDriverCount(void);
int  OGRGetDriverCount();
//C     OGRSFDriverH CPL_DLL OGRGetDriver( int );
OGRSFDriverH  OGRGetDriver(int );
//C     OGRSFDriverH CPL_DLL OGRGetDriverByName( const char * );
OGRSFDriverH  OGRGetDriverByName(char *);
//C     int     CPL_DLL OGRGetOpenDSCount(void);
int  OGRGetOpenDSCount();
//C     OGRDataSourceH CPL_DLL OGRGetOpenDS( int iDS );
OGRDataSourceH  OGRGetOpenDS(int iDS);


/* note: this is also declared in ogrsf_frmts.h */
//C     void CPL_DLL OGRRegisterAll(void);
void  OGRRegisterAll();
//C     void CPL_DLL OGRCleanupAll(void);
void  OGRCleanupAll();

/* -------------------------------------------------------------------- */
/*      ogrsf_featurestyle.h                                            */
/* -------------------------------------------------------------------- */

//C     #ifdef DEBUG
//C     typedef struct OGRStyleMgrHS *OGRStyleMgrH;
//C     typedef struct OGRStyleToolHS *OGRStyleToolH;
//C     #else
//C     typedef void *OGRStyleMgrH;
alias void *OGRStyleMgrH;
//C     typedef void *OGRStyleToolH;
alias void *OGRStyleToolH;
//C     #endif

/* OGRStyleMgr */

//C     OGRStyleMgrH CPL_DLL OGR_SM_Create(OGRStyleTableH hStyleTable) CPL_WARN_UNUSED_RESULT;
OGRStyleMgrH  OGR_SM_Create(OGRStyleTableH hStyleTable);
//C     void    CPL_DLL OGR_SM_Destroy(OGRStyleMgrH hSM);
void  OGR_SM_Destroy(OGRStyleMgrH hSM);

//C     const char CPL_DLL *OGR_SM_InitFromFeature(OGRStyleMgrH hSM,
//C                                                OGRFeatureH hFeat);
char * OGR_SM_InitFromFeature(OGRStyleMgrH hSM, OGRFeatureH hFeat);
//C     int     CPL_DLL OGR_SM_InitStyleString(OGRStyleMgrH hSM,
//C                                            const char *pszStyleString);
int  OGR_SM_InitStyleString(OGRStyleMgrH hSM, char *pszStyleString);
//C     int     CPL_DLL OGR_SM_GetPartCount(OGRStyleMgrH hSM,
//C                                         const char *pszStyleString);
int  OGR_SM_GetPartCount(OGRStyleMgrH hSM, char *pszStyleString);
//C     OGRStyleToolH CPL_DLL OGR_SM_GetPart(OGRStyleMgrH hSM, int nPartId,
//C                                          const char *pszStyleString);
OGRStyleToolH  OGR_SM_GetPart(OGRStyleMgrH hSM, int nPartId, char *pszStyleString);
//C     int     CPL_DLL OGR_SM_AddPart(OGRStyleMgrH hSM, OGRStyleToolH hST);
int  OGR_SM_AddPart(OGRStyleMgrH hSM, OGRStyleToolH hST);
//C     int     CPL_DLL OGR_SM_AddStyle(OGRStyleMgrH hSM, const char *pszStyleName,
//C                                    const char *pszStyleString);
int  OGR_SM_AddStyle(OGRStyleMgrH hSM, char *pszStyleName, char *pszStyleString);

/* OGRStyleTool */

//C     OGRStyleToolH CPL_DLL OGR_ST_Create(OGRSTClassId eClassId) CPL_WARN_UNUSED_RESULT;
OGRStyleToolH  OGR_ST_Create(OGRSTClassId eClassId);
//C     void    CPL_DLL OGR_ST_Destroy(OGRStyleToolH hST);
void  OGR_ST_Destroy(OGRStyleToolH hST);

//C     OGRSTClassId CPL_DLL OGR_ST_GetType(OGRStyleToolH hST);
OGRSTClassId  OGR_ST_GetType(OGRStyleToolH hST);

//C     OGRSTUnitId CPL_DLL OGR_ST_GetUnit(OGRStyleToolH hST);
OGRSTUnitId  OGR_ST_GetUnit(OGRStyleToolH hST);
//C     void    CPL_DLL OGR_ST_SetUnit(OGRStyleToolH hST, OGRSTUnitId eUnit,
//C                                    double dfGroundPaperScale);
void  OGR_ST_SetUnit(OGRStyleToolH hST, OGRSTUnitId eUnit, double dfGroundPaperScale);

//C     const char CPL_DLL *OGR_ST_GetParamStr(OGRStyleToolH hST, int eParam, int *bValueIsNull);
char * OGR_ST_GetParamStr(OGRStyleToolH hST, int eParam, int *bValueIsNull);
//C     int     CPL_DLL OGR_ST_GetParamNum(OGRStyleToolH hST, int eParam, int *bValueIsNull);
int  OGR_ST_GetParamNum(OGRStyleToolH hST, int eParam, int *bValueIsNull);
//C     double  CPL_DLL OGR_ST_GetParamDbl(OGRStyleToolH hST, int eParam, int *bValueIsNull);
double  OGR_ST_GetParamDbl(OGRStyleToolH hST, int eParam, int *bValueIsNull);
//C     void    CPL_DLL OGR_ST_SetParamStr(OGRStyleToolH hST, int eParam, const char *pszValue);
void  OGR_ST_SetParamStr(OGRStyleToolH hST, int eParam, char *pszValue);
//C     void    CPL_DLL OGR_ST_SetParamNum(OGRStyleToolH hST, int eParam, int nValue);
void  OGR_ST_SetParamNum(OGRStyleToolH hST, int eParam, int nValue);
//C     void    CPL_DLL OGR_ST_SetParamDbl(OGRStyleToolH hST, int eParam, double dfValue);
void  OGR_ST_SetParamDbl(OGRStyleToolH hST, int eParam, double dfValue);
//C     const char CPL_DLL *OGR_ST_GetStyleString(OGRStyleToolH hST);
char * OGR_ST_GetStyleString(OGRStyleToolH hST);

//C     int CPL_DLL OGR_ST_GetRGBFromString(OGRStyleToolH hST, const char *pszColor,
//C                                         int *pnRed, int *pnGreen, int *pnBlue,
//C                                         int *pnAlpha);
int  OGR_ST_GetRGBFromString(OGRStyleToolH hST, char *pszColor, int *pnRed, int *pnGreen, int *pnBlue, int *pnAlpha);

/* OGRStyleTable */

//C     OGRStyleTableH  CPL_DLL OGR_STBL_Create( void ) CPL_WARN_UNUSED_RESULT;
OGRStyleTableH  OGR_STBL_Create();
//C     void    CPL_DLL OGR_STBL_Destroy( OGRStyleTableH hSTBL );
void  OGR_STBL_Destroy(OGRStyleTableH hSTBL);
//C     int     CPL_DLL OGR_STBL_AddStyle( OGRStyleTableH hStyleTable,
//C                                        const char *pszName,
//C                                        const char *pszStyleString);
int  OGR_STBL_AddStyle(OGRStyleTableH hStyleTable, char *pszName, char *pszStyleString);
//C     int     CPL_DLL OGR_STBL_SaveStyleTable( OGRStyleTableH hStyleTable,
//C                                              const char *pszFilename );
int  OGR_STBL_SaveStyleTable(OGRStyleTableH hStyleTable, char *pszFilename);
//C     int     CPL_DLL OGR_STBL_LoadStyleTable( OGRStyleTableH hStyleTable,
//C                                              const char *pszFilename );
int  OGR_STBL_LoadStyleTable(OGRStyleTableH hStyleTable, char *pszFilename);
//C     const char CPL_DLL *OGR_STBL_Find( OGRStyleTableH hStyleTable, const char *pszName );
char * OGR_STBL_Find(OGRStyleTableH hStyleTable, char *pszName);
//C     void    CPL_DLL OGR_STBL_ResetStyleStringReading( OGRStyleTableH hStyleTable );
void  OGR_STBL_ResetStyleStringReading(OGRStyleTableH hStyleTable);
//C     const char CPL_DLL *OGR_STBL_GetNextStyle( OGRStyleTableH hStyleTable);
char * OGR_STBL_GetNextStyle(OGRStyleTableH hStyleTable);
//C     const char CPL_DLL *OGR_STBL_GetLastStyleName( OGRStyleTableH hStyleTable);
char * OGR_STBL_GetLastStyleName(OGRStyleTableH hStyleTable);

//C     CPL_C_END

//C     #endif /* ndef OGR_API_H_INCLUDED */
