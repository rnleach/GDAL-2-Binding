/* Converted to D from C:/devLibs/gdal21/include/ogr_api.h by htod */
module gdal.ogr.api;
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

/**
 * \file ogr_api.h
 *
 * C API and defines for OGRFeature, OGRGeometry, and OGRDataSource
 * related classes.
 *
 * See also: ogr_geometry.h, ogr_feature.h, ogrsf_frmts.h, ogr_featurestyle.h
 */
import gdal.cpl.progress;
import gdal.cpl.minixml;
import gdal.ogr.core;
import core.stdc.stdio : FILE;

import gdal.cpl.port;

/* -------------------------------------------------------------------- */
/*      Geometry related functions (ogr_geometry.h)                     */
/* -------------------------------------------------------------------- */
extern (C):
alias void *OGRGeometryH;
alias void *OGRSpatialReferenceH;
alias void *OGRCoordinateTransformationH;

/* From base OGRGeometry class */
OGRErr  OGR_G_CreateFromWkb(ubyte *, OGRSpatialReferenceH , OGRGeometryH *, int );
OGRErr  OGR_G_CreateFromWkt(char **, OGRSpatialReferenceH , OGRGeometryH *);
OGRErr  OGR_G_CreateFromFgf(ubyte *, OGRSpatialReferenceH , OGRGeometryH *, int , int *);
void  OGR_G_DestroyGeometry(OGRGeometryH );
OGRGeometryH  OGR_G_CreateGeometry(OGRwkbGeometryType );
OGRGeometryH  OGR_G_ApproximateArcAngles(double dfCenterX, double dfCenterY, double dfZ, double dfPrimaryRadius, double dfSecondaryAxis, double dfRotation, double dfStartAngle, double dfEndAngle, double dfMaxAngleStepSizeDegrees);

OGRGeometryH  OGR_G_ForceToPolygon(OGRGeometryH );
OGRGeometryH  OGR_G_ForceToLineString(OGRGeometryH );
OGRGeometryH  OGR_G_ForceToMultiPolygon(OGRGeometryH );
OGRGeometryH  OGR_G_ForceToMultiPoint(OGRGeometryH );
OGRGeometryH  OGR_G_ForceToMultiLineString(OGRGeometryH );
OGRGeometryH  OGR_G_ForceTo(OGRGeometryH hGeom, OGRwkbGeometryType eTargetType, char **papszOptions);

int  OGR_G_GetDimension(OGRGeometryH );
int  OGR_G_GetCoordinateDimension(OGRGeometryH );
int  OGR_G_CoordinateDimension(OGRGeometryH );
void  OGR_G_SetCoordinateDimension(OGRGeometryH , int );
int  OGR_G_Is3D(OGRGeometryH );
int  OGR_G_IsMeasured(OGRGeometryH );
void  OGR_G_Set3D(OGRGeometryH , int );
void  OGR_G_SetMeasured(OGRGeometryH , int );
OGRGeometryH  OGR_G_Clone(OGRGeometryH );
void  OGR_G_GetEnvelope(OGRGeometryH , OGREnvelope *);
void  OGR_G_GetEnvelope3D(OGRGeometryH , OGREnvelope3D *);
OGRErr  OGR_G_ImportFromWkb(OGRGeometryH , ubyte *, int );
OGRErr  OGR_G_ExportToWkb(OGRGeometryH , OGRwkbByteOrder , ubyte *);
OGRErr  OGR_G_ExportToIsoWkb(OGRGeometryH , OGRwkbByteOrder , ubyte *);
int  OGR_G_WkbSize(OGRGeometryH hGeom);
OGRErr  OGR_G_ImportFromWkt(OGRGeometryH , char **);
OGRErr  OGR_G_ExportToWkt(OGRGeometryH , char **);
OGRErr  OGR_G_ExportToIsoWkt(OGRGeometryH , char **);
OGRwkbGeometryType  OGR_G_GetGeometryType(OGRGeometryH );
char * OGR_G_GetGeometryName(OGRGeometryH );
void  OGR_G_DumpReadable(OGRGeometryH , FILE *, char *);
void  OGR_G_FlattenTo2D(OGRGeometryH );
void  OGR_G_CloseRings(OGRGeometryH );

OGRGeometryH  OGR_G_CreateFromGML(char *);
char * OGR_G_ExportToGML(OGRGeometryH );
char * OGR_G_ExportToGMLEx(OGRGeometryH , char **papszOptions);

OGRGeometryH  OGR_G_CreateFromGMLTree(CPLXMLNode *);
CPLXMLNode * OGR_G_ExportToGMLTree(OGRGeometryH );
CPLXMLNode * OGR_G_ExportEnvelopeToGMLTree(OGRGeometryH );

char * OGR_G_ExportToKML(OGRGeometryH , char *pszAltitudeMode);

char * OGR_G_ExportToJson(OGRGeometryH );
char * OGR_G_ExportToJsonEx(OGRGeometryH , char **papszOptions);
OGRGeometryH  OGR_G_CreateGeometryFromJson(char *);

void  OGR_G_AssignSpatialReference(OGRGeometryH , OGRSpatialReferenceH );
OGRSpatialReferenceH  OGR_G_GetSpatialReference(OGRGeometryH );
OGRErr  OGR_G_Transform(OGRGeometryH , OGRCoordinateTransformationH );
OGRErr  OGR_G_TransformTo(OGRGeometryH , OGRSpatialReferenceH );

OGRGeometryH  OGR_G_Simplify(OGRGeometryH hThis, double tolerance);
OGRGeometryH  OGR_G_SimplifyPreserveTopology(OGRGeometryH hThis, double tolerance);
OGRGeometryH  OGR_G_DelaunayTriangulation(OGRGeometryH hThis, double dfTolerance, int bOnlyEdges);

void  OGR_G_Segmentize(OGRGeometryH hGeom, double dfMaxLength);
int  OGR_G_Intersects(OGRGeometryH , OGRGeometryH );
int  OGR_G_Equals(OGRGeometryH , OGRGeometryH );
int  OGR_G_Disjoint(OGRGeometryH , OGRGeometryH );
int  OGR_G_Touches(OGRGeometryH , OGRGeometryH );
int  OGR_G_Crosses(OGRGeometryH , OGRGeometryH );
int  OGR_G_Within(OGRGeometryH , OGRGeometryH );
int  OGR_G_Contains(OGRGeometryH , OGRGeometryH );
int  OGR_G_Overlaps(OGRGeometryH , OGRGeometryH );

OGRGeometryH  OGR_G_Boundary(OGRGeometryH );
OGRGeometryH  OGR_G_ConvexHull(OGRGeometryH );
OGRGeometryH  OGR_G_Buffer(OGRGeometryH , double , int );
OGRGeometryH  OGR_G_Intersection(OGRGeometryH , OGRGeometryH );
OGRGeometryH  OGR_G_Union(OGRGeometryH , OGRGeometryH );
OGRGeometryH  OGR_G_UnionCascaded(OGRGeometryH );
OGRGeometryH  OGR_G_PointOnSurface(OGRGeometryH );

OGRGeometryH  OGR_G_Difference(OGRGeometryH , OGRGeometryH );
OGRGeometryH  OGR_G_SymDifference(OGRGeometryH , OGRGeometryH );
double  OGR_G_Distance(OGRGeometryH , OGRGeometryH );
double  OGR_G_Length(OGRGeometryH );
double  OGR_G_Area(OGRGeometryH );
int  OGR_G_Centroid(OGRGeometryH , OGRGeometryH );
OGRGeometryH  OGR_G_Value(OGRGeometryH , double dfDistance);

void  OGR_G_Empty(OGRGeometryH );
int  OGR_G_IsEmpty(OGRGeometryH );
int  OGR_G_IsValid(OGRGeometryH );
/*char    CPL_DLL *OGR_G_IsValidReason( OGRGeometryH );*/
int  OGR_G_IsSimple(OGRGeometryH );
int  OGR_G_IsRing(OGRGeometryH );

OGRGeometryH  OGR_G_Polygonize(OGRGeometryH );

/* backward compatibility (non-standard methods) */
int  OGR_G_Intersect(OGRGeometryH , OGRGeometryH );
int  OGR_G_Equal(OGRGeometryH , OGRGeometryH );
OGRGeometryH  OGR_G_SymmetricDifference(OGRGeometryH , OGRGeometryH );
double  OGR_G_GetArea(OGRGeometryH );
OGRGeometryH  OGR_G_GetBoundary(OGRGeometryH );

/* Methods for getting/setting vertices in points, line strings and rings */
int  OGR_G_GetPointCount(OGRGeometryH );
int  OGR_G_GetPoints(OGRGeometryH hGeom, void *pabyX, int nXStride, void *pabyY, int nYStride, void *pabyZ, int nZStride);
int  OGR_G_GetPointsZM(OGRGeometryH hGeom, void *pabyX, int nXStride, void *pabyY, int nYStride, void *pabyZ, int nZStride, void *pabyM, int nMStride);
double  OGR_G_GetX(OGRGeometryH , int );
double  OGR_G_GetY(OGRGeometryH , int );
double  OGR_G_GetZ(OGRGeometryH , int );
double  OGR_G_GetM(OGRGeometryH , int );
void  OGR_G_GetPoint(OGRGeometryH , int iPoint, double *, double *, double *);
void  OGR_G_GetPointZM(OGRGeometryH , int iPoint, double *, double *, double *, double *);
void  OGR_G_SetPointCount(OGRGeometryH hGeom, int nNewPointCount);
void  OGR_G_SetPoint(OGRGeometryH , int iPoint, double , double , double );
void  OGR_G_SetPoint_2D(OGRGeometryH , int iPoint, double , double );
void  OGR_G_SetPointM(OGRGeometryH , int iPoint, double , double , double );
void  OGR_G_SetPointZM(OGRGeometryH , int iPoint, double , double , double , double );
void  OGR_G_AddPoint(OGRGeometryH , double , double , double );
void  OGR_G_AddPoint_2D(OGRGeometryH , double , double );
void  OGR_G_AddPointM(OGRGeometryH , double , double , double );
void  OGR_G_AddPointZM(OGRGeometryH , double , double , double , double );
void  OGR_G_SetPoints(OGRGeometryH hGeom, int nPointsIn, void *pabyX, int nXStride, void *pabyY, int nYStride, void *pabyZ, int nZStride);
void  OGR_G_SetPointsZM(OGRGeometryH hGeom, int nPointsIn, void *pabyX, int nXStride, void *pabyY, int nYStride, void *pabyZ, int nZStride, void *pabyM, int nMStride);

/* Methods for getting/setting rings and members collections */

int  OGR_G_GetGeometryCount(OGRGeometryH );
OGRGeometryH  OGR_G_GetGeometryRef(OGRGeometryH , int );
OGRErr  OGR_G_AddGeometry(OGRGeometryH , OGRGeometryH );
OGRErr  OGR_G_AddGeometryDirectly(OGRGeometryH , OGRGeometryH );
OGRErr  OGR_G_RemoveGeometry(OGRGeometryH , int , int );

int  OGR_G_HasCurveGeometry(OGRGeometryH , int bLookForNonLinear);
OGRGeometryH  OGR_G_GetLinearGeometry(OGRGeometryH hGeom, double dfMaxAngleStepSizeDegrees, char **papszOptions);
OGRGeometryH  OGR_G_GetCurveGeometry(OGRGeometryH hGeom, char **papszOptions);

OGRGeometryH  OGRBuildPolygonFromEdges(OGRGeometryH hLinesAsCollection, int bBestEffort, int bAutoClose, double dfTolerance, OGRErr *peErr);

OGRErr  OGRSetGenerate_DB2_V72_BYTE_ORDER(int bGenerate_DB2_V72_BYTE_ORDER);

int  OGRGetGenerate_DB2_V72_BYTE_ORDER();

void  OGRSetNonLinearGeometriesEnabledFlag(int bFlag);
int  OGRGetNonLinearGeometriesEnabledFlag();

/* -------------------------------------------------------------------- */
/*      Feature related (ogr_feature.h)                                 */
/* -------------------------------------------------------------------- */

alias void* OGRFieldDefnH;
alias void* OGRFeatureDefnH;
alias void* OGRFeatureH;
alias void* OGRStyleTableH;
//alias OGRGeomFieldDefnHS *OGRGeomFieldDefnH;
alias void* OGRGeomFieldDefnH;

/* OGRFieldDefn */

OGRFieldDefnH  OGR_Fld_Create(char *, OGRFieldType );
void  OGR_Fld_Destroy(OGRFieldDefnH );

void  OGR_Fld_SetName(OGRFieldDefnH , char *);
char * OGR_Fld_GetNameRef(OGRFieldDefnH );
OGRFieldType  OGR_Fld_GetType(OGRFieldDefnH );
void  OGR_Fld_SetType(OGRFieldDefnH , OGRFieldType );
OGRFieldSubType  OGR_Fld_GetSubType(OGRFieldDefnH );
void  OGR_Fld_SetSubType(OGRFieldDefnH , OGRFieldSubType );
OGRJustification  OGR_Fld_GetJustify(OGRFieldDefnH );
void  OGR_Fld_SetJustify(OGRFieldDefnH , OGRJustification );
int  OGR_Fld_GetWidth(OGRFieldDefnH );
void  OGR_Fld_SetWidth(OGRFieldDefnH , int );
int  OGR_Fld_GetPrecision(OGRFieldDefnH );
void  OGR_Fld_SetPrecision(OGRFieldDefnH , int );
void  OGR_Fld_Set(OGRFieldDefnH , char *, OGRFieldType , int , int , OGRJustification );
int  OGR_Fld_IsIgnored(OGRFieldDefnH hDefn);
void  OGR_Fld_SetIgnored(OGRFieldDefnH hDefn, int );
int  OGR_Fld_IsNullable(OGRFieldDefnH hDefn);
void  OGR_Fld_SetNullable(OGRFieldDefnH hDefn, int );
char * OGR_Fld_GetDefault(OGRFieldDefnH hDefn);
void  OGR_Fld_SetDefault(OGRFieldDefnH hDefn, char *);
int  OGR_Fld_IsDefaultDriverSpecific(OGRFieldDefnH hDefn);

char * OGR_GetFieldTypeName(OGRFieldType );
char * OGR_GetFieldSubTypeName(OGRFieldSubType );
int  OGR_AreTypeSubTypeCompatible(OGRFieldType eType, OGRFieldSubType eSubType);

/* OGRGeomFieldDefnH */

OGRGeomFieldDefnH  OGR_GFld_Create(char *, OGRwkbGeometryType );
void  OGR_GFld_Destroy(OGRGeomFieldDefnH );

void  OGR_GFld_SetName(OGRGeomFieldDefnH , char *);
char * OGR_GFld_GetNameRef(OGRGeomFieldDefnH );

OGRwkbGeometryType  OGR_GFld_GetType(OGRGeomFieldDefnH );
void  OGR_GFld_SetType(OGRGeomFieldDefnH , OGRwkbGeometryType );

OGRSpatialReferenceH  OGR_GFld_GetSpatialRef(OGRGeomFieldDefnH );
void  OGR_GFld_SetSpatialRef(OGRGeomFieldDefnH , OGRSpatialReferenceH hSRS);

int  OGR_GFld_IsNullable(OGRGeomFieldDefnH hDefn);
void  OGR_GFld_SetNullable(OGRGeomFieldDefnH hDefn, int );

int  OGR_GFld_IsIgnored(OGRGeomFieldDefnH hDefn);
void  OGR_GFld_SetIgnored(OGRGeomFieldDefnH hDefn, int );

/* OGRFeatureDefn */

OGRFeatureDefnH  OGR_FD_Create(char *);
void  OGR_FD_Destroy(OGRFeatureDefnH );
void  OGR_FD_Release(OGRFeatureDefnH );
char * OGR_FD_GetName(OGRFeatureDefnH );
int  OGR_FD_GetFieldCount(OGRFeatureDefnH );
OGRFieldDefnH  OGR_FD_GetFieldDefn(OGRFeatureDefnH , int );
int  OGR_FD_GetFieldIndex(OGRFeatureDefnH , char *);
void  OGR_FD_AddFieldDefn(OGRFeatureDefnH , OGRFieldDefnH );
OGRErr  OGR_FD_DeleteFieldDefn(OGRFeatureDefnH hDefn, int iField);
OGRErr  OGR_FD_ReorderFieldDefns(OGRFeatureDefnH hDefn, int *panMap);
OGRwkbGeometryType  OGR_FD_GetGeomType(OGRFeatureDefnH );
void  OGR_FD_SetGeomType(OGRFeatureDefnH , OGRwkbGeometryType );
int  OGR_FD_IsGeometryIgnored(OGRFeatureDefnH );
void  OGR_FD_SetGeometryIgnored(OGRFeatureDefnH , int );
int  OGR_FD_IsStyleIgnored(OGRFeatureDefnH );
void  OGR_FD_SetStyleIgnored(OGRFeatureDefnH , int );
int  OGR_FD_Reference(OGRFeatureDefnH );
int  OGR_FD_Dereference(OGRFeatureDefnH );
int  OGR_FD_GetReferenceCount(OGRFeatureDefnH );

int  OGR_FD_GetGeomFieldCount(OGRFeatureDefnH hFDefn);
OGRGeomFieldDefnH  OGR_FD_GetGeomFieldDefn(OGRFeatureDefnH hFDefn, int i);
int  OGR_FD_GetGeomFieldIndex(OGRFeatureDefnH hFDefn, char *pszName);

void  OGR_FD_AddGeomFieldDefn(OGRFeatureDefnH hFDefn, OGRGeomFieldDefnH hGFldDefn);
OGRErr  OGR_FD_DeleteGeomFieldDefn(OGRFeatureDefnH hFDefn, int iGeomField);
int  OGR_FD_IsSame(OGRFeatureDefnH hFDefn, OGRFeatureDefnH hOtherFDefn);
/* OGRFeature */

OGRFeatureH  OGR_F_Create(OGRFeatureDefnH );
void  OGR_F_Destroy(OGRFeatureH );
OGRFeatureDefnH  OGR_F_GetDefnRef(OGRFeatureH );

OGRErr  OGR_F_SetGeometryDirectly(OGRFeatureH , OGRGeometryH );
OGRErr  OGR_F_SetGeometry(OGRFeatureH , OGRGeometryH );
OGRGeometryH  OGR_F_GetGeometryRef(OGRFeatureH );
OGRGeometryH  OGR_F_StealGeometry(OGRFeatureH );
OGRFeatureH  OGR_F_Clone(OGRFeatureH );
int  OGR_F_Equal(OGRFeatureH , OGRFeatureH );

int  OGR_F_GetFieldCount(OGRFeatureH );
OGRFieldDefnH  OGR_F_GetFieldDefnRef(OGRFeatureH , int );
int  OGR_F_GetFieldIndex(OGRFeatureH , char *);

int  OGR_F_IsFieldSet(OGRFeatureH , int );
void  OGR_F_UnsetField(OGRFeatureH , int );
OGRField * OGR_F_GetRawFieldRef(OGRFeatureH , int );

int  OGR_F_GetFieldAsInteger(OGRFeatureH , int );
GIntBig  OGR_F_GetFieldAsInteger64(OGRFeatureH , int );
double  OGR_F_GetFieldAsDouble(OGRFeatureH , int );
char * OGR_F_GetFieldAsString(OGRFeatureH , int );
int * OGR_F_GetFieldAsIntegerList(OGRFeatureH , int , int *);
GIntBig * OGR_F_GetFieldAsInteger64List(OGRFeatureH , int , int *);
double * OGR_F_GetFieldAsDoubleList(OGRFeatureH , int , int *);
char ** OGR_F_GetFieldAsStringList(OGRFeatureH , int );
GByte * OGR_F_GetFieldAsBinary(OGRFeatureH , int , int *);
int  OGR_F_GetFieldAsDateTime(OGRFeatureH , int , int *, int *, int *, int *, int *, int *, int *);
int  OGR_F_GetFieldAsDateTimeEx(OGRFeatureH hFeat, int iField, int *pnYear, int *pnMonth, int *pnDay, int *pnHour, int *pnMinute, float *pfSecond, int *pnTZFlag);

void  OGR_F_SetFieldInteger(OGRFeatureH , int , int );
void  OGR_F_SetFieldInteger64(OGRFeatureH , int , GIntBig );
void  OGR_F_SetFieldDouble(OGRFeatureH , int , double );
void  OGR_F_SetFieldString(OGRFeatureH , int , char *);
void  OGR_F_SetFieldIntegerList(OGRFeatureH , int , int , int *);
void  OGR_F_SetFieldInteger64List(OGRFeatureH , int , int , GIntBig *);
void  OGR_F_SetFieldDoubleList(OGRFeatureH , int , int , double *);
void  OGR_F_SetFieldStringList(OGRFeatureH , int , char **);
void  OGR_F_SetFieldRaw(OGRFeatureH , int , OGRField *);
void  OGR_F_SetFieldBinary(OGRFeatureH , int , int , GByte *);
void  OGR_F_SetFieldDateTime(OGRFeatureH , int , int , int , int , int , int , int , int );
void  OGR_F_SetFieldDateTimeEx(OGRFeatureH , int , int , int , int , int , int , float , int );

int  OGR_F_GetGeomFieldCount(OGRFeatureH hFeat);
OGRGeomFieldDefnH  OGR_F_GetGeomFieldDefnRef(OGRFeatureH hFeat, int iField);
int  OGR_F_GetGeomFieldIndex(OGRFeatureH hFeat, char *pszName);

OGRGeometryH  OGR_F_GetGeomFieldRef(OGRFeatureH hFeat, int iField);
OGRErr  OGR_F_SetGeomFieldDirectly(OGRFeatureH hFeat, int iField, OGRGeometryH hGeom);
OGRErr  OGR_F_SetGeomField(OGRFeatureH hFeat, int iField, OGRGeometryH hGeom);

GIntBig  OGR_F_GetFID(OGRFeatureH );
OGRErr  OGR_F_SetFID(OGRFeatureH , GIntBig );
void  OGR_F_DumpReadable(OGRFeatureH , FILE *);
OGRErr  OGR_F_SetFrom(OGRFeatureH , OGRFeatureH , int );
OGRErr  OGR_F_SetFromWithMap(OGRFeatureH , OGRFeatureH , int , int *);

char * OGR_F_GetStyleString(OGRFeatureH );
void  OGR_F_SetStyleString(OGRFeatureH , char *);
void  OGR_F_SetStyleStringDirectly(OGRFeatureH , char *);
OGRStyleTableH  OGR_F_GetStyleTable(OGRFeatureH );
void  OGR_F_SetStyleTableDirectly(OGRFeatureH , OGRStyleTableH );
void  OGR_F_SetStyleTable(OGRFeatureH , OGRStyleTableH );

char * OGR_F_GetNativeData(OGRFeatureH );
void  OGR_F_SetNativeData(OGRFeatureH , char *);
char * OGR_F_GetNativeMediaType(OGRFeatureH );
void  OGR_F_SetNativeMediaType(OGRFeatureH , char *);

void  OGR_F_FillUnsetWithDefault(OGRFeatureH hFeat, int bNotNullableOnly, char **papszOptions);
int  OGR_F_Validate(OGRFeatureH , int nValidateFlags, int bEmitError);

/* -------------------------------------------------------------------- */
/*      ogrsf_frmts.h                                                   */
/* -------------------------------------------------------------------- */

alias void *OGRLayerH;
alias void *OGRDataSourceH;
alias void *OGRSFDriverH;

/* OGRLayer */

char * OGR_L_GetName(OGRLayerH );
OGRwkbGeometryType  OGR_L_GetGeomType(OGRLayerH );
OGRGeometryH  OGR_L_GetSpatialFilter(OGRLayerH );
void  OGR_L_SetSpatialFilter(OGRLayerH , OGRGeometryH );
void  OGR_L_SetSpatialFilterRect(OGRLayerH , double , double , double , double );
void  OGR_L_SetSpatialFilterEx(OGRLayerH , int iGeomField, OGRGeometryH hGeom);
void  OGR_L_SetSpatialFilterRectEx(OGRLayerH , int iGeomField, double dfMinX, double dfMinY, double dfMaxX, double dfMaxY);
OGRErr  OGR_L_SetAttributeFilter(OGRLayerH , char *);
void  OGR_L_ResetReading(OGRLayerH );
OGRFeatureH  OGR_L_GetNextFeature(OGRLayerH );
OGRErr  OGR_L_SetNextByIndex(OGRLayerH , GIntBig );
OGRFeatureH  OGR_L_GetFeature(OGRLayerH , GIntBig );
OGRErr  OGR_L_SetFeature(OGRLayerH , OGRFeatureH );
OGRErr  OGR_L_CreateFeature(OGRLayerH , OGRFeatureH );
OGRErr  OGR_L_DeleteFeature(OGRLayerH , GIntBig );
OGRFeatureDefnH  OGR_L_GetLayerDefn(OGRLayerH );
OGRSpatialReferenceH  OGR_L_GetSpatialRef(OGRLayerH );
int  OGR_L_FindFieldIndex(OGRLayerH , char *, int bExactMatch);
GIntBig  OGR_L_GetFeatureCount(OGRLayerH , int );
OGRErr  OGR_L_GetExtent(OGRLayerH , OGREnvelope *, int );
OGRErr  OGR_L_GetExtentEx(OGRLayerH , int iGeomField, OGREnvelope *psExtent, int bForce);
int  OGR_L_TestCapability(OGRLayerH , char *);
OGRErr  OGR_L_CreateField(OGRLayerH , OGRFieldDefnH , int );
OGRErr  OGR_L_CreateGeomField(OGRLayerH hLayer, OGRGeomFieldDefnH hFieldDefn, int bForce);
OGRErr  OGR_L_DeleteField(OGRLayerH , int iField);
OGRErr  OGR_L_ReorderFields(OGRLayerH , int *panMap);
OGRErr  OGR_L_ReorderField(OGRLayerH , int iOldFieldPos, int iNewFieldPos);
OGRErr  OGR_L_AlterFieldDefn(OGRLayerH , int iField, OGRFieldDefnH hNewFieldDefn, int nFlags);
OGRErr  OGR_L_StartTransaction(OGRLayerH );
OGRErr  OGR_L_CommitTransaction(OGRLayerH );
OGRErr  OGR_L_RollbackTransaction(OGRLayerH );
int  OGR_L_Reference(OGRLayerH );
int  OGR_L_Dereference(OGRLayerH );
int  OGR_L_GetRefCount(OGRLayerH );
OGRErr  OGR_L_SyncToDisk(OGRLayerH );
GIntBig  OGR_L_GetFeaturesRead(OGRLayerH );
char * OGR_L_GetFIDColumn(OGRLayerH );
char * OGR_L_GetGeometryColumn(OGRLayerH );
OGRStyleTableH  OGR_L_GetStyleTable(OGRLayerH );
void  OGR_L_SetStyleTableDirectly(OGRLayerH , OGRStyleTableH );
void  OGR_L_SetStyleTable(OGRLayerH , OGRStyleTableH );
OGRErr  OGR_L_SetIgnoredFields(OGRLayerH , char **);
OGRErr  OGR_L_Intersection(OGRLayerH , OGRLayerH , OGRLayerH , char **, GDALProgressFunc , void *);
OGRErr  OGR_L_Union(OGRLayerH , OGRLayerH , OGRLayerH , char **, GDALProgressFunc , void *);
OGRErr  OGR_L_SymDifference(OGRLayerH , OGRLayerH , OGRLayerH , char **, GDALProgressFunc , void *);
OGRErr  OGR_L_Identity(OGRLayerH , OGRLayerH , OGRLayerH , char **, GDALProgressFunc , void *);
OGRErr  OGR_L_Update(OGRLayerH , OGRLayerH , OGRLayerH , char **, GDALProgressFunc , void *);
OGRErr  OGR_L_Clip(OGRLayerH , OGRLayerH , OGRLayerH , char **, GDALProgressFunc , void *);
OGRErr  OGR_L_Erase(OGRLayerH , OGRLayerH , OGRLayerH , char **, GDALProgressFunc , void *);

/* OGRDataSource */

void  OGR_DS_Destroy(OGRDataSourceH );
char * OGR_DS_GetName(OGRDataSourceH );
int  OGR_DS_GetLayerCount(OGRDataSourceH );
OGRLayerH  OGR_DS_GetLayer(OGRDataSourceH , int );
OGRLayerH  OGR_DS_GetLayerByName(OGRDataSourceH , char *);
OGRErr  OGR_DS_DeleteLayer(OGRDataSourceH , int );
OGRSFDriverH  OGR_DS_GetDriver(OGRDataSourceH );
OGRLayerH  OGR_DS_CreateLayer(OGRDataSourceH , char *, OGRSpatialReferenceH , OGRwkbGeometryType , char **);
OGRLayerH  OGR_DS_CopyLayer(OGRDataSourceH , OGRLayerH , char *, char **);
int  OGR_DS_TestCapability(OGRDataSourceH , char *);
OGRLayerH  OGR_DS_ExecuteSQL(OGRDataSourceH , char *, OGRGeometryH , char *);
void  OGR_DS_ReleaseResultSet(OGRDataSourceH , OGRLayerH );
int  OGR_DS_Reference(OGRDataSourceH );
int  OGR_DS_Dereference(OGRDataSourceH );
int  OGR_DS_GetRefCount(OGRDataSourceH );
int  OGR_DS_GetSummaryRefCount(OGRDataSourceH );
OGRErr  OGR_DS_SyncToDisk(OGRDataSourceH );
OGRStyleTableH  OGR_DS_GetStyleTable(OGRDataSourceH );
void  OGR_DS_SetStyleTableDirectly(OGRDataSourceH , OGRStyleTableH );
void  OGR_DS_SetStyleTable(OGRDataSourceH , OGRStyleTableH );

/* OGRSFDriver */

char * OGR_Dr_GetName(OGRSFDriverH );
OGRDataSourceH  OGR_Dr_Open(OGRSFDriverH , char *, int );
int  OGR_Dr_TestCapability(OGRSFDriverH , char *);
OGRDataSourceH  OGR_Dr_CreateDataSource(OGRSFDriverH , char *, char **);
OGRDataSourceH  OGR_Dr_CopyDataSource(OGRSFDriverH , OGRDataSourceH , char *, char **);
OGRErr  OGR_Dr_DeleteDataSource(OGRSFDriverH , char *);

/* OGRSFDriverRegistrar */

OGRDataSourceH  OGROpen(char *, int , OGRSFDriverH *);
OGRDataSourceH  OGROpenShared(char *, int , OGRSFDriverH *);
OGRErr  OGRReleaseDataSource(OGRDataSourceH );
void  OGRRegisterDriver(OGRSFDriverH );
void  OGRDeregisterDriver(OGRSFDriverH );
int  OGRGetDriverCount();
OGRSFDriverH  OGRGetDriver(int );
OGRSFDriverH  OGRGetDriverByName(char *);
int  OGRGetOpenDSCount();
OGRDataSourceH  OGRGetOpenDS(int iDS);


/* note: this is also declared in ogrsf_frmts.h */
void  OGRRegisterAll();
void  OGRCleanupAll();

/* -------------------------------------------------------------------- */
/*      ogrsf_featurestyle.h                                            */
/* -------------------------------------------------------------------- */

alias void *OGRStyleMgrH;
alias void *OGRStyleToolH;

/* OGRStyleMgr */

OGRStyleMgrH  OGR_SM_Create(OGRStyleTableH hStyleTable);
void  OGR_SM_Destroy(OGRStyleMgrH hSM);

char * OGR_SM_InitFromFeature(OGRStyleMgrH hSM, OGRFeatureH hFeat);
int  OGR_SM_InitStyleString(OGRStyleMgrH hSM, char *pszStyleString);
int  OGR_SM_GetPartCount(OGRStyleMgrH hSM, char *pszStyleString);
OGRStyleToolH  OGR_SM_GetPart(OGRStyleMgrH hSM, int nPartId, char *pszStyleString);
int  OGR_SM_AddPart(OGRStyleMgrH hSM, OGRStyleToolH hST);
int  OGR_SM_AddStyle(OGRStyleMgrH hSM, char *pszStyleName, char *pszStyleString);

/* OGRStyleTool */

OGRStyleToolH  OGR_ST_Create(OGRSTClassId eClassId);
void  OGR_ST_Destroy(OGRStyleToolH hST);

OGRSTClassId  OGR_ST_GetType(OGRStyleToolH hST);

OGRSTUnitId  OGR_ST_GetUnit(OGRStyleToolH hST);
void  OGR_ST_SetUnit(OGRStyleToolH hST, OGRSTUnitId eUnit, double dfGroundPaperScale);

char * OGR_ST_GetParamStr(OGRStyleToolH hST, int eParam, int *bValueIsNull);
int  OGR_ST_GetParamNum(OGRStyleToolH hST, int eParam, int *bValueIsNull);
double  OGR_ST_GetParamDbl(OGRStyleToolH hST, int eParam, int *bValueIsNull);
void  OGR_ST_SetParamStr(OGRStyleToolH hST, int eParam, char *pszValue);
void  OGR_ST_SetParamNum(OGRStyleToolH hST, int eParam, int nValue);
void  OGR_ST_SetParamDbl(OGRStyleToolH hST, int eParam, double dfValue);
char * OGR_ST_GetStyleString(OGRStyleToolH hST);

int  OGR_ST_GetRGBFromString(OGRStyleToolH hST, char *pszColor, int *pnRed, int *pnGreen, int *pnBlue, int *pnAlpha);

/* OGRStyleTable */

OGRStyleTableH  OGR_STBL_Create();
void  OGR_STBL_Destroy(OGRStyleTableH hSTBL);
int  OGR_STBL_AddStyle(OGRStyleTableH hStyleTable, char *pszName, char *pszStyleString);
int  OGR_STBL_SaveStyleTable(OGRStyleTableH hStyleTable, char *pszFilename);
int  OGR_STBL_LoadStyleTable(OGRStyleTableH hStyleTable, char *pszFilename);
char * OGR_STBL_Find(OGRStyleTableH hStyleTable, char *pszName);
void  OGR_STBL_ResetStyleStringReading(OGRStyleTableH hStyleTable);
char * OGR_STBL_GetNextStyle(OGRStyleTableH hStyleTable);
char * OGR_STBL_GetLastStyleName(OGRStyleTableH hStyleTable);


