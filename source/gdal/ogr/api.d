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
OGRErr  OGR_G_CreateFromWkb(ubyte *, OGRSpatialReferenceH , OGRGeometryH *, int ) nothrow @nogc;
OGRErr  OGR_G_CreateFromWkt(char **, OGRSpatialReferenceH , OGRGeometryH *) nothrow @nogc;
OGRErr  OGR_G_CreateFromFgf(ubyte *, OGRSpatialReferenceH , OGRGeometryH *, int , int *) nothrow @nogc;
void  OGR_G_DestroyGeometry(OGRGeometryH ) nothrow @nogc;
OGRGeometryH  OGR_G_CreateGeometry(OGRwkbGeometryType ) nothrow @nogc;
OGRGeometryH  OGR_G_ApproximateArcAngles(double dfCenterX, double dfCenterY, double dfZ, double dfPrimaryRadius, double dfSecondaryAxis, double dfRotation, double dfStartAngle, double dfEndAngle, double dfMaxAngleStepSizeDegrees) nothrow @nogc;

OGRGeometryH  OGR_G_ForceToPolygon(OGRGeometryH ) nothrow @nogc;
OGRGeometryH  OGR_G_ForceToLineString(OGRGeometryH ) nothrow @nogc;
OGRGeometryH  OGR_G_ForceToMultiPolygon(OGRGeometryH ) nothrow @nogc;
OGRGeometryH  OGR_G_ForceToMultiPoint(OGRGeometryH ) nothrow @nogc;
OGRGeometryH  OGR_G_ForceToMultiLineString(OGRGeometryH ) nothrow @nogc;
OGRGeometryH  OGR_G_ForceTo(OGRGeometryH hGeom, OGRwkbGeometryType eTargetType, char **papszOptions) nothrow @nogc;

int  OGR_G_GetDimension(OGRGeometryH ) nothrow @nogc;
int  OGR_G_GetCoordinateDimension(OGRGeometryH ) nothrow @nogc;
int  OGR_G_CoordinateDimension(OGRGeometryH ) nothrow @nogc;
void  OGR_G_SetCoordinateDimension(OGRGeometryH , int ) nothrow @nogc;
int  OGR_G_Is3D(OGRGeometryH ) nothrow @nogc;
int  OGR_G_IsMeasured(OGRGeometryH ) nothrow @nogc;
void  OGR_G_Set3D(OGRGeometryH , int ) nothrow @nogc;
void  OGR_G_SetMeasured(OGRGeometryH , int ) nothrow @nogc;
OGRGeometryH  OGR_G_Clone(OGRGeometryH ) nothrow @nogc;
void  OGR_G_GetEnvelope(OGRGeometryH , OGREnvelope *) nothrow @nogc;
void  OGR_G_GetEnvelope3D(OGRGeometryH , OGREnvelope3D *) nothrow @nogc;
OGRErr  OGR_G_ImportFromWkb(OGRGeometryH , ubyte *, int ) nothrow @nogc;
OGRErr  OGR_G_ExportToWkb(OGRGeometryH , OGRwkbByteOrder , ubyte *) nothrow @nogc;
OGRErr  OGR_G_ExportToIsoWkb(OGRGeometryH , OGRwkbByteOrder , ubyte *) nothrow @nogc;
int  OGR_G_WkbSize(OGRGeometryH hGeom) nothrow @nogc;
OGRErr  OGR_G_ImportFromWkt(OGRGeometryH , char **) nothrow @nogc;
OGRErr  OGR_G_ExportToWkt(OGRGeometryH , char **) nothrow @nogc;
OGRErr  OGR_G_ExportToIsoWkt(OGRGeometryH , char **) nothrow @nogc;
OGRwkbGeometryType  OGR_G_GetGeometryType(OGRGeometryH ) nothrow @nogc;
const(char) * OGR_G_GetGeometryName(OGRGeometryH ) nothrow @nogc;
void  OGR_G_DumpReadable(OGRGeometryH , FILE *, const(char) *) nothrow @nogc;
void  OGR_G_FlattenTo2D(OGRGeometryH ) nothrow @nogc;
void  OGR_G_CloseRings(OGRGeometryH ) nothrow @nogc;

OGRGeometryH  OGR_G_CreateFromGML(const(char) *) nothrow @nogc;
char * OGR_G_ExportToGML(OGRGeometryH ) nothrow @nogc;
char * OGR_G_ExportToGMLEx(OGRGeometryH , char **papszOptions) nothrow @nogc;

OGRGeometryH  OGR_G_CreateFromGMLTree(CPLXMLNode *) nothrow @nogc;
CPLXMLNode * OGR_G_ExportToGMLTree(OGRGeometryH ) nothrow @nogc;
CPLXMLNode * OGR_G_ExportEnvelopeToGMLTree(OGRGeometryH ) nothrow @nogc;

char * OGR_G_ExportToKML(OGRGeometryH , const(char) *pszAltitudeMode) nothrow @nogc;

char * OGR_G_ExportToJson(OGRGeometryH ) nothrow @nogc;
char * OGR_G_ExportToJsonEx(OGRGeometryH , char **papszOptions) nothrow @nogc;
OGRGeometryH  OGR_G_CreateGeometryFromJson(const(char) *) nothrow @nogc;

void  OGR_G_AssignSpatialReference(OGRGeometryH , OGRSpatialReferenceH ) nothrow @nogc;
OGRSpatialReferenceH  OGR_G_GetSpatialReference(OGRGeometryH ) nothrow @nogc;
OGRErr  OGR_G_Transform(OGRGeometryH , OGRCoordinateTransformationH ) nothrow @nogc;
OGRErr  OGR_G_TransformTo(OGRGeometryH , OGRSpatialReferenceH ) nothrow @nogc;

OGRGeometryH  OGR_G_Simplify(OGRGeometryH hThis, double tolerance) nothrow @nogc;
OGRGeometryH  OGR_G_SimplifyPreserveTopology(OGRGeometryH hThis, double tolerance) nothrow @nogc;
OGRGeometryH  OGR_G_DelaunayTriangulation(OGRGeometryH hThis, double dfTolerance, int bOnlyEdges) nothrow @nogc;

void  OGR_G_Segmentize(OGRGeometryH hGeom, double dfMaxLength) nothrow @nogc;
int  OGR_G_Intersects(OGRGeometryH , OGRGeometryH ) nothrow @nogc;
int  OGR_G_Equals(OGRGeometryH , OGRGeometryH ) nothrow @nogc;
int  OGR_G_Disjoint(OGRGeometryH , OGRGeometryH ) nothrow @nogc;
int  OGR_G_Touches(OGRGeometryH , OGRGeometryH ) nothrow @nogc;
int  OGR_G_Crosses(OGRGeometryH , OGRGeometryH ) nothrow @nogc;
int  OGR_G_Within(OGRGeometryH , OGRGeometryH ) nothrow @nogc;
int  OGR_G_Contains(OGRGeometryH , OGRGeometryH ) nothrow @nogc;
int  OGR_G_Overlaps(OGRGeometryH , OGRGeometryH ) nothrow @nogc;

OGRGeometryH  OGR_G_Boundary(OGRGeometryH ) nothrow @nogc;
OGRGeometryH  OGR_G_ConvexHull(OGRGeometryH ) nothrow @nogc;
OGRGeometryH  OGR_G_Buffer(OGRGeometryH , double , int ) nothrow @nogc;
OGRGeometryH  OGR_G_Intersection(OGRGeometryH , OGRGeometryH ) nothrow @nogc;
OGRGeometryH  OGR_G_Union(OGRGeometryH , OGRGeometryH ) nothrow @nogc;
OGRGeometryH  OGR_G_UnionCascaded(OGRGeometryH ) nothrow @nogc;
OGRGeometryH  OGR_G_PointOnSurface(OGRGeometryH ) nothrow @nogc;

OGRGeometryH  OGR_G_Difference(OGRGeometryH , OGRGeometryH ) nothrow @nogc;
OGRGeometryH  OGR_G_SymDifference(OGRGeometryH , OGRGeometryH ) nothrow @nogc;
double  OGR_G_Distance(OGRGeometryH , OGRGeometryH ) nothrow @nogc;
double  OGR_G_Length(OGRGeometryH ) nothrow @nogc;
double  OGR_G_Area(OGRGeometryH ) nothrow @nogc;
int  OGR_G_Centroid(OGRGeometryH , OGRGeometryH ) nothrow @nogc;
OGRGeometryH  OGR_G_Value(OGRGeometryH , double dfDistance) nothrow @nogc;

void  OGR_G_Empty(OGRGeometryH ) nothrow @nogc;
int  OGR_G_IsEmpty(OGRGeometryH ) nothrow @nogc;
int  OGR_G_IsValid(OGRGeometryH ) nothrow @nogc;
/*char    CPL_DLL *OGR_G_IsValidReason( OGRGeometryH );*/
int  OGR_G_IsSimple(OGRGeometryH ) nothrow @nogc;
int  OGR_G_IsRing(OGRGeometryH ) nothrow @nogc;

OGRGeometryH  OGR_G_Polygonize(OGRGeometryH ) nothrow @nogc;

/* backward compatibility (non-standard methods) */
int  OGR_G_Intersect(OGRGeometryH , OGRGeometryH ) nothrow @nogc;
int  OGR_G_Equal(OGRGeometryH , OGRGeometryH ) nothrow @nogc;
OGRGeometryH  OGR_G_SymmetricDifference(OGRGeometryH , OGRGeometryH ) nothrow @nogc;
double  OGR_G_GetArea(OGRGeometryH ) nothrow @nogc;
OGRGeometryH  OGR_G_GetBoundary(OGRGeometryH ) nothrow @nogc;

/* Methods for getting/setting vertices in points, line strings and rings */
int  OGR_G_GetPointCount(OGRGeometryH ) nothrow @nogc;
int  OGR_G_GetPoints(OGRGeometryH hGeom, void *pabyX, int nXStride, void *pabyY, int nYStride, void *pabyZ, int nZStride) nothrow @nogc;
int  OGR_G_GetPointsZM(OGRGeometryH hGeom, void *pabyX, int nXStride, void *pabyY, int nYStride, void *pabyZ, int nZStride, void *pabyM, int nMStride) nothrow @nogc;
double  OGR_G_GetX(OGRGeometryH , int ) nothrow @nogc;
double  OGR_G_GetY(OGRGeometryH , int ) nothrow @nogc;
double  OGR_G_GetZ(OGRGeometryH , int ) nothrow @nogc;
double  OGR_G_GetM(OGRGeometryH , int ) nothrow @nogc;
void  OGR_G_GetPoint(OGRGeometryH , int iPoint, double *, double *, double *) nothrow @nogc;
void  OGR_G_GetPointZM(OGRGeometryH , int iPoint, double *, double *, double *, double *) nothrow @nogc;
void  OGR_G_SetPointCount(OGRGeometryH hGeom, int nNewPointCount) nothrow @nogc;
void  OGR_G_SetPoint(OGRGeometryH , int iPoint, double , double , double ) nothrow @nogc;
void  OGR_G_SetPoint_2D(OGRGeometryH , int iPoint, double , double ) nothrow @nogc;
void  OGR_G_SetPointM(OGRGeometryH , int iPoint, double , double , double ) nothrow @nogc;
void  OGR_G_SetPointZM(OGRGeometryH , int iPoint, double , double , double , double ) nothrow @nogc;
void  OGR_G_AddPoint(OGRGeometryH , double , double , double ) nothrow @nogc;
void  OGR_G_AddPoint_2D(OGRGeometryH , double , double ) nothrow @nogc;
void  OGR_G_AddPointM(OGRGeometryH , double , double , double ) nothrow @nogc;
void  OGR_G_AddPointZM(OGRGeometryH , double , double , double , double ) nothrow @nogc;
void  OGR_G_SetPoints(OGRGeometryH hGeom, int nPointsIn, void *pabyX, int nXStride, void *pabyY, int nYStride, void *pabyZ, int nZStride) nothrow @nogc;
void  OGR_G_SetPointsZM(OGRGeometryH hGeom, int nPointsIn, void *pabyX, int nXStride, void *pabyY, int nYStride, void *pabyZ, int nZStride, void *pabyM, int nMStride) nothrow @nogc;

/* Methods for getting/setting rings and members collections */

int  OGR_G_GetGeometryCount(OGRGeometryH ) nothrow @nogc;
OGRGeometryH  OGR_G_GetGeometryRef(OGRGeometryH , int ) nothrow @nogc;
OGRErr  OGR_G_AddGeometry(OGRGeometryH , OGRGeometryH ) nothrow @nogc;
OGRErr  OGR_G_AddGeometryDirectly(OGRGeometryH , OGRGeometryH ) nothrow @nogc;
OGRErr  OGR_G_RemoveGeometry(OGRGeometryH , int , int ) nothrow @nogc;

int  OGR_G_HasCurveGeometry(OGRGeometryH , int bLookForNonLinear) nothrow @nogc;
OGRGeometryH  OGR_G_GetLinearGeometry(OGRGeometryH hGeom, double dfMaxAngleStepSizeDegrees, char **papszOptions) nothrow @nogc;
OGRGeometryH  OGR_G_GetCurveGeometry(OGRGeometryH hGeom, char **papszOptions) nothrow @nogc;

OGRGeometryH  OGRBuildPolygonFromEdges(OGRGeometryH hLinesAsCollection, int bBestEffort, int bAutoClose, double dfTolerance, OGRErr *peErr) nothrow @nogc;

OGRErr  OGRSetGenerate_DB2_V72_BYTE_ORDER(int bGenerate_DB2_V72_BYTE_ORDER) nothrow @nogc;

int  OGRGetGenerate_DB2_V72_BYTE_ORDER() nothrow @nogc;

void  OGRSetNonLinearGeometriesEnabledFlag(int bFlag) nothrow @nogc;
int  OGRGetNonLinearGeometriesEnabledFlag() nothrow @nogc;

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

OGRFieldDefnH  OGR_Fld_Create(const(char) *, OGRFieldType ) nothrow @nogc;
void  OGR_Fld_Destroy(OGRFieldDefnH ) nothrow @nogc;

void  OGR_Fld_SetName(OGRFieldDefnH , const(char) *) nothrow @nogc;
const(char) * OGR_Fld_GetNameRef(OGRFieldDefnH ) nothrow @nogc;
OGRFieldType  OGR_Fld_GetType(OGRFieldDefnH ) nothrow @nogc;
void  OGR_Fld_SetType(OGRFieldDefnH , OGRFieldType ) nothrow @nogc;
OGRFieldSubType  OGR_Fld_GetSubType(OGRFieldDefnH ) nothrow @nogc;
void  OGR_Fld_SetSubType(OGRFieldDefnH , OGRFieldSubType ) nothrow @nogc;
OGRJustification  OGR_Fld_GetJustify(OGRFieldDefnH ) nothrow @nogc;
void  OGR_Fld_SetJustify(OGRFieldDefnH , OGRJustification ) nothrow @nogc;
int  OGR_Fld_GetWidth(OGRFieldDefnH ) nothrow @nogc;
void  OGR_Fld_SetWidth(OGRFieldDefnH , int ) nothrow @nogc;
int  OGR_Fld_GetPrecision(OGRFieldDefnH ) nothrow @nogc;
void  OGR_Fld_SetPrecision(OGRFieldDefnH , int ) nothrow @nogc;
void  OGR_Fld_Set(OGRFieldDefnH , const(char) *, OGRFieldType , int , int , OGRJustification ) nothrow @nogc;
int  OGR_Fld_IsIgnored(OGRFieldDefnH hDefn) nothrow @nogc;
void  OGR_Fld_SetIgnored(OGRFieldDefnH hDefn, int ) nothrow @nogc;
int  OGR_Fld_IsNullable(OGRFieldDefnH hDefn) nothrow @nogc;
void  OGR_Fld_SetNullable(OGRFieldDefnH hDefn, int ) nothrow @nogc;
const(char) * OGR_Fld_GetDefault(OGRFieldDefnH hDefn) nothrow @nogc;
void  OGR_Fld_SetDefault(OGRFieldDefnH hDefn, const(char) *) nothrow @nogc;
int  OGR_Fld_IsDefaultDriverSpecific(OGRFieldDefnH hDefn) nothrow @nogc;

const(char) * OGR_GetFieldTypeName(OGRFieldType ) nothrow @nogc;
const(char) * OGR_GetFieldSubTypeName(OGRFieldSubType ) nothrow @nogc;
int  OGR_AreTypeSubTypeCompatible(OGRFieldType eType, OGRFieldSubType eSubType) nothrow @nogc;

/* OGRGeomFieldDefnH */

OGRGeomFieldDefnH  OGR_GFld_Create(const(char) *, OGRwkbGeometryType ) nothrow @nogc;
void  OGR_GFld_Destroy(OGRGeomFieldDefnH ) nothrow @nogc;

void  OGR_GFld_SetName(OGRGeomFieldDefnH , const(char) *) nothrow @nogc;
const(char) * OGR_GFld_GetNameRef(OGRGeomFieldDefnH ) nothrow @nogc;

OGRwkbGeometryType  OGR_GFld_GetType(OGRGeomFieldDefnH ) nothrow @nogc;
void  OGR_GFld_SetType(OGRGeomFieldDefnH , OGRwkbGeometryType ) nothrow @nogc;

OGRSpatialReferenceH  OGR_GFld_GetSpatialRef(OGRGeomFieldDefnH ) nothrow @nogc;
void  OGR_GFld_SetSpatialRef(OGRGeomFieldDefnH , OGRSpatialReferenceH hSRS) nothrow @nogc;

int  OGR_GFld_IsNullable(OGRGeomFieldDefnH hDefn) nothrow @nogc;
void  OGR_GFld_SetNullable(OGRGeomFieldDefnH hDefn, int ) nothrow @nogc;

int  OGR_GFld_IsIgnored(OGRGeomFieldDefnH hDefn) nothrow @nogc;
void  OGR_GFld_SetIgnored(OGRGeomFieldDefnH hDefn, int ) nothrow @nogc;

/* OGRFeatureDefn */

OGRFeatureDefnH  OGR_FD_Create(const(char) *) nothrow @nogc;
void  OGR_FD_Destroy(OGRFeatureDefnH ) nothrow @nogc;
void  OGR_FD_Release(OGRFeatureDefnH ) nothrow @nogc;
const(char) * OGR_FD_GetName(OGRFeatureDefnH ) nothrow @nogc;
int  OGR_FD_GetFieldCount(OGRFeatureDefnH ) nothrow @nogc;
OGRFieldDefnH  OGR_FD_GetFieldDefn(OGRFeatureDefnH , int ) nothrow @nogc;
int  OGR_FD_GetFieldIndex(OGRFeatureDefnH , const(char) *) nothrow @nogc;
void  OGR_FD_AddFieldDefn(OGRFeatureDefnH , OGRFieldDefnH ) nothrow @nogc;
OGRErr  OGR_FD_DeleteFieldDefn(OGRFeatureDefnH hDefn, int iField) nothrow @nogc;
OGRErr  OGR_FD_ReorderFieldDefns(OGRFeatureDefnH hDefn, int *panMap) nothrow @nogc;
OGRwkbGeometryType  OGR_FD_GetGeomType(OGRFeatureDefnH ) nothrow @nogc;
void  OGR_FD_SetGeomType(OGRFeatureDefnH , OGRwkbGeometryType ) nothrow @nogc;
int  OGR_FD_IsGeometryIgnored(OGRFeatureDefnH ) nothrow @nogc;
void  OGR_FD_SetGeometryIgnored(OGRFeatureDefnH , int ) nothrow @nogc;
int  OGR_FD_IsStyleIgnored(OGRFeatureDefnH ) nothrow @nogc;
void  OGR_FD_SetStyleIgnored(OGRFeatureDefnH , int ) nothrow @nogc;
int  OGR_FD_Reference(OGRFeatureDefnH ) nothrow @nogc;
int  OGR_FD_Dereference(OGRFeatureDefnH ) nothrow @nogc;
int  OGR_FD_GetReferenceCount(OGRFeatureDefnH ) nothrow @nogc;

int  OGR_FD_GetGeomFieldCount(OGRFeatureDefnH hFDefn) nothrow @nogc;
OGRGeomFieldDefnH  OGR_FD_GetGeomFieldDefn(OGRFeatureDefnH hFDefn, int i) nothrow @nogc;
int  OGR_FD_GetGeomFieldIndex(OGRFeatureDefnH hFDefn, const(char) *pszName) nothrow @nogc;

void  OGR_FD_AddGeomFieldDefn(OGRFeatureDefnH hFDefn, OGRGeomFieldDefnH hGFldDefn) nothrow @nogc;
OGRErr  OGR_FD_DeleteGeomFieldDefn(OGRFeatureDefnH hFDefn, int iGeomField) nothrow @nogc;
int  OGR_FD_IsSame(OGRFeatureDefnH hFDefn, OGRFeatureDefnH hOtherFDefn) nothrow @nogc;
/* OGRFeature */

OGRFeatureH  OGR_F_Create(OGRFeatureDefnH ) nothrow @nogc;
void  OGR_F_Destroy(OGRFeatureH ) nothrow @nogc;
OGRFeatureDefnH  OGR_F_GetDefnRef(OGRFeatureH ) nothrow @nogc;

OGRErr  OGR_F_SetGeometryDirectly(OGRFeatureH , OGRGeometryH ) nothrow @nogc;
OGRErr  OGR_F_SetGeometry(OGRFeatureH , OGRGeometryH ) nothrow @nogc;
OGRGeometryH  OGR_F_GetGeometryRef(OGRFeatureH ) nothrow @nogc;
OGRGeometryH  OGR_F_StealGeometry(OGRFeatureH ) nothrow @nogc;
OGRFeatureH  OGR_F_Clone(OGRFeatureH ) nothrow @nogc;
int  OGR_F_Equal(OGRFeatureH , OGRFeatureH ) nothrow @nogc;

int  OGR_F_GetFieldCount(OGRFeatureH ) nothrow @nogc;
OGRFieldDefnH  OGR_F_GetFieldDefnRef(OGRFeatureH , int ) nothrow @nogc;
int  OGR_F_GetFieldIndex(OGRFeatureH , const(char) *) nothrow @nogc;

int  OGR_F_IsFieldSet(OGRFeatureH , int ) nothrow @nogc;
void  OGR_F_UnsetField(OGRFeatureH , int ) nothrow @nogc;
OGRField * OGR_F_GetRawFieldRef(OGRFeatureH , int ) nothrow @nogc;

int  OGR_F_GetFieldAsInteger(OGRFeatureH , int ) nothrow @nogc;
GIntBig  OGR_F_GetFieldAsInteger64(OGRFeatureH , int ) nothrow @nogc;
double  OGR_F_GetFieldAsDouble(OGRFeatureH , int ) nothrow @nogc;
const(char) * OGR_F_GetFieldAsString(OGRFeatureH , int ) nothrow @nogc;
int * OGR_F_GetFieldAsIntegerList(OGRFeatureH , int , int *) nothrow @nogc;
GIntBig * OGR_F_GetFieldAsInteger64List(OGRFeatureH , int , int *) nothrow @nogc;
double * OGR_F_GetFieldAsDoubleList(OGRFeatureH , int , int *) nothrow @nogc;
char ** OGR_F_GetFieldAsStringList(OGRFeatureH , int ) nothrow @nogc;
GByte * OGR_F_GetFieldAsBinary(OGRFeatureH , int , int *) nothrow @nogc;
int  OGR_F_GetFieldAsDateTime(OGRFeatureH , int , int *, int *, int *, int *, int *, int *, int *) nothrow @nogc;
int  OGR_F_GetFieldAsDateTimeEx(OGRFeatureH hFeat, int iField, int *pnYear, int *pnMonth, int *pnDay, int *pnHour, int *pnMinute, float *pfSecond, int *pnTZFlag) nothrow @nogc;

void  OGR_F_SetFieldInteger(OGRFeatureH , int , int ) nothrow @nogc;
void  OGR_F_SetFieldInteger64(OGRFeatureH , int , GIntBig ) nothrow @nogc;
void  OGR_F_SetFieldDouble(OGRFeatureH , int , double ) nothrow @nogc;
void  OGR_F_SetFieldString(OGRFeatureH , int , const(char) *) nothrow @nogc;
void  OGR_F_SetFieldIntegerList(OGRFeatureH , int , int , int *) nothrow @nogc;
void  OGR_F_SetFieldInteger64List(OGRFeatureH , int , int , GIntBig *) nothrow @nogc;
void  OGR_F_SetFieldDoubleList(OGRFeatureH , int , int , double *) nothrow @nogc;
void  OGR_F_SetFieldStringList(OGRFeatureH , int , char **) nothrow @nogc;
void  OGR_F_SetFieldRaw(OGRFeatureH , int , OGRField *) nothrow @nogc;
void  OGR_F_SetFieldBinary(OGRFeatureH , int , int , GByte *) nothrow @nogc;
void  OGR_F_SetFieldDateTime(OGRFeatureH , int , int , int , int , int , int , int , int ) nothrow @nogc;
void  OGR_F_SetFieldDateTimeEx(OGRFeatureH , int , int , int , int , int , int , float , int ) nothrow @nogc;

int  OGR_F_GetGeomFieldCount(OGRFeatureH hFeat) nothrow @nogc;
OGRGeomFieldDefnH  OGR_F_GetGeomFieldDefnRef(OGRFeatureH hFeat, int iField) nothrow @nogc;
int  OGR_F_GetGeomFieldIndex(OGRFeatureH hFeat, const(char) *pszName) nothrow @nogc;

OGRGeometryH  OGR_F_GetGeomFieldRef(OGRFeatureH hFeat, int iField) nothrow @nogc;
OGRErr  OGR_F_SetGeomFieldDirectly(OGRFeatureH hFeat, int iField, OGRGeometryH hGeom) nothrow @nogc;
OGRErr  OGR_F_SetGeomField(OGRFeatureH hFeat, int iField, OGRGeometryH hGeom) nothrow @nogc;

GIntBig  OGR_F_GetFID(OGRFeatureH ) nothrow @nogc;
OGRErr  OGR_F_SetFID(OGRFeatureH , GIntBig ) nothrow @nogc;
void  OGR_F_DumpReadable(OGRFeatureH , FILE *) nothrow @nogc;
OGRErr  OGR_F_SetFrom(OGRFeatureH , OGRFeatureH , int ) nothrow @nogc;
OGRErr  OGR_F_SetFromWithMap(OGRFeatureH , OGRFeatureH , int , int *) nothrow @nogc;

const(char) * OGR_F_GetStyleString(OGRFeatureH ) nothrow @nogc;
void  OGR_F_SetStyleString(OGRFeatureH , const(char) *) nothrow @nogc;
void  OGR_F_SetStyleStringDirectly(OGRFeatureH , char *) nothrow @nogc;
OGRStyleTableH  OGR_F_GetStyleTable(OGRFeatureH ) nothrow @nogc;
void  OGR_F_SetStyleTableDirectly(OGRFeatureH , OGRStyleTableH ) nothrow @nogc;
void  OGR_F_SetStyleTable(OGRFeatureH , OGRStyleTableH ) nothrow @nogc;

const(char) * OGR_F_GetNativeData(OGRFeatureH ) nothrow @nogc;
void  OGR_F_SetNativeData(OGRFeatureH , const(char) *) nothrow @nogc;
const(char) * OGR_F_GetNativeMediaType(OGRFeatureH ) nothrow @nogc;
void  OGR_F_SetNativeMediaType(OGRFeatureH , const(char) *) nothrow @nogc;

void  OGR_F_FillUnsetWithDefault(OGRFeatureH hFeat, int bNotNullableOnly, char **papszOptions) nothrow @nogc;
int  OGR_F_Validate(OGRFeatureH , int nValidateFlags, int bEmitError) nothrow @nogc;

/* -------------------------------------------------------------------- */
/*      ogrsf_frmts.h                                                   */
/* -------------------------------------------------------------------- */

alias void *OGRLayerH;
alias void *OGRDataSourceH;
alias void *OGRSFDriverH;

/* OGRLayer */

const(char) * OGR_L_GetName(OGRLayerH ) nothrow @nogc;
OGRwkbGeometryType  OGR_L_GetGeomType(OGRLayerH ) nothrow @nogc;
OGRGeometryH  OGR_L_GetSpatialFilter(OGRLayerH ) nothrow @nogc;
void  OGR_L_SetSpatialFilter(OGRLayerH , OGRGeometryH ) nothrow @nogc;
void  OGR_L_SetSpatialFilterRect(OGRLayerH , double , double , double , double ) nothrow @nogc;
void  OGR_L_SetSpatialFilterEx(OGRLayerH , int iGeomField, OGRGeometryH hGeom) nothrow @nogc;
void  OGR_L_SetSpatialFilterRectEx(OGRLayerH , int iGeomField, double dfMinX, double dfMinY, double dfMaxX, double dfMaxY) nothrow @nogc;
OGRErr  OGR_L_SetAttributeFilter(OGRLayerH , const(char) *) nothrow @nogc;
void  OGR_L_ResetReading(OGRLayerH ) nothrow @nogc;
OGRFeatureH  OGR_L_GetNextFeature(OGRLayerH ) nothrow @nogc;
OGRErr  OGR_L_SetNextByIndex(OGRLayerH , GIntBig ) nothrow @nogc;
OGRFeatureH  OGR_L_GetFeature(OGRLayerH , GIntBig ) nothrow @nogc;
OGRErr  OGR_L_SetFeature(OGRLayerH , OGRFeatureH ) nothrow @nogc;
OGRErr  OGR_L_CreateFeature(OGRLayerH , OGRFeatureH ) nothrow @nogc;
OGRErr  OGR_L_DeleteFeature(OGRLayerH , GIntBig ) nothrow @nogc;
OGRFeatureDefnH  OGR_L_GetLayerDefn(OGRLayerH ) nothrow @nogc;
OGRSpatialReferenceH  OGR_L_GetSpatialRef(OGRLayerH ) nothrow @nogc;
int  OGR_L_FindFieldIndex(OGRLayerH , const(char) *, int bExactMatch) nothrow @nogc;
GIntBig  OGR_L_GetFeatureCount(OGRLayerH , int ) nothrow @nogc;
OGRErr  OGR_L_GetExtent(OGRLayerH , OGREnvelope *, int ) nothrow @nogc;
OGRErr  OGR_L_GetExtentEx(OGRLayerH , int iGeomField, OGREnvelope *psExtent, int bForce) nothrow @nogc;
int  OGR_L_TestCapability(OGRLayerH , const(char) *) nothrow @nogc;
OGRErr  OGR_L_CreateField(OGRLayerH , OGRFieldDefnH , int ) nothrow @nogc;
OGRErr  OGR_L_CreateGeomField(OGRLayerH hLayer, OGRGeomFieldDefnH hFieldDefn, int bForce) nothrow @nogc;
OGRErr  OGR_L_DeleteField(OGRLayerH , int iField) nothrow @nogc;
OGRErr  OGR_L_ReorderFields(OGRLayerH , int *panMap) nothrow @nogc;
OGRErr  OGR_L_ReorderField(OGRLayerH , int iOldFieldPos, int iNewFieldPos) nothrow @nogc;
OGRErr  OGR_L_AlterFieldDefn(OGRLayerH , int iField, OGRFieldDefnH hNewFieldDefn, int nFlags) nothrow @nogc;
OGRErr  OGR_L_StartTransaction(OGRLayerH ) nothrow @nogc;
OGRErr  OGR_L_CommitTransaction(OGRLayerH ) nothrow @nogc;
OGRErr  OGR_L_RollbackTransaction(OGRLayerH ) nothrow @nogc;
int  OGR_L_Reference(OGRLayerH ) nothrow @nogc;
int  OGR_L_Dereference(OGRLayerH ) nothrow @nogc;
int  OGR_L_GetRefCount(OGRLayerH ) nothrow @nogc;
OGRErr  OGR_L_SyncToDisk(OGRLayerH ) nothrow @nogc;
GIntBig  OGR_L_GetFeaturesRead(OGRLayerH ) nothrow @nogc;
const(char) * OGR_L_GetFIDColumn(OGRLayerH ) nothrow @nogc;
const(char) * OGR_L_GetGeometryColumn(OGRLayerH ) nothrow @nogc;
OGRStyleTableH  OGR_L_GetStyleTable(OGRLayerH ) nothrow @nogc;
void  OGR_L_SetStyleTableDirectly(OGRLayerH , OGRStyleTableH ) nothrow @nogc;
void  OGR_L_SetStyleTable(OGRLayerH , OGRStyleTableH ) nothrow @nogc;
OGRErr  OGR_L_SetIgnoredFields(OGRLayerH , const(char*)*) nothrow @nogc;
OGRErr  OGR_L_Intersection(OGRLayerH , OGRLayerH , OGRLayerH , char **, GDALProgressFunc , void *) nothrow @nogc;
OGRErr  OGR_L_Union(OGRLayerH , OGRLayerH , OGRLayerH , char **, GDALProgressFunc , void *) nothrow @nogc;
OGRErr  OGR_L_SymDifference(OGRLayerH , OGRLayerH , OGRLayerH , char **, GDALProgressFunc , void *) nothrow @nogc;
OGRErr  OGR_L_Identity(OGRLayerH , OGRLayerH , OGRLayerH , char **, GDALProgressFunc , void *) nothrow @nogc;
OGRErr  OGR_L_Update(OGRLayerH , OGRLayerH , OGRLayerH , char **, GDALProgressFunc , void *) nothrow @nogc;
OGRErr  OGR_L_Clip(OGRLayerH , OGRLayerH , OGRLayerH , char **, GDALProgressFunc , void *) nothrow @nogc;
OGRErr  OGR_L_Erase(OGRLayerH , OGRLayerH , OGRLayerH , char **, GDALProgressFunc , void *) nothrow @nogc;

/* OGRDataSource */

void  OGR_DS_Destroy(OGRDataSourceH ) nothrow @nogc;
const(char) * OGR_DS_GetName(OGRDataSourceH ) nothrow @nogc;
int  OGR_DS_GetLayerCount(OGRDataSourceH ) nothrow @nogc;
OGRLayerH  OGR_DS_GetLayer(OGRDataSourceH , int ) nothrow @nogc;
OGRLayerH  OGR_DS_GetLayerByName(OGRDataSourceH , const(char) *) nothrow @nogc;
OGRErr  OGR_DS_DeleteLayer(OGRDataSourceH , int ) nothrow @nogc;
OGRSFDriverH  OGR_DS_GetDriver(OGRDataSourceH ) nothrow @nogc;
OGRLayerH  OGR_DS_CreateLayer(OGRDataSourceH , const(char) *, OGRSpatialReferenceH , OGRwkbGeometryType , char **) nothrow @nogc;
OGRLayerH  OGR_DS_CopyLayer(OGRDataSourceH , OGRLayerH , const(char) *, char **) nothrow @nogc;
int  OGR_DS_TestCapability(OGRDataSourceH , const(char) *) nothrow @nogc;
OGRLayerH  OGR_DS_ExecuteSQL(OGRDataSourceH , const(char) *, OGRGeometryH , const(char) *) nothrow @nogc;
void  OGR_DS_ReleaseResultSet(OGRDataSourceH , OGRLayerH ) nothrow @nogc;
int  OGR_DS_Reference(OGRDataSourceH ) nothrow @nogc;
int  OGR_DS_Dereference(OGRDataSourceH ) nothrow @nogc;
int  OGR_DS_GetRefCount(OGRDataSourceH ) nothrow @nogc;
int  OGR_DS_GetSummaryRefCount(OGRDataSourceH ) nothrow @nogc;
OGRErr  OGR_DS_SyncToDisk(OGRDataSourceH ) nothrow @nogc;
OGRStyleTableH  OGR_DS_GetStyleTable(OGRDataSourceH ) nothrow @nogc;
void  OGR_DS_SetStyleTableDirectly(OGRDataSourceH , OGRStyleTableH ) nothrow @nogc;
void  OGR_DS_SetStyleTable(OGRDataSourceH , OGRStyleTableH ) nothrow @nogc;

/* OGRSFDriver */

const(char) * OGR_Dr_GetName(OGRSFDriverH ) nothrow @nogc;
OGRDataSourceH  OGR_Dr_Open(OGRSFDriverH , const(char) *, int ) nothrow @nogc;
int  OGR_Dr_TestCapability(OGRSFDriverH , const(char) *) nothrow @nogc;
OGRDataSourceH  OGR_Dr_CreateDataSource(OGRSFDriverH , const(char) *, char **) nothrow @nogc;
OGRDataSourceH  OGR_Dr_CopyDataSource(OGRSFDriverH , OGRDataSourceH , const(char) *, char **) nothrow @nogc;
OGRErr  OGR_Dr_DeleteDataSource(OGRSFDriverH , const(char) *) nothrow @nogc;

/* OGRSFDriverRegistrar */

OGRDataSourceH  OGROpen(const(char) *, int , OGRSFDriverH *) nothrow @nogc;
OGRDataSourceH  OGROpenShared(const(char) *, int , OGRSFDriverH *) nothrow @nogc;
OGRErr  OGRReleaseDataSource(OGRDataSourceH ) nothrow @nogc;
void  OGRRegisterDriver(OGRSFDriverH ) nothrow @nogc;
void  OGRDeregisterDriver(OGRSFDriverH ) nothrow @nogc;
int  OGRGetDriverCount() nothrow @nogc;
OGRSFDriverH  OGRGetDriver(int ) nothrow @nogc;
OGRSFDriverH  OGRGetDriverByName(const(char) *) nothrow @nogc;
int  OGRGetOpenDSCount() nothrow @nogc;
OGRDataSourceH  OGRGetOpenDS(int iDS) nothrow @nogc;


/* note: this is also declared in ogrsf_frmts.h */
void  OGRRegisterAll() nothrow @nogc;
void  OGRCleanupAll() nothrow @nogc;

/* -------------------------------------------------------------------- */
/*      ogrsf_featurestyle.h                                            */
/* -------------------------------------------------------------------- */

alias void *OGRStyleMgrH;
alias void *OGRStyleToolH;

/* OGRStyleMgr */

OGRStyleMgrH  OGR_SM_Create(OGRStyleTableH hStyleTable) nothrow @nogc;
void  OGR_SM_Destroy(OGRStyleMgrH hSM) nothrow @nogc;

const(char) * OGR_SM_InitFromFeature(OGRStyleMgrH hSM, OGRFeatureH hFeat) nothrow @nogc;
int  OGR_SM_InitStyleString(OGRStyleMgrH hSM, const(char) *pszStyleString) nothrow @nogc;
int  OGR_SM_GetPartCount(OGRStyleMgrH hSM, const(char) *pszStyleString) nothrow @nogc;
OGRStyleToolH  OGR_SM_GetPart(OGRStyleMgrH hSM, int nPartId, const(char) *pszStyleString) nothrow @nogc;
int  OGR_SM_AddPart(OGRStyleMgrH hSM, OGRStyleToolH hST) nothrow @nogc;
int  OGR_SM_AddStyle(OGRStyleMgrH hSM, const(char) *pszStyleName, const(char) *pszStyleString) nothrow @nogc;

/* OGRStyleTool */

OGRStyleToolH  OGR_ST_Create(OGRSTClassId eClassId) nothrow @nogc;
void  OGR_ST_Destroy(OGRStyleToolH hST) nothrow @nogc;

OGRSTClassId  OGR_ST_GetType(OGRStyleToolH hST) nothrow @nogc;

OGRSTUnitId  OGR_ST_GetUnit(OGRStyleToolH hST) nothrow @nogc;
void  OGR_ST_SetUnit(OGRStyleToolH hST, OGRSTUnitId eUnit, double dfGroundPaperScale) nothrow @nogc;

const(char) * OGR_ST_GetParamStr(OGRStyleToolH hST, int eParam, int *bValueIsNull) nothrow @nogc;
int  OGR_ST_GetParamNum(OGRStyleToolH hST, int eParam, int *bValueIsNull) nothrow @nogc;
double  OGR_ST_GetParamDbl(OGRStyleToolH hST, int eParam, int *bValueIsNull) nothrow @nogc;
void  OGR_ST_SetParamStr(OGRStyleToolH hST, int eParam, const(char) *pszValue) nothrow @nogc;
void  OGR_ST_SetParamNum(OGRStyleToolH hST, int eParam, int nValue) nothrow @nogc;
void  OGR_ST_SetParamDbl(OGRStyleToolH hST, int eParam, double dfValue) nothrow @nogc;
const(char) * OGR_ST_GetStyleString(OGRStyleToolH hST) nothrow @nogc;

int  OGR_ST_GetRGBFromString(OGRStyleToolH hST, const(char) *pszColor, int *pnRed, int *pnGreen, int *pnBlue, int *pnAlpha) nothrow @nogc;

/* OGRStyleTable */

OGRStyleTableH  OGR_STBL_Create() nothrow @nogc;
void  OGR_STBL_Destroy(OGRStyleTableH hSTBL) nothrow @nogc;
int  OGR_STBL_AddStyle(OGRStyleTableH hStyleTable, const(char) *pszName, const(char) *pszStyleString) nothrow @nogc;
int  OGR_STBL_SaveStyleTable(OGRStyleTableH hStyleTable, const(char) *pszFilename) nothrow @nogc;
int  OGR_STBL_LoadStyleTable(OGRStyleTableH hStyleTable, const(char) *pszFilename) nothrow @nogc;
const(char) * OGR_STBL_Find(OGRStyleTableH hStyleTable, char *pszName) nothrow @nogc;
void  OGR_STBL_ResetStyleStringReading(OGRStyleTableH hStyleTable) nothrow @nogc;
const(char) * OGR_STBL_GetNextStyle(OGRStyleTableH hStyleTable) nothrow @nogc;
const(char) * OGR_STBL_GetLastStyleName(OGRStyleTableH hStyleTable) nothrow @nogc;
