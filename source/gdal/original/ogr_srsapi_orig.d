/* Converted to D from C:/devLibs/gdal21/include/ogr_srs_api.h by htod */
module ./ogr_srsapi_orig;
/******************************************************************************
 * $Id: ogr_srs_api.h 33631 2016-03-04 06:28:09Z goatbar $
 *
 * Project:  OpenGIS Simple Features Reference Implementation
 * Purpose:  C API and constant declarations for OGR Spatial References.
 * Author:   Frank Warmerdam, warmerdam@pobox.com
 *
 ******************************************************************************
 * Copyright (c) 2000, Frank Warmerdam
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

//C     #ifndef OGR_SRS_API_H_INCLUDED
//C     #define OGR_SRS_API_H_INCLUDED

//C     #ifndef SWIG
//C     #include "ogr_core.h"
import ogr_core;

//C     CPL_C_START

/**
 * \file ogr_srs_api.h
 *
 * C spatial reference system services and defines.
 *
 * See also: ogr_spatialref.h
 */

/* -------------------------------------------------------------------- */
/*      Axis orientations (corresponds to CS_AxisOrientationEnum).      */
/* -------------------------------------------------------------------- */
//C     typedef enum {
//C         OAO_Other=0,
//C         OAO_North=1,
//C         OAO_South=2,
//C         OAO_East=3,
//C         OAO_West=4,
//C         OAO_Up=5,
//C         OAO_Down=6
//C     } OGRAxisOrientation;
enum
{
    OAO_Other,
    OAO_North,
    OAO_South,
    OAO_East,
    OAO_West,
    OAO_Up,
    OAO_Down,
}
extern (C):
alias int OGRAxisOrientation;

//C     const char CPL_DLL *OSRAxisEnumToName( OGRAxisOrientation eOrientation );
char * OSRAxisEnumToName(OGRAxisOrientation eOrientation);

/* -------------------------------------------------------------------- */
/*      Datum types (corresponds to CS_DatumType).                      */
/* -------------------------------------------------------------------- */

//C     typedef enum {
//C         ODT_HD_Min=1000,
//C         ODT_HD_Other=1000,
//C         ODT_HD_Classic=1001,
//C         ODT_HD_Geocentric=1002,
//C         ODT_HD_Max=1999,
//C         ODT_VD_Min=2000,
//C         ODT_VD_Other=2000,
//C         ODT_VD_Orthometric=2001,
//C         ODT_VD_Ellipsoidal=2002,
//C         ODT_VD_AltitudeBarometric=2003,
//C         ODT_VD_Normal=2004,
//C         ODT_VD_GeoidModelDerived=2005,
//C         ODT_VD_Depth=2006,
//C         ODT_VD_Max=2999,
//C         ODT_LD_Min=10000,
//C         ODT_LD_Max=32767
//C     } OGRDatumType;
enum
{
    ODT_HD_Min = 1000,
    ODT_HD_Other = 1000,
    ODT_HD_Classic,
    ODT_HD_Geocentric,
    ODT_HD_Max = 1999,
    ODT_VD_Min,
    ODT_VD_Other = 2000,
    ODT_VD_Orthometric,
    ODT_VD_Ellipsoidal,
    ODT_VD_AltitudeBarometric,
    ODT_VD_Normal,
    ODT_VD_GeoidModelDerived,
    ODT_VD_Depth,
    ODT_VD_Max = 2999,
    ODT_LD_Min = 10000,
    ODT_LD_Max = 32767,
}
alias int OGRDatumType;

//C     #endif // ndef SWIG

/* ==================================================================== */
/*      Some standard WKT geographic coordinate systems.                */
/* ==================================================================== */

//C     #define SRS_WKT_WGS84 "GEOGCS[\"WGS 84\",DATUM[\"WGS_1984\",SPHEROID[\"WGS 84\",6378137,298.257223563,AUTHORITY[\"EPSG\",\"7030\"]],AUTHORITY[\"EPSG\",\"6326\"]],PRIMEM[\"Greenwich\",0,AUTHORITY[\"EPSG\",\"8901\"]],UNIT[\"degree\",0.0174532925199433,AUTHORITY[\"EPSG\",\"9122\"]],AUTHORITY[\"EPSG\",\"4326\"]]"

/* ==================================================================== */
/*      Some "standard" strings.                                        */
/* ==================================================================== */

//C     #define SRS_PT_ALBERS_CONIC_EQUAL_AREA                                                                  "Albers_Conic_Equal_Area"
//C     #define SRS_PT_AZIMUTHAL_EQUIDISTANT "Azimuthal_Equidistant"
//C     #define SRS_PT_CASSINI_SOLDNER  "Cassini_Soldner"
//C     #define SRS_PT_CYLINDRICAL_EQUAL_AREA "Cylindrical_Equal_Area"
//C     #define SRS_PT_BONNE            "Bonne"
//C     #define SRS_PT_ECKERT_I         "Eckert_I"
//C     #define SRS_PT_ECKERT_II        "Eckert_II"
//C     #define SRS_PT_ECKERT_III       "Eckert_III"
//C     #define SRS_PT_ECKERT_IV        "Eckert_IV"
//C     #define SRS_PT_ECKERT_V         "Eckert_V"
//C     #define SRS_PT_ECKERT_VI        "Eckert_VI"
//C     #define SRS_PT_EQUIDISTANT_CONIC                                                                        "Equidistant_Conic"
//C     #define SRS_PT_EQUIRECTANGULAR  "Equirectangular"
//C     #define SRS_PT_GALL_STEREOGRAPHIC                                                                       "Gall_Stereographic"
//C     #define SRS_PT_GAUSSSCHREIBERTMERCATOR                                                                      "Gauss_Schreiber_Transverse_Mercator"
//C     #define SRS_PT_GEOSTATIONARY_SATELLITE                                                                  "Geostationary_Satellite"
//C     #define SRS_PT_GOODE_HOMOLOSINE "Goode_Homolosine"
//C     #define SRS_PT_IGH              "Interrupted_Goode_Homolosine"
//C     #define SRS_PT_GNOMONIC         "Gnomonic"
//C     #define SRS_PT_HOTINE_OBLIQUE_MERCATOR_AZIMUTH_CENTER                                                   "Hotine_Oblique_Mercator_Azimuth_Center"
//C     #define SRS_PT_HOTINE_OBLIQUE_MERCATOR                                                                  "Hotine_Oblique_Mercator"
//C     #define SRS_PT_HOTINE_OBLIQUE_MERCATOR_TWO_POINT_NATURAL_ORIGIN                                     "Hotine_Oblique_Mercator_Two_Point_Natural_Origin"
//C     #define SRS_PT_LABORDE_OBLIQUE_MERCATOR                                                                 "Laborde_Oblique_Mercator"
//C     #define SRS_PT_LAMBERT_CONFORMAL_CONIC_1SP                                                              "Lambert_Conformal_Conic_1SP"
//C     #define SRS_PT_LAMBERT_CONFORMAL_CONIC_2SP                                                              "Lambert_Conformal_Conic_2SP"
//C     #define SRS_PT_LAMBERT_CONFORMAL_CONIC_2SP_BELGIUM                                                      "Lambert_Conformal_Conic_2SP_Belgium"
//C     #define SRS_PT_LAMBERT_AZIMUTHAL_EQUAL_AREA                                                     "Lambert_Azimuthal_Equal_Area"
//C     #define SRS_PT_MERCATOR_1SP     "Mercator_1SP"
//C     #define SRS_PT_MERCATOR_2SP     "Mercator_2SP"
// Mercator_Auxiliary_Sphere is used used by ESRI to mean EPSG:3875
//C     #define SRS_PT_MERCATOR_AUXILIARY_SPHERE                                                                 "Mercator_Auxiliary_Sphere"
//C     #define SRS_PT_MILLER_CYLINDRICAL "Miller_Cylindrical"
//C     #define SRS_PT_MOLLWEIDE        "Mollweide"
//C     #define SRS_PT_NEW_ZEALAND_MAP_GRID                                                                     "New_Zealand_Map_Grid"
//C     #define SRS_PT_OBLIQUE_STEREOGRAPHIC                                                                    "Oblique_Stereographic"
//C     #define SRS_PT_ORTHOGRAPHIC     "Orthographic"
//C     #define SRS_PT_POLAR_STEREOGRAPHIC                                                                      "Polar_Stereographic"
//C     #define SRS_PT_POLYCONIC        "Polyconic"
//C     #define SRS_PT_ROBINSON         "Robinson"
//C     #define SRS_PT_SINUSOIDAL       "Sinusoidal"
//C     #define SRS_PT_STEREOGRAPHIC    "Stereographic"
//C     #define SRS_PT_SWISS_OBLIQUE_CYLINDRICAL                                                                "Swiss_Oblique_Cylindrical"
//C     #define SRS_PT_TRANSVERSE_MERCATOR                                                                      "Transverse_Mercator"
//C     #define SRS_PT_TRANSVERSE_MERCATOR_SOUTH_ORIENTED                                                       "Transverse_Mercator_South_Orientated"

/* special mapinfo variants on Transverse Mercator */
//C     #define SRS_PT_TRANSVERSE_MERCATOR_MI_21                                 "Transverse_Mercator_MapInfo_21"
//C     #define SRS_PT_TRANSVERSE_MERCATOR_MI_22                                 "Transverse_Mercator_MapInfo_22"
//C     #define SRS_PT_TRANSVERSE_MERCATOR_MI_23                                 "Transverse_Mercator_MapInfo_23"
//C     #define SRS_PT_TRANSVERSE_MERCATOR_MI_24                                 "Transverse_Mercator_MapInfo_24"
//C     #define SRS_PT_TRANSVERSE_MERCATOR_MI_25                                 "Transverse_Mercator_MapInfo_25"

//C     #define SRS_PT_TUNISIA_MINING_GRID                                                                      "Tunisia_Mining_Grid"
//C     #define SRS_PT_TWO_POINT_EQUIDISTANT                                                                    "Two_Point_Equidistant"
//C     #define SRS_PT_VANDERGRINTEN    "VanDerGrinten"
//C     #define SRS_PT_KROVAK           "Krovak"
//C     #define SRS_PT_IMW_POLYCONIC    "International_Map_of_the_World_Polyconic"
//C     #define SRS_PT_WAGNER_I         "Wagner_I"
//C     #define SRS_PT_WAGNER_II        "Wagner_II"
//C     #define SRS_PT_WAGNER_III       "Wagner_III"
//C     #define SRS_PT_WAGNER_IV        "Wagner_IV"
//C     #define SRS_PT_WAGNER_V         "Wagner_V"
//C     #define SRS_PT_WAGNER_VI        "Wagner_VI"
//C     #define SRS_PT_WAGNER_VII       "Wagner_VII"
//C     #define SRS_PT_QSC              "Quadrilateralized_Spherical_Cube"
//C     #define SRS_PT_AITOFF           "Aitoff"
//C     #define SRS_PT_WINKEL_I         "Winkel_I"
//C     #define SRS_PT_WINKEL_II        "Winkel_II"
//C     #define SRS_PT_WINKEL_TRIPEL    "Winkel_Tripel"
//C     #define SRS_PT_CRASTER_PARABOLIC    "Craster_Parabolic"
//C     #define SRS_PT_LOXIMUTHAL        "Loximuthal"
//C     #define SRS_PT_QUARTIC_AUTHALIC  "Quartic_Authalic"
//C     #define SRS_PT_SCH              "Spherical_Cross_Track_Height"

//C     #define SRS_PP_CENTRAL_MERIDIAN         "central_meridian"
//C     #define SRS_PP_SCALE_FACTOR             "scale_factor"
//C     #define SRS_PP_STANDARD_PARALLEL_1      "standard_parallel_1"
//C     #define SRS_PP_STANDARD_PARALLEL_2      "standard_parallel_2"
//C     #define SRS_PP_PSEUDO_STD_PARALLEL_1    "pseudo_standard_parallel_1"
//C     #define SRS_PP_LONGITUDE_OF_CENTER      "longitude_of_center"
//C     #define SRS_PP_LATITUDE_OF_CENTER       "latitude_of_center"
//C     #define SRS_PP_LONGITUDE_OF_ORIGIN      "longitude_of_origin"
//C     #define SRS_PP_LATITUDE_OF_ORIGIN       "latitude_of_origin"
//C     #define SRS_PP_FALSE_EASTING            "false_easting"
//C     #define SRS_PP_FALSE_NORTHING           "false_northing"
//C     #define SRS_PP_AZIMUTH                  "azimuth"
//C     #define SRS_PP_LONGITUDE_OF_POINT_1     "longitude_of_point_1"
//C     #define SRS_PP_LATITUDE_OF_POINT_1      "latitude_of_point_1"
//C     #define SRS_PP_LONGITUDE_OF_POINT_2     "longitude_of_point_2"
//C     #define SRS_PP_LATITUDE_OF_POINT_2      "latitude_of_point_2"
//C     #define SRS_PP_LONGITUDE_OF_POINT_3     "longitude_of_point_3"
//C     #define SRS_PP_LATITUDE_OF_POINT_3      "latitude_of_point_3"
//C     #define SRS_PP_RECTIFIED_GRID_ANGLE     "rectified_grid_angle"
//C     #define SRS_PP_LANDSAT_NUMBER           "landsat_number"
//C     #define SRS_PP_PATH_NUMBER              "path_number"
//C     #define SRS_PP_PERSPECTIVE_POINT_HEIGHT "perspective_point_height"
//C     #define SRS_PP_SATELLITE_HEIGHT         "satellite_height"
//C     #define SRS_PP_FIPSZONE                 "fipszone"
//C     #define SRS_PP_ZONE                     "zone"
//C     #define SRS_PP_LATITUDE_OF_1ST_POINT    "Latitude_Of_1st_Point"
//C     #define SRS_PP_LONGITUDE_OF_1ST_POINT   "Longitude_Of_1st_Point"
//C     #define SRS_PP_LATITUDE_OF_2ND_POINT    "Latitude_Of_2nd_Point"
//C     #define SRS_PP_LONGITUDE_OF_2ND_POINT   "Longitude_Of_2nd_Point"
//C     #define SRS_PP_PEG_POINT_LATITUDE       "peg_point_latitude"
//C     #define SRS_PP_PEG_POINT_LONGITUDE      "peg_point_longitude"
//C     #define SRS_PP_PEG_POINT_HEADING        "peg_point_heading"
//C     #define SRS_PP_PEG_POINT_HEIGHT         "peg_point_height"

//C     #define SRS_UL_METER            "Meter"
//C     #define SRS_UL_FOOT             "Foot (International)" /* or just "FOOT"? */
//C     #define SRS_UL_FOOT_CONV                    "0.3048"
//C     #define SRS_UL_US_FOOT          "Foot_US" /* or "US survey foot" from EPSG */
//C     #define SRS_UL_US_FOOT_CONV                 "0.3048006096012192"
//C     #define SRS_UL_NAUTICAL_MILE    "Nautical Mile"
//C     #define SRS_UL_NAUTICAL_MILE_CONV           "1852.0"
//C     #define SRS_UL_LINK             "Link"          /* Based on US Foot */
//C     #define SRS_UL_LINK_CONV                    "0.20116684023368047"
//C     #define SRS_UL_CHAIN            "Chain"         /* based on US Foot */
//C     #define SRS_UL_CHAIN_CONV                   "20.116684023368047"
//C     #define SRS_UL_ROD              "Rod"           /* based on US Foot */
//C     #define SRS_UL_ROD_CONV                     "5.02921005842012"
//C     #define SRS_UL_LINK_Clarke      "Link_Clarke"
//C     #define SRS_UL_LINK_Clarke_CONV              "0.2011661949"

//C     #define SRS_UL_KILOMETER        "Kilometer"
//C     #define SRS_UL_KILOMETER_CONV                "1000."
//C     #define SRS_UL_DECIMETER        "Decimeter"
//C     #define SRS_UL_DECIMETER_CONV                "0.1"
//C     #define SRS_UL_CENTIMETER       "Centimeter"
//C     #define SRS_UL_CENTIMETER_CONV               "0.01"
//C     #define SRS_UL_MILLIMETER       "Millimeter"
//C     #define SRS_UL_MILLIMETER_CONV               "0.001"
//C     #define SRS_UL_INTL_NAUT_MILE   "Nautical_Mile_International"
//C     #define SRS_UL_INTL_NAUT_MILE_CONV           "1852.0"
//C     #define SRS_UL_INTL_INCH        "Inch_International"
//C     #define SRS_UL_INTL_INCH_CONV                "0.0254"
//C     #define SRS_UL_INTL_FOOT        "Foot_International"
//C     #define SRS_UL_INTL_FOOT_CONV                    "0.3048"
//C     #define SRS_UL_INTL_YARD        "Yard_International"
//C     #define SRS_UL_INTL_YARD_CONV                "0.9144"
//C     #define SRS_UL_INTL_STAT_MILE   "Statute_Mile_International"
//C     #define SRS_UL_INTL_STAT_MILE_CONV           "1609.344"
//C     #define SRS_UL_INTL_FATHOM      "Fathom_International"
//C     #define SRS_UL_INTL_FATHOM_CONV              "1.8288"
//C     #define SRS_UL_INTL_CHAIN       "Chain_International"
//C     #define SRS_UL_INTL_CHAIN_CONV               "20.1168"
//C     #define SRS_UL_INTL_LINK        "Link_International"
//C     #define SRS_UL_INTL_LINK_CONV                "0.201168"
//C     #define SRS_UL_US_INCH          "Inch_US_Surveyor"
//C     #define SRS_UL_US_INCH_CONV                  "0.025400050800101603"
//C     #define SRS_UL_US_YARD          "Yard_US_Surveyor"
//C     #define SRS_UL_US_YARD_CONV                  "0.914401828803658"
//C     #define SRS_UL_US_CHAIN         "Chain_US_Surveyor"
//C     #define SRS_UL_US_CHAIN_CONV                 "20.11684023368047"
//C     #define SRS_UL_US_STAT_MILE     "Statute_Mile_US_Surveyor"
//C     #define SRS_UL_US_STAT_MILE_CONV             "1609.347218694437"
//C     #define SRS_UL_INDIAN_YARD      "Yard_Indian"
//C     #define SRS_UL_INDIAN_YARD_CONV              "0.91439523"
//C     #define SRS_UL_INDIAN_FOOT      "Foot_Indian"
//C     #define SRS_UL_INDIAN_FOOT_CONV              "0.30479841"
//C     #define SRS_UL_INDIAN_CHAIN     "Chain_Indian"
//C     #define SRS_UL_INDIAN_CHAIN_CONV             "20.11669506"

//C     #define SRS_UA_DEGREE           "degree"
//C     #define SRS_UA_DEGREE_CONV                  "0.0174532925199433"
//C     #define SRS_UA_RADIAN           "radian"

//C     #define SRS_PM_GREENWICH        "Greenwich"

//C     #define SRS_DN_NAD27            "North_American_Datum_1927"
//C     #define SRS_DN_NAD83            "North_American_Datum_1983"
//C     #define SRS_DN_WGS72            "WGS_1972"
//C     #define SRS_DN_WGS84            "WGS_1984"

//C     #define SRS_WGS84_SEMIMAJOR     6378137.0
//C     #define SRS_WGS84_INVFLATTENING 298.257223563
const SRS_WGS84_SEMIMAJOR = 6378137.0;

const SRS_WGS84_INVFLATTENING = 298.257223563;
//C     #ifndef SWIG
/* -------------------------------------------------------------------- */
/*      C Wrappers for C++ objects and methods.                         */
/* -------------------------------------------------------------------- */
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


//C     OGRSpatialReferenceH CPL_DLL CPL_STDCALL
//C           OSRNewSpatialReference( const char * /* = NULL */);
extern (Windows):
OGRSpatialReferenceH  OSRNewSpatialReference(char *);
//C     OGRSpatialReferenceH CPL_DLL CPL_STDCALL OSRCloneGeogCS( OGRSpatialReferenceH );
OGRSpatialReferenceH  OSRCloneGeogCS(OGRSpatialReferenceH );
//C     OGRSpatialReferenceH CPL_DLL CPL_STDCALL OSRClone( OGRSpatialReferenceH );
OGRSpatialReferenceH  OSRClone(OGRSpatialReferenceH );
//C     void CPL_DLL CPL_STDCALL OSRDestroySpatialReference( OGRSpatialReferenceH );
void  OSRDestroySpatialReference(OGRSpatialReferenceH );

//C     int CPL_DLL OSRReference( OGRSpatialReferenceH );
extern (C):
int  OSRReference(OGRSpatialReferenceH );
//C     int CPL_DLL OSRDereference( OGRSpatialReferenceH );
int  OSRDereference(OGRSpatialReferenceH );
//C     void CPL_DLL OSRRelease( OGRSpatialReferenceH );
void  OSRRelease(OGRSpatialReferenceH );

//C     OGRErr CPL_DLL OSRValidate( OGRSpatialReferenceH );
OGRErr  OSRValidate(OGRSpatialReferenceH );
//C     OGRErr CPL_DLL OSRFixupOrdering( OGRSpatialReferenceH );
OGRErr  OSRFixupOrdering(OGRSpatialReferenceH );
//C     OGRErr CPL_DLL OSRFixup( OGRSpatialReferenceH );
OGRErr  OSRFixup(OGRSpatialReferenceH );
//C     OGRErr CPL_DLL OSRStripCTParms( OGRSpatialReferenceH );
OGRErr  OSRStripCTParms(OGRSpatialReferenceH );

//C     OGRErr CPL_DLL CPL_STDCALL OSRImportFromEPSG( OGRSpatialReferenceH, int );
extern (Windows):
OGRErr  OSRImportFromEPSG(OGRSpatialReferenceH , int );
//C     OGRErr CPL_DLL CPL_STDCALL OSRImportFromEPSGA( OGRSpatialReferenceH, int );
OGRErr  OSRImportFromEPSGA(OGRSpatialReferenceH , int );
//C     OGRErr CPL_DLL OSRImportFromWkt( OGRSpatialReferenceH, char ** );
extern (C):
OGRErr  OSRImportFromWkt(OGRSpatialReferenceH , char **);
//C     OGRErr CPL_DLL OSRImportFromProj4( OGRSpatialReferenceH, const char *);
OGRErr  OSRImportFromProj4(OGRSpatialReferenceH , char *);
//C     OGRErr CPL_DLL OSRImportFromESRI( OGRSpatialReferenceH, char **);
OGRErr  OSRImportFromESRI(OGRSpatialReferenceH , char **);
//C     OGRErr CPL_DLL OSRImportFromPCI( OGRSpatialReferenceH hSRS, const char *,
//C                                      const char *, double * );
OGRErr  OSRImportFromPCI(OGRSpatialReferenceH hSRS, char *, char *, double *);
//C     OGRErr CPL_DLL OSRImportFromUSGS( OGRSpatialReferenceH,
//C                                       long, long, double *, long);
OGRErr  OSRImportFromUSGS(OGRSpatialReferenceH , int , int , double *, int );
//C     OGRErr CPL_DLL OSRImportFromXML( OGRSpatialReferenceH, const char * );
OGRErr  OSRImportFromXML(OGRSpatialReferenceH , char *);
//C     OGRErr CPL_DLL OSRImportFromDict( OGRSpatialReferenceH, const char *,
//C                                       const char * );
OGRErr  OSRImportFromDict(OGRSpatialReferenceH , char *, char *);
//C     OGRErr CPL_DLL OSRImportFromPanorama( OGRSpatialReferenceH, long, long, long,
//C                                           double * );
OGRErr  OSRImportFromPanorama(OGRSpatialReferenceH , int , int , int , double *);
//C     OGRErr CPL_DLL OSRImportFromOzi( OGRSpatialReferenceH , const char * const *);
OGRErr  OSRImportFromOzi(OGRSpatialReferenceH , char **);
//C     OGRErr CPL_DLL OSRImportFromMICoordSys( OGRSpatialReferenceH, const char *);
OGRErr  OSRImportFromMICoordSys(OGRSpatialReferenceH , char *);
//C     OGRErr CPL_DLL OSRImportFromERM( OGRSpatialReferenceH,
//C                                      const char *, const char *, const char * );
OGRErr  OSRImportFromERM(OGRSpatialReferenceH , char *, char *, char *);
//C     OGRErr CPL_DLL OSRImportFromUrl( OGRSpatialReferenceH, const char * );
OGRErr  OSRImportFromUrl(OGRSpatialReferenceH , char *);

//C     OGRErr CPL_DLL CPL_STDCALL OSRExportToWkt( OGRSpatialReferenceH, char ** );
extern (Windows):
OGRErr  OSRExportToWkt(OGRSpatialReferenceH , char **);
//C     OGRErr CPL_DLL CPL_STDCALL OSRExportToPrettyWkt( OGRSpatialReferenceH, char **, int);
OGRErr  OSRExportToPrettyWkt(OGRSpatialReferenceH , char **, int );
//C     OGRErr CPL_DLL CPL_STDCALL OSRExportToProj4( OGRSpatialReferenceH, char **);
OGRErr  OSRExportToProj4(OGRSpatialReferenceH , char **);
//C     OGRErr CPL_DLL OSRExportToPCI( OGRSpatialReferenceH, char **, char **,
//C                                    double ** );
extern (C):
OGRErr  OSRExportToPCI(OGRSpatialReferenceH , char **, char **, double **);
//C     OGRErr CPL_DLL OSRExportToUSGS( OGRSpatialReferenceH, long *, long *,
//C                                     double **, long * );
OGRErr  OSRExportToUSGS(OGRSpatialReferenceH , int *, int *, double **, int *);
//C     OGRErr CPL_DLL OSRExportToXML( OGRSpatialReferenceH, char **, const char * );
OGRErr  OSRExportToXML(OGRSpatialReferenceH , char **, char *);
//C     OGRErr CPL_DLL OSRExportToPanorama( OGRSpatialReferenceH, long *, long *,
//C                                         long *, long *, double * );
OGRErr  OSRExportToPanorama(OGRSpatialReferenceH , int *, int *, int *, int *, double *);
//C     OGRErr CPL_DLL OSRExportToMICoordSys( OGRSpatialReferenceH, char ** );
OGRErr  OSRExportToMICoordSys(OGRSpatialReferenceH , char **);
//C     OGRErr CPL_DLL OSRExportToERM( OGRSpatialReferenceH, char *, char *, char * );
OGRErr  OSRExportToERM(OGRSpatialReferenceH , char *, char *, char *);

//C     OGRErr CPL_DLL OSRMorphToESRI( OGRSpatialReferenceH );
OGRErr  OSRMorphToESRI(OGRSpatialReferenceH );
//C     OGRErr CPL_DLL OSRMorphFromESRI( OGRSpatialReferenceH );
OGRErr  OSRMorphFromESRI(OGRSpatialReferenceH );

//C     OGRErr CPL_DLL CPL_STDCALL OSRSetAttrValue( OGRSpatialReferenceH hSRS,
//C                                     const char * pszNodePath,
//C                                     const char * pszNewNodeValue );
extern (Windows):
OGRErr  OSRSetAttrValue(OGRSpatialReferenceH hSRS, char *pszNodePath, char *pszNewNodeValue);
//C     const char CPL_DLL * CPL_STDCALL OSRGetAttrValue( OGRSpatialReferenceH hSRS,
//C                                const char * pszName, int iChild /* = 0 */ );
char * OSRGetAttrValue(OGRSpatialReferenceH hSRS, char *pszName, int iChild);

//C     OGRErr CPL_DLL OSRSetAngularUnits( OGRSpatialReferenceH, const char *, double );
extern (C):
OGRErr  OSRSetAngularUnits(OGRSpatialReferenceH , char *, double );
//C     double CPL_DLL OSRGetAngularUnits( OGRSpatialReferenceH, char ** );
double  OSRGetAngularUnits(OGRSpatialReferenceH , char **);
//C     OGRErr CPL_DLL OSRSetLinearUnits( OGRSpatialReferenceH, const char *, double );
OGRErr  OSRSetLinearUnits(OGRSpatialReferenceH , char *, double );
//C     OGRErr CPL_DLL OSRSetTargetLinearUnits( OGRSpatialReferenceH, const char *, const char *, double );
OGRErr  OSRSetTargetLinearUnits(OGRSpatialReferenceH , char *, char *, double );
//C     OGRErr CPL_DLL OSRSetLinearUnitsAndUpdateParameters(
//C         OGRSpatialReferenceH, const char *, double );
OGRErr  OSRSetLinearUnitsAndUpdateParameters(OGRSpatialReferenceH , char *, double );
//C     double CPL_DLL OSRGetLinearUnits( OGRSpatialReferenceH, char ** );
double  OSRGetLinearUnits(OGRSpatialReferenceH , char **);
//C     double CPL_DLL OSRGetTargetLinearUnits( OGRSpatialReferenceH, const char *, char ** );
double  OSRGetTargetLinearUnits(OGRSpatialReferenceH , char *, char **);

//C     double CPL_DLL OSRGetPrimeMeridian( OGRSpatialReferenceH, char ** );
double  OSRGetPrimeMeridian(OGRSpatialReferenceH , char **);

//C     int CPL_DLL OSRIsGeographic( OGRSpatialReferenceH );
int  OSRIsGeographic(OGRSpatialReferenceH );
//C     int CPL_DLL OSRIsLocal( OGRSpatialReferenceH );
int  OSRIsLocal(OGRSpatialReferenceH );
//C     int CPL_DLL OSRIsProjected( OGRSpatialReferenceH );
int  OSRIsProjected(OGRSpatialReferenceH );
//C     int CPL_DLL OSRIsCompound( OGRSpatialReferenceH );
int  OSRIsCompound(OGRSpatialReferenceH );
//C     int CPL_DLL OSRIsGeocentric( OGRSpatialReferenceH );
int  OSRIsGeocentric(OGRSpatialReferenceH );
//C     int CPL_DLL OSRIsVertical( OGRSpatialReferenceH );
int  OSRIsVertical(OGRSpatialReferenceH );
//C     int CPL_DLL OSRIsSameGeogCS( OGRSpatialReferenceH, OGRSpatialReferenceH );
int  OSRIsSameGeogCS(OGRSpatialReferenceH , OGRSpatialReferenceH );
//C     int CPL_DLL OSRIsSameVertCS( OGRSpatialReferenceH, OGRSpatialReferenceH );
int  OSRIsSameVertCS(OGRSpatialReferenceH , OGRSpatialReferenceH );
//C     int CPL_DLL OSRIsSame( OGRSpatialReferenceH, OGRSpatialReferenceH );
int  OSRIsSame(OGRSpatialReferenceH , OGRSpatialReferenceH );

//C     OGRErr CPL_DLL OSRSetLocalCS( OGRSpatialReferenceH hSRS, const char *pszName );
OGRErr  OSRSetLocalCS(OGRSpatialReferenceH hSRS, char *pszName);
//C     OGRErr CPL_DLL OSRSetProjCS( OGRSpatialReferenceH hSRS, const char * pszName );
OGRErr  OSRSetProjCS(OGRSpatialReferenceH hSRS, char *pszName);
//C     OGRErr CPL_DLL OSRSetGeocCS( OGRSpatialReferenceH hSRS, const char * pszName );
OGRErr  OSRSetGeocCS(OGRSpatialReferenceH hSRS, char *pszName);
//C     OGRErr CPL_DLL OSRSetWellKnownGeogCS( OGRSpatialReferenceH hSRS,
//C                                           const char * pszName );
OGRErr  OSRSetWellKnownGeogCS(OGRSpatialReferenceH hSRS, char *pszName);
//C     OGRErr CPL_DLL CPL_STDCALL OSRSetFromUserInput( OGRSpatialReferenceH hSRS,
//C                                         const char * );
extern (Windows):
OGRErr  OSRSetFromUserInput(OGRSpatialReferenceH hSRS, char *);
//C     OGRErr CPL_DLL OSRCopyGeogCSFrom( OGRSpatialReferenceH hSRS,
//C                                       const OGRSpatialReferenceH hSrcSRS );
extern (C):
OGRErr  OSRCopyGeogCSFrom(OGRSpatialReferenceH hSRS, OGRSpatialReferenceH hSrcSRS);
//C     OGRErr CPL_DLL OSRSetTOWGS84( OGRSpatialReferenceH hSRS,
//C                                   double, double, double,
//C                                   double, double, double, double );
OGRErr  OSRSetTOWGS84(OGRSpatialReferenceH hSRS, double , double , double , double , double , double , double );
//C     OGRErr CPL_DLL OSRGetTOWGS84( OGRSpatialReferenceH hSRS, double *, int );
OGRErr  OSRGetTOWGS84(OGRSpatialReferenceH hSRS, double *, int );

//C     OGRErr CPL_DLL OSRSetCompoundCS( OGRSpatialReferenceH hSRS,
//C                                      const char *pszName,
//C                                      OGRSpatialReferenceH hHorizSRS,
//C                                      OGRSpatialReferenceH hVertSRS );
OGRErr  OSRSetCompoundCS(OGRSpatialReferenceH hSRS, char *pszName, OGRSpatialReferenceH hHorizSRS, OGRSpatialReferenceH hVertSRS);
//C     OGRErr CPL_DLL OSRSetGeogCS( OGRSpatialReferenceH hSRS,
//C                           const char * pszGeogName,
//C                           const char * pszDatumName,
//C                           const char * pszEllipsoidName,
//C                           double dfSemiMajor, double dfInvFlattening,
//C                           const char * pszPMName /* = NULL */,
//C                           double dfPMOffset /* = 0.0 */,
//C                           const char * pszUnits /* = NULL */,
//C                           double dfConvertToRadians /* = 0.0 */ );
OGRErr  OSRSetGeogCS(OGRSpatialReferenceH hSRS, char *pszGeogName, char *pszDatumName, char *pszEllipsoidName, double dfSemiMajor, double dfInvFlattening, char *pszPMName, double dfPMOffset, char *pszUnits, double dfConvertToRadians);

//C     OGRErr CPL_DLL OSRSetVertCS( OGRSpatialReferenceH hSRS,
//C                           const char * pszVertCSName,
//C                           const char * pszVertDatumName,
//C                           int nVertDatumType );
OGRErr  OSRSetVertCS(OGRSpatialReferenceH hSRS, char *pszVertCSName, char *pszVertDatumName, int nVertDatumType);

//C     double CPL_DLL OSRGetSemiMajor( OGRSpatialReferenceH, OGRErr * /* = NULL */ );
double  OSRGetSemiMajor(OGRSpatialReferenceH , OGRErr *);
//C     double CPL_DLL OSRGetSemiMinor( OGRSpatialReferenceH, OGRErr * /* = NULL */ );
double  OSRGetSemiMinor(OGRSpatialReferenceH , OGRErr *);
//C     double CPL_DLL OSRGetInvFlattening( OGRSpatialReferenceH, OGRErr * /*=NULL*/);
double  OSRGetInvFlattening(OGRSpatialReferenceH , OGRErr *);

//C     OGRErr CPL_DLL OSRSetAuthority( OGRSpatialReferenceH hSRS,
//C                              const char * pszTargetKey,
//C                              const char * pszAuthority,
//C                              int nCode );
OGRErr  OSRSetAuthority(OGRSpatialReferenceH hSRS, char *pszTargetKey, char *pszAuthority, int nCode);
//C     const char CPL_DLL *OSRGetAuthorityCode( OGRSpatialReferenceH hSRS,
//C                                              const char * pszTargetKey );
char * OSRGetAuthorityCode(OGRSpatialReferenceH hSRS, char *pszTargetKey);
//C     const char CPL_DLL *OSRGetAuthorityName( OGRSpatialReferenceH hSRS,
//C                                              const char * pszTargetKey );
char * OSRGetAuthorityName(OGRSpatialReferenceH hSRS, char *pszTargetKey);
//C     OGRErr CPL_DLL OSRSetProjection( OGRSpatialReferenceH, const char * );
OGRErr  OSRSetProjection(OGRSpatialReferenceH , char *);
//C     OGRErr CPL_DLL OSRSetProjParm( OGRSpatialReferenceH, const char *, double );
OGRErr  OSRSetProjParm(OGRSpatialReferenceH , char *, double );
//C     double CPL_DLL OSRGetProjParm( OGRSpatialReferenceH hSRS,
//C                             const char * pszParmName,
//C                             double dfDefault /* = 0.0 */,
//C                             OGRErr * /* = NULL */ );
double  OSRGetProjParm(OGRSpatialReferenceH hSRS, char *pszParmName, double dfDefault, OGRErr *);
//C     OGRErr CPL_DLL OSRSetNormProjParm( OGRSpatialReferenceH, const char *, double);
OGRErr  OSRSetNormProjParm(OGRSpatialReferenceH , char *, double );
//C     double CPL_DLL OSRGetNormProjParm( OGRSpatialReferenceH hSRS,
//C                                        const char * pszParmName,
//C                                        double dfDefault /* = 0.0 */,
//C                                        OGRErr * /* = NULL */ );
double  OSRGetNormProjParm(OGRSpatialReferenceH hSRS, char *pszParmName, double dfDefault, OGRErr *);

//C     OGRErr CPL_DLL OSRSetUTM( OGRSpatialReferenceH hSRS, int nZone, int bNorth );
OGRErr  OSRSetUTM(OGRSpatialReferenceH hSRS, int nZone, int bNorth);
//C     int    CPL_DLL OSRGetUTMZone( OGRSpatialReferenceH hSRS, int *pbNorth );
int  OSRGetUTMZone(OGRSpatialReferenceH hSRS, int *pbNorth);
//C     OGRErr CPL_DLL OSRSetStatePlane( OGRSpatialReferenceH hSRS,
//C                                      int nZone, int bNAD83 );
OGRErr  OSRSetStatePlane(OGRSpatialReferenceH hSRS, int nZone, int bNAD83);
//C     OGRErr CPL_DLL OSRSetStatePlaneWithUnits( OGRSpatialReferenceH hSRS,
//C                                               int nZone, int bNAD83,
//C                                               const char *pszOverrideUnitName,
//C                                               double dfOverrideUnit );
OGRErr  OSRSetStatePlaneWithUnits(OGRSpatialReferenceH hSRS, int nZone, int bNAD83, char *pszOverrideUnitName, double dfOverrideUnit);
//C     OGRErr CPL_DLL OSRAutoIdentifyEPSG( OGRSpatialReferenceH hSRS );
OGRErr  OSRAutoIdentifyEPSG(OGRSpatialReferenceH hSRS);

//C     int    CPL_DLL OSREPSGTreatsAsLatLong( OGRSpatialReferenceH hSRS );
int  OSREPSGTreatsAsLatLong(OGRSpatialReferenceH hSRS);
//C     int    CPL_DLL OSREPSGTreatsAsNorthingEasting( OGRSpatialReferenceH hSRS );
int  OSREPSGTreatsAsNorthingEasting(OGRSpatialReferenceH hSRS);
//C     const char CPL_DLL *OSRGetAxis( OGRSpatialReferenceH hSRS,
//C                                     const char *pszTargetKey, int iAxis,
//C                                     OGRAxisOrientation *peOrientation );
char * OSRGetAxis(OGRSpatialReferenceH hSRS, char *pszTargetKey, int iAxis, OGRAxisOrientation *peOrientation);
//C     OGRErr CPL_DLL OSRSetAxes( OGRSpatialReferenceH hSRS,
//C                                const char *pszTargetKey,
//C                                const char *pszXAxisName,
//C                                OGRAxisOrientation eXAxisOrientation,
//C                                const char *pszYAxisName,
//C                                OGRAxisOrientation eYAxisOrientation );
OGRErr  OSRSetAxes(OGRSpatialReferenceH hSRS, char *pszTargetKey, char *pszXAxisName, OGRAxisOrientation eXAxisOrientation, char *pszYAxisName, OGRAxisOrientation eYAxisOrientation);
/** Albers Conic Equal Area */
//C     OGRErr CPL_DLL OSRSetACEA( OGRSpatialReferenceH hSRS, double dfStdP1, double dfStdP2,
//C                              double dfCenterLat, double dfCenterLong,
//C                              double dfFalseEasting, double dfFalseNorthing );
OGRErr  OSRSetACEA(OGRSpatialReferenceH hSRS, double dfStdP1, double dfStdP2, double dfCenterLat, double dfCenterLong, double dfFalseEasting, double dfFalseNorthing);

/** Azimuthal Equidistant */
//C     OGRErr CPL_DLL  OSRSetAE( OGRSpatialReferenceH hSRS, double dfCenterLat, double dfCenterLong,
//C                            double dfFalseEasting, double dfFalseNorthing );
OGRErr  OSRSetAE(OGRSpatialReferenceH hSRS, double dfCenterLat, double dfCenterLong, double dfFalseEasting, double dfFalseNorthing);

/** Bonne */
//C     OGRErr CPL_DLL OSRSetBonne(OGRSpatialReferenceH hSRS,
//C                                double dfStandardParallel, double dfCentralMeridian,
//C                                double dfFalseEasting, double dfFalseNorthing );
OGRErr  OSRSetBonne(OGRSpatialReferenceH hSRS, double dfStandardParallel, double dfCentralMeridian, double dfFalseEasting, double dfFalseNorthing);

/** Cylindrical Equal Area */
//C     OGRErr CPL_DLL OSRSetCEA( OGRSpatialReferenceH hSRS, double dfStdP1, double dfCentralMeridian,
//C                             double dfFalseEasting, double dfFalseNorthing );
OGRErr  OSRSetCEA(OGRSpatialReferenceH hSRS, double dfStdP1, double dfCentralMeridian, double dfFalseEasting, double dfFalseNorthing);

/** Cassini-Soldner */
//C     OGRErr CPL_DLL OSRSetCS( OGRSpatialReferenceH hSRS, double dfCenterLat, double dfCenterLong,
//C                            double dfFalseEasting, double dfFalseNorthing );
OGRErr  OSRSetCS(OGRSpatialReferenceH hSRS, double dfCenterLat, double dfCenterLong, double dfFalseEasting, double dfFalseNorthing);

/** Equidistant Conic */
//C     OGRErr CPL_DLL OSRSetEC( OGRSpatialReferenceH hSRS, double dfStdP1, double dfStdP2,
//C                            double dfCenterLat, double dfCenterLong,
//C                            double dfFalseEasting, double dfFalseNorthing );
OGRErr  OSRSetEC(OGRSpatialReferenceH hSRS, double dfStdP1, double dfStdP2, double dfCenterLat, double dfCenterLong, double dfFalseEasting, double dfFalseNorthing);

/** Eckert I-VI */
//C     OGRErr CPL_DLL OSRSetEckert( OGRSpatialReferenceH hSRS,  int nVariation,
//C                                  double dfCentralMeridian,
//C                                  double dfFalseEasting, double dfFalseNorthing );
OGRErr  OSRSetEckert(OGRSpatialReferenceH hSRS, int nVariation, double dfCentralMeridian, double dfFalseEasting, double dfFalseNorthing);

/** Eckert IV */
//C     OGRErr CPL_DLL OSRSetEckertIV( OGRSpatialReferenceH hSRS, double dfCentralMeridian,
//C                                  double dfFalseEasting, double dfFalseNorthing );
OGRErr  OSRSetEckertIV(OGRSpatialReferenceH hSRS, double dfCentralMeridian, double dfFalseEasting, double dfFalseNorthing);

/** Eckert VI */
//C     OGRErr CPL_DLL OSRSetEckertVI( OGRSpatialReferenceH hSRS, double dfCentralMeridian,
//C                                  double dfFalseEasting, double dfFalseNorthing );
OGRErr  OSRSetEckertVI(OGRSpatialReferenceH hSRS, double dfCentralMeridian, double dfFalseEasting, double dfFalseNorthing);

/** Equirectangular */
//C     OGRErr CPL_DLL OSRSetEquirectangular(OGRSpatialReferenceH hSRS,
//C                                   double dfCenterLat, double dfCenterLong,
//C                                   double dfFalseEasting, double dfFalseNorthing );
OGRErr  OSRSetEquirectangular(OGRSpatialReferenceH hSRS, double dfCenterLat, double dfCenterLong, double dfFalseEasting, double dfFalseNorthing);

/** Equirectangular generalized form */
//C     OGRErr CPL_DLL OSRSetEquirectangular2( OGRSpatialReferenceH hSRS,
//C                                   double dfCenterLat, double dfCenterLong,
//C                                   double dfPseudoStdParallel1,
//C                                   double dfFalseEasting,
//C                                   double dfFalseNorthing );
OGRErr  OSRSetEquirectangular2(OGRSpatialReferenceH hSRS, double dfCenterLat, double dfCenterLong, double dfPseudoStdParallel1, double dfFalseEasting, double dfFalseNorthing);

/** Gall Stereograpic */
//C     OGRErr CPL_DLL OSRSetGS( OGRSpatialReferenceH hSRS, double dfCentralMeridian,
//C                            double dfFalseEasting, double dfFalseNorthing );
OGRErr  OSRSetGS(OGRSpatialReferenceH hSRS, double dfCentralMeridian, double dfFalseEasting, double dfFalseNorthing);

/** Goode Homolosine */
//C     OGRErr CPL_DLL OSRSetGH( OGRSpatialReferenceH hSRS, double dfCentralMeridian,
//C                              double dfFalseEasting, double dfFalseNorthing );
OGRErr  OSRSetGH(OGRSpatialReferenceH hSRS, double dfCentralMeridian, double dfFalseEasting, double dfFalseNorthing);

/** Interrupted Goode Homolosine */
//C     OGRErr CPL_DLL OSRSetIGH( OGRSpatialReferenceH hSRS );
OGRErr  OSRSetIGH(OGRSpatialReferenceH hSRS);

/** GEOS - Geostationary Satellite View */
//C     OGRErr CPL_DLL OSRSetGEOS( OGRSpatialReferenceH hSRS,
//C                                double dfCentralMeridian, double dfSatelliteHeight,
//C                                double dfFalseEasting, double dfFalseNorthing );
OGRErr  OSRSetGEOS(OGRSpatialReferenceH hSRS, double dfCentralMeridian, double dfSatelliteHeight, double dfFalseEasting, double dfFalseNorthing);

/** Gauss Schreiber Transverse Mercator */
//C     OGRErr CPL_DLL OSRSetGaussSchreiberTMercator( OGRSpatialReferenceH hSRS,
//C                                       double dfCenterLat, double dfCenterLong,
//C                                       double dfScale,
//C                                       double dfFalseEasting,
//C                                       double dfFalseNorthing );
OGRErr  OSRSetGaussSchreiberTMercator(OGRSpatialReferenceH hSRS, double dfCenterLat, double dfCenterLong, double dfScale, double dfFalseEasting, double dfFalseNorthing);
/** Gnomonic */
//C     OGRErr CPL_DLL OSRSetGnomonic(OGRSpatialReferenceH hSRS,
//C                                   double dfCenterLat, double dfCenterLong,
//C                                 double dfFalseEasting, double dfFalseNorthing );
OGRErr  OSRSetGnomonic(OGRSpatialReferenceH hSRS, double dfCenterLat, double dfCenterLong, double dfFalseEasting, double dfFalseNorthing);

/** Oblique Mercator (aka HOM (variant B) */
//C     OGRErr CPL_DLL OSRSetOM( OGRSpatialReferenceH hSRS,
//C                              double dfCenterLat, double dfCenterLong,
//C                              double dfAzimuth, double dfRectToSkew,
//C                              double dfScale,
//C                              double dfFalseEasting, double dfFalseNorthing );
OGRErr  OSRSetOM(OGRSpatialReferenceH hSRS, double dfCenterLat, double dfCenterLong, double dfAzimuth, double dfRectToSkew, double dfScale, double dfFalseEasting, double dfFalseNorthing);

/** Hotine Oblique Mercator using azimuth angle */
//C     OGRErr CPL_DLL OSRSetHOM( OGRSpatialReferenceH hSRS,
//C                               double dfCenterLat, double dfCenterLong,
//C                               double dfAzimuth, double dfRectToSkew,
//C                               double dfScale,
//C                               double dfFalseEasting, double dfFalseNorthing );
OGRErr  OSRSetHOM(OGRSpatialReferenceH hSRS, double dfCenterLat, double dfCenterLong, double dfAzimuth, double dfRectToSkew, double dfScale, double dfFalseEasting, double dfFalseNorthing);

//C     OGRErr CPL_DLL OSRSetHOMAC( OGRSpatialReferenceH hSRS,
//C                         double dfCenterLat, double dfCenterLong,
//C                         double dfAzimuth, double dfRectToSkew,
//C                         double dfScale,
//C                         double dfFalseEasting,
//C                         double dfFalseNorthing );
OGRErr  OSRSetHOMAC(OGRSpatialReferenceH hSRS, double dfCenterLat, double dfCenterLong, double dfAzimuth, double dfRectToSkew, double dfScale, double dfFalseEasting, double dfFalseNorthing);

/** Hotine Oblique Mercator using two points on centerline */
//C     OGRErr CPL_DLL OSRSetHOM2PNO( OGRSpatialReferenceH hSRS, double dfCenterLat,
//C                                   double dfLat1, double dfLong1,
//C                                   double dfLat2, double dfLong2,
//C                                   double dfScale,
//C                                   double dfFalseEasting, double dfFalseNorthing );
OGRErr  OSRSetHOM2PNO(OGRSpatialReferenceH hSRS, double dfCenterLat, double dfLat1, double dfLong1, double dfLat2, double dfLong2, double dfScale, double dfFalseEasting, double dfFalseNorthing);

/** International Map of the World Polyconic */
//C     OGRErr CPL_DLL OSRSetIWMPolyconic( OGRSpatialReferenceH hSRS,
//C                                        double dfLat1, double dfLat2,
//C                                        double dfCenterLong,
//C                                        double dfFalseEasting,
//C                                        double dfFalseNorthing );
OGRErr  OSRSetIWMPolyconic(OGRSpatialReferenceH hSRS, double dfLat1, double dfLat2, double dfCenterLong, double dfFalseEasting, double dfFalseNorthing);

/** Krovak Oblique Conic Conformal */
//C     OGRErr CPL_DLL OSRSetKrovak( OGRSpatialReferenceH hSRS,
//C                                  double dfCenterLat, double dfCenterLong,
//C                                  double dfAzimuth, double dfPseudoStdParallelLat,
//C                                  double dfScale,
//C                                  double dfFalseEasting, double dfFalseNorthing );
OGRErr  OSRSetKrovak(OGRSpatialReferenceH hSRS, double dfCenterLat, double dfCenterLong, double dfAzimuth, double dfPseudoStdParallelLat, double dfScale, double dfFalseEasting, double dfFalseNorthing);

/** Lambert Azimuthal Equal-Area */
//C     OGRErr CPL_DLL OSRSetLAEA( OGRSpatialReferenceH hSRS,
//C                                double dfCenterLat, double dfCenterLong,
//C                                double dfFalseEasting, double dfFalseNorthing );
OGRErr  OSRSetLAEA(OGRSpatialReferenceH hSRS, double dfCenterLat, double dfCenterLong, double dfFalseEasting, double dfFalseNorthing);

/** Lambert Conformal Conic */
//C     OGRErr CPL_DLL OSRSetLCC( OGRSpatialReferenceH hSRS,
//C                               double dfStdP1, double dfStdP2,
//C                               double dfCenterLat, double dfCenterLong,
//C                               double dfFalseEasting, double dfFalseNorthing );
OGRErr  OSRSetLCC(OGRSpatialReferenceH hSRS, double dfStdP1, double dfStdP2, double dfCenterLat, double dfCenterLong, double dfFalseEasting, double dfFalseNorthing);

/** Lambert Conformal Conic 1SP */
//C     OGRErr CPL_DLL OSRSetLCC1SP( OGRSpatialReferenceH hSRS,
//C                                  double dfCenterLat, double dfCenterLong,
//C                                  double dfScale,
//C                                  double dfFalseEasting, double dfFalseNorthing );
OGRErr  OSRSetLCC1SP(OGRSpatialReferenceH hSRS, double dfCenterLat, double dfCenterLong, double dfScale, double dfFalseEasting, double dfFalseNorthing);

/** Lambert Conformal Conic (Belgium) */
//C     OGRErr CPL_DLL OSRSetLCCB( OGRSpatialReferenceH hSRS,
//C                                double dfStdP1, double dfStdP2,
//C                                double dfCenterLat, double dfCenterLong,
//C                                double dfFalseEasting, double dfFalseNorthing );
OGRErr  OSRSetLCCB(OGRSpatialReferenceH hSRS, double dfStdP1, double dfStdP2, double dfCenterLat, double dfCenterLong, double dfFalseEasting, double dfFalseNorthing);

/** Miller Cylindrical */
//C     OGRErr CPL_DLL OSRSetMC( OGRSpatialReferenceH hSRS,
//C                              double dfCenterLat, double dfCenterLong,
//C                              double dfFalseEasting, double dfFalseNorthing );
OGRErr  OSRSetMC(OGRSpatialReferenceH hSRS, double dfCenterLat, double dfCenterLong, double dfFalseEasting, double dfFalseNorthing);

/** Mercator */
//C     OGRErr CPL_DLL OSRSetMercator( OGRSpatialReferenceH hSRS,
//C                                    double dfCenterLat, double dfCenterLong,
//C                                    double dfScale,
//C                                    double dfFalseEasting, double dfFalseNorthing );
OGRErr  OSRSetMercator(OGRSpatialReferenceH hSRS, double dfCenterLat, double dfCenterLong, double dfScale, double dfFalseEasting, double dfFalseNorthing);
//C     OGRErr CPL_DLL OSRSetMercator2SP( OGRSpatialReferenceH hSRS,
//C                               double dfStdP1,
//C                               double dfCenterLat, double dfCenterLong,
//C                               double dfFalseEasting, double dfFalseNorthing );
OGRErr  OSRSetMercator2SP(OGRSpatialReferenceH hSRS, double dfStdP1, double dfCenterLat, double dfCenterLong, double dfFalseEasting, double dfFalseNorthing);

/** Mollweide */
//C     OGRErr CPL_DLL  OSRSetMollweide( OGRSpatialReferenceH hSRS,
//C                                      double dfCentralMeridian,
//C                                      double dfFalseEasting,
//C                                      double dfFalseNorthing );
OGRErr  OSRSetMollweide(OGRSpatialReferenceH hSRS, double dfCentralMeridian, double dfFalseEasting, double dfFalseNorthing);

/** New Zealand Map Grid */
//C     OGRErr CPL_DLL OSRSetNZMG( OGRSpatialReferenceH hSRS,
//C                                double dfCenterLat, double dfCenterLong,
//C                                double dfFalseEasting, double dfFalseNorthing );
OGRErr  OSRSetNZMG(OGRSpatialReferenceH hSRS, double dfCenterLat, double dfCenterLong, double dfFalseEasting, double dfFalseNorthing);

/** Oblique Stereographic */
//C     OGRErr CPL_DLL OSRSetOS( OGRSpatialReferenceH hSRS,
//C                              double dfOriginLat, double dfCMeridian,
//C                              double dfScale,
//C                              double dfFalseEasting,double dfFalseNorthing);
OGRErr  OSRSetOS(OGRSpatialReferenceH hSRS, double dfOriginLat, double dfCMeridian, double dfScale, double dfFalseEasting, double dfFalseNorthing);

/** Orthographic */
//C     OGRErr CPL_DLL OSRSetOrthographic( OGRSpatialReferenceH hSRS,
//C                                        double dfCenterLat, double dfCenterLong,
//C                                        double dfFalseEasting,
//C                                        double dfFalseNorthing);
OGRErr  OSRSetOrthographic(OGRSpatialReferenceH hSRS, double dfCenterLat, double dfCenterLong, double dfFalseEasting, double dfFalseNorthing);

/** Polyconic */
//C     OGRErr CPL_DLL OSRSetPolyconic( OGRSpatialReferenceH hSRS,
//C                                     double dfCenterLat, double dfCenterLong,
//C                                     double dfFalseEasting, double dfFalseNorthing );
OGRErr  OSRSetPolyconic(OGRSpatialReferenceH hSRS, double dfCenterLat, double dfCenterLong, double dfFalseEasting, double dfFalseNorthing);

/** Polar Stereographic */
//C     OGRErr CPL_DLL OSRSetPS( OGRSpatialReferenceH hSRS,
//C                              double dfCenterLat, double dfCenterLong,
//C                              double dfScale,
//C                              double dfFalseEasting, double dfFalseNorthing);
OGRErr  OSRSetPS(OGRSpatialReferenceH hSRS, double dfCenterLat, double dfCenterLong, double dfScale, double dfFalseEasting, double dfFalseNorthing);

/** Robinson */
//C     OGRErr CPL_DLL OSRSetRobinson( OGRSpatialReferenceH hSRS,
//C                                    double dfCenterLong,
//C                                    double dfFalseEasting, double dfFalseNorthing );
OGRErr  OSRSetRobinson(OGRSpatialReferenceH hSRS, double dfCenterLong, double dfFalseEasting, double dfFalseNorthing);

/** Sinusoidal */
//C     OGRErr CPL_DLL OSRSetSinusoidal( OGRSpatialReferenceH hSRS,
//C                                      double dfCenterLong,
//C                                      double dfFalseEasting,
//C                                      double dfFalseNorthing );
OGRErr  OSRSetSinusoidal(OGRSpatialReferenceH hSRS, double dfCenterLong, double dfFalseEasting, double dfFalseNorthing);

/** Stereographic */
//C     OGRErr CPL_DLL OSRSetStereographic( OGRSpatialReferenceH hSRS,
//C                                         double dfCenterLat, double dfCenterLong,
//C                                         double dfScale,
//C                                         double dfFalseEasting,
//C                                         double dfFalseNorthing);
OGRErr  OSRSetStereographic(OGRSpatialReferenceH hSRS, double dfCenterLat, double dfCenterLong, double dfScale, double dfFalseEasting, double dfFalseNorthing);

/** Swiss Oblique Cylindrical */
//C     OGRErr CPL_DLL OSRSetSOC( OGRSpatialReferenceH hSRS,
//C                               double dfLatitudeOfOrigin, double dfCentralMeridian,
//C                               double dfFalseEasting, double dfFalseNorthing );
OGRErr  OSRSetSOC(OGRSpatialReferenceH hSRS, double dfLatitudeOfOrigin, double dfCentralMeridian, double dfFalseEasting, double dfFalseNorthing);

/** Transverse Mercator
 *
 * Special processing available for Transverse Mercator with GDAL &gt;= 1.10 and PROJ &gt;= 4.8 :
 * see OGRSpatialReference::exportToProj4().
 */

//C     OGRErr CPL_DLL OSRSetTM( OGRSpatialReferenceH hSRS,
//C                              double dfCenterLat, double dfCenterLong,
//C                              double dfScale,
//C                              double dfFalseEasting, double dfFalseNorthing );
OGRErr  OSRSetTM(OGRSpatialReferenceH hSRS, double dfCenterLat, double dfCenterLong, double dfScale, double dfFalseEasting, double dfFalseNorthing);

/** Transverse Mercator variant */
//C     OGRErr CPL_DLL OSRSetTMVariant(
//C         OGRSpatialReferenceH hSRS, const char *pszVariantName,
//C         double dfCenterLat, double dfCenterLong,
//C         double dfScale,
//C         double dfFalseEasting, double dfFalseNorthing );
OGRErr  OSRSetTMVariant(OGRSpatialReferenceH hSRS, char *pszVariantName, double dfCenterLat, double dfCenterLong, double dfScale, double dfFalseEasting, double dfFalseNorthing);

/** Tunesia Mining Grid  */
//C     OGRErr CPL_DLL OSRSetTMG( OGRSpatialReferenceH hSRS,
//C                               double dfCenterLat, double dfCenterLong,
//C                              double dfFalseEasting, double dfFalseNorthing );
OGRErr  OSRSetTMG(OGRSpatialReferenceH hSRS, double dfCenterLat, double dfCenterLong, double dfFalseEasting, double dfFalseNorthing);

/** Transverse Mercator (South Oriented) */
//C     OGRErr CPL_DLL OSRSetTMSO( OGRSpatialReferenceH hSRS,
//C                                double dfCenterLat, double dfCenterLong,
//C                                double dfScale,
//C                                double dfFalseEasting, double dfFalseNorthing );
OGRErr  OSRSetTMSO(OGRSpatialReferenceH hSRS, double dfCenterLat, double dfCenterLong, double dfScale, double dfFalseEasting, double dfFalseNorthing);

//C     OGRErr CPL_DLL OSRSetTPED( OGRSpatialReferenceH hSRS,
//C                        double dfLat1, double dfLong1,
//C                        double dfLat2, double dfLong2,
//C                        double dfFalseEasting, double dfFalseNorthing );
OGRErr  OSRSetTPED(OGRSpatialReferenceH hSRS, double dfLat1, double dfLong1, double dfLat2, double dfLong2, double dfFalseEasting, double dfFalseNorthing);

/** VanDerGrinten */
//C     OGRErr CPL_DLL OSRSetVDG( OGRSpatialReferenceH hSRS,
//C                               double dfCenterLong,
//C                               double dfFalseEasting, double dfFalseNorthing );
OGRErr  OSRSetVDG(OGRSpatialReferenceH hSRS, double dfCenterLong, double dfFalseEasting, double dfFalseNorthing);

/** Wagner I -- VII */
//C     OGRErr CPL_DLL OSRSetWagner( OGRSpatialReferenceH hSRS, int nVariation,
//C                                  double dfCenterLat,
//C                                  double dfFalseEasting,
//C                                  double dfFalseNorthing );
OGRErr  OSRSetWagner(OGRSpatialReferenceH hSRS, int nVariation, double dfCenterLat, double dfFalseEasting, double dfFalseNorthing);

/** Quadrilateralized Spherical Cube */
//C     OGRErr CPL_DLL OSRSetQSC( OGRSpatialReferenceH hSRS,
//C                                   double dfCenterLat, double dfCenterLong );
OGRErr  OSRSetQSC(OGRSpatialReferenceH hSRS, double dfCenterLat, double dfCenterLong);

/** Spherical, Cross-track, Height */
//C     OGRErr CPL_DLL OSRSetSCH( OGRSpatialReferenceH hSRS,
//C                                   double dfPegLat, double dfPegLong,
//C                                   double dfPegHeading, double dfPegHgt);
OGRErr  OSRSetSCH(OGRSpatialReferenceH hSRS, double dfPegLat, double dfPegLong, double dfPegHeading, double dfPegHgt);


//C     double CPL_DLL OSRCalcInvFlattening( double dfSemiMajor, double dfSemiMinor );
double  OSRCalcInvFlattening(double dfSemiMajor, double dfSemiMinor);
//C     double CPL_DLL OSRCalcSemiMinorFromInvFlattening( double dfSemiMajor, double dfInvFlattening );
double  OSRCalcSemiMinorFromInvFlattening(double dfSemiMajor, double dfInvFlattening);

//C     void CPL_DLL OSRCleanup( void );
void  OSRCleanup();

/* -------------------------------------------------------------------- */
/*      OGRCoordinateTransform C API.                                   */
/* -------------------------------------------------------------------- */
//C     OGRCoordinateTransformationH CPL_DLL CPL_STDCALL
//C     OCTNewCoordinateTransformation( OGRSpatialReferenceH hSourceSRS,
//C                                     OGRSpatialReferenceH hTargetSRS );
extern (Windows):
OGRCoordinateTransformationH  OCTNewCoordinateTransformation(OGRSpatialReferenceH hSourceSRS, OGRSpatialReferenceH hTargetSRS);
//C     void CPL_DLL CPL_STDCALL
//C           OCTDestroyCoordinateTransformation( OGRCoordinateTransformationH );
void  OCTDestroyCoordinateTransformation(OGRCoordinateTransformationH );

//C     int CPL_DLL CPL_STDCALL
//C     OCTTransform( OGRCoordinateTransformationH hCT,
//C                   int nCount, double *x, double *y, double *z );
int  OCTTransform(OGRCoordinateTransformationH hCT, int nCount, double *x, double *y, double *z);

//C     int CPL_DLL CPL_STDCALL
//C     OCTTransformEx( OGRCoordinateTransformationH hCT,
//C                     int nCount, double *x, double *y, double *z,
//C                     int *pabSuccess );
int  OCTTransformEx(OGRCoordinateTransformationH hCT, int nCount, double *x, double *y, double *z, int *pabSuccess);

/* this is really private to OGR. */
//C     char *OCTProj4Normalize( const char *pszProj4Src );
extern (C):
char * OCTProj4Normalize(char *pszProj4Src);

//C     void OCTCleanupProjMutex( void );
void  OCTCleanupProjMutex();

/* -------------------------------------------------------------------- */
/*      Projection transform dictionary query.                          */
/* -------------------------------------------------------------------- */

//C     char CPL_DLL ** OPTGetProjectionMethods( void );
char ** OPTGetProjectionMethods();
//C     char CPL_DLL ** OPTGetParameterList( const char * pszProjectionMethod,
//C                                  char ** ppszUserName );
char ** OPTGetParameterList(char *pszProjectionMethod, char **ppszUserName);
//C     int CPL_DLL OPTGetParameterInfo( const char * pszProjectionMethod,
//C                                      const char * pszParameterName,
//C                                      char ** ppszUserName,
//C                                      char ** ppszType,
//C                                      double *pdfDefaultValue );
int  OPTGetParameterInfo(char *pszProjectionMethod, char *pszParameterName, char **ppszUserName, char **ppszType, double *pdfDefaultValue);

//C     CPL_C_END

//C     #endif /* ndef SWIG */

//C     #endif /* ndef OGR_SRS_API_H_INCLUDED */
