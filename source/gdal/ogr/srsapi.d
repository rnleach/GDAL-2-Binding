/* Converted to D from C:/devLibs/gdal21/include/ogr_srs_api.h by htod */
module gdal.ogr.srsapi;
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
import gdal.ogr.core;

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
enum
{
    OAO_Other = 0,
    OAO_North = 1,
    OAO_South = 2,
    OAO_East = 3,
    OAO_West = 4,
    OAO_Up = 5,
    OAO_Down = 6,
}
extern (C):
alias int OGRAxisOrientation;

const(char)* OSRAxisEnumToName(OGRAxisOrientation eOrientation);

/* -------------------------------------------------------------------- */
/*      Datum types (corresponds to CS_DatumType).                      */
/* -------------------------------------------------------------------- */

enum
{
    ODT_HD_Min = 1000,
    ODT_HD_Other = 1000,
    ODT_HD_Classic = 1001,
    ODT_HD_Geocentric = 1002,
    ODT_HD_Max = 1999,
    ODT_VD_Min = 2000,
    ODT_VD_Other = 2000,
    ODT_VD_Orthometric = 2001,
    ODT_VD_Ellipsoidal = 2002,
    ODT_VD_AltitudeBarometric = 2003,
    ODT_VD_Normal = 2004,
    ODT_VD_GeoidModelDerived = 2005,
    ODT_VD_Depth = 2006,
    ODT_VD_Max = 2999,
    ODT_LD_Min = 10000,
    ODT_LD_Max = 32767,
}
alias int OGRDatumType;

/* ==================================================================== */
/*      Some standard WKT geographic coordinate systems.                */
/* ==================================================================== */

enum SRS_WKT_WGS84 = "GEOGCS[\"WGS 84\",DATUM[\"WGS_1984\",SPHEROID[\"WGS 84\",6378137,298.257223563,AUTHORITY[\"EPSG\",\"7030\"]],AUTHORITY[\"EPSG\",\"6326\"]],PRIMEM[\"Greenwich\",0,AUTHORITY[\"EPSG\",\"8901\"]],UNIT[\"degree\",0.0174532925199433,AUTHORITY[\"EPSG\",\"9122\"]],AUTHORITY[\"EPSG\",\"4326\"]]";

/* ==================================================================== */
/*      Some "standard" strings.                                        */
/* ==================================================================== */

enum SRS_PT_ALBERS_CONIC_EQUAL_AREA = "Albers_Conic_Equal_Area";
enum SRS_PT_AZIMUTHAL_EQUIDISTANT = "Azimuthal_Equidistant";
enum SRS_PT_CASSINI_SOLDNER = "Cassini_Soldner";
enum SRS_PT_CYLINDRICAL_EQUAL_AREA = "Cylindrical_Equal_Area";
enum SRS_PT_BONNE = "Bonne";
enum SRS_PT_ECKERT_I = "Eckert_I";
enum SRS_PT_ECKERT_II = "Eckert_II";
enum SRS_PT_ECKERT_III = "Eckert_III";
enum SRS_PT_ECKERT_IV = "Eckert_IV";
enum SRS_PT_ECKERT_V = "Eckert_V";
enum SRS_PT_ECKERT_VI = "Eckert_VI";
enum SRS_PT_EQUIDISTANT_CONIC = "Equidistant_Conic";
enum SRS_PT_EQUIRECTANGULAR = "Equirectangular";
enum SRS_PT_GALL_STEREOGRAPHIC = "Gall_Stereographic";
enum SRS_PT_GAUSSSCHREIBERTMERCATOR = "Gauss_Schreiber_Transverse_Mercator";
enum SRS_PT_GEOSTATIONARY_SATELLITE = "Geostationary_Satellite";
enum SRS_PT_GOODE_HOMOLOSINE = "Goode_Homolosine";
enum SRS_PT_IGH = "Interrupted_Goode_Homolosine";
enum SRS_PT_GNOMONIC = "Gnomonic";
enum SRS_PT_HOTINE_OBLIQUE_MERCATOR_AZIMUTH_CENTER = "Hotine_Oblique_Mercator_Azimuth_Center";
enum SRS_PT_HOTINE_OBLIQUE_MERCATOR = "Hotine_Oblique_Mercator";
enum SRS_PT_HOTINE_OBLIQUE_MERCATOR_TWO_POINT_NATURAL_ORIGIN = "Hotine_Oblique_Mercator_Two_Point_Natural_Origin";
enum SRS_PT_LABORDE_OBLIQUE_MERCATOR = "Laborde_Oblique_Mercator";
enum SRS_PT_LAMBERT_CONFORMAL_CONIC_1SP = "Lambert_Conformal_Conic_1SP";
enum SRS_PT_LAMBERT_CONFORMAL_CONIC_2SP = "Lambert_Conformal_Conic_2SP";
enum SRS_PT_LAMBERT_CONFORMAL_CONIC_2SP_BELGIUM = "Lambert_Conformal_Conic_2SP_Belgium";
enum SRS_PT_LAMBERT_AZIMUTHAL_EQUAL_AREA = "Lambert_Azimuthal_Equal_Area";
enum SRS_PT_MERCATOR_1SP = "Mercator_1SP";
enum SRS_PT_MERCATOR_2SP = "Mercator_2SP";
// Mercator_Auxiliary_Sphere is used used by ESRI to mean EPSG:3875
enum SRS_PT_MERCATOR_AUXILIARY_SPHERE = "Mercator_Auxiliary_Sphere";
enum SRS_PT_MILLER_CYLINDRICAL = "Miller_Cylindrical";
enum SRS_PT_MOLLWEIDE = "Mollweide";
enum SRS_PT_NEW_ZEALAND_MAP_GRID = "New_Zealand_Map_Grid";
enum SRS_PT_OBLIQUE_STEREOGRAPHIC = "Oblique_Stereographic";
enum SRS_PT_ORTHOGRAPHIC = "Orthographic";
enum SRS_PT_POLAR_STEREOGRAPHIC = "Polar_Stereographic";
enum SRS_PT_POLYCONIC = "Polyconic";
enum SRS_PT_ROBINSON = "Robinson";
enum SRS_PT_SINUSOIDAL = "Sinusoidal";
enum SRS_PT_STEREOGRAPHIC = "Stereographic";
enum SRS_PT_SWISS_OBLIQUE_CYLINDRICAL = "Swiss_Oblique_Cylindrical";
enum SRS_PT_TRANSVERSE_MERCATOR = "Transverse_Mercator";
enum SRS_PT_TRANSVERSE_MERCATOR_SOUTH_ORIENTED = "Transverse_Mercator_South_Orientated";

/* special mapinfo variants on Transverse Mercator */
enum SRS_PT_TRANSVERSE_MERCATOR_MI_21 = "Transverse_Mercator_MapInfo_21";
enum SRS_PT_TRANSVERSE_MERCATOR_MI_22 = "Transverse_Mercator_MapInfo_22";
enum SRS_PT_TRANSVERSE_MERCATOR_MI_23 = "Transverse_Mercator_MapInfo_23";
enum SRS_PT_TRANSVERSE_MERCATOR_MI_24 = "Transverse_Mercator_MapInfo_24";
enum SRS_PT_TRANSVERSE_MERCATOR_MI_25 = "Transverse_Mercator_MapInfo_25";

enum SRS_PT_TUNISIA_MINING_GRID = "Tunisia_Mining_Grid";
enum SRS_PT_TWO_POINT_EQUIDISTANT = "Two_Point_Equidistant";
enum SRS_PT_VANDERGRINTEN = "VanDerGrinten";
enum SRS_PT_KROVAK = "Krovak";
enum SRS_PT_IMW_POLYCONIC = "International_Map_of_the_World_Polyconic";
enum SRS_PT_WAGNER_I = "Wagner_I";
enum SRS_PT_WAGNER_II = "Wagner_II";
enum SRS_PT_WAGNER_III = "Wagner_III";
enum SRS_PT_WAGNER_IV = "Wagner_IV";
enum SRS_PT_WAGNER_V = "Wagner_V";
enum SRS_PT_WAGNER_VI = "Wagner_VI";
enum SRS_PT_WAGNER_VII = "Wagner_VII";
enum SRS_PT_QSC = "Quadrilateralized_Spherical_Cube";
enum SRS_PT_AITOFF = "Aitoff";
enum SRS_PT_WINKEL_I = "Winkel_I";
enum SRS_PT_WINKEL_II = "Winkel_II";
enum SRS_PT_WINKEL_TRIPEL = "Winkel_Tripel";
enum SRS_PT_CRASTER_PARABOLIC = "Craster_Parabolic";
enum SRS_PT_LOXIMUTHAL = "Loximuthal";
enum SRS_PT_QUARTIC_AUTHALIC = "Quartic_Authalic";
enum SRS_PT_SCH = "Spherical_Cross_Track_Height";

enum SRS_PP_CENTRAL_MERIDIAN = "central_meridian";
enum SRS_PP_SCALE_FACTOR = "scale_factor";
enum SRS_PP_STANDARD_PARALLEL_1 = "standard_parallel_1";
enum SRS_PP_STANDARD_PARALLEL_2 = "standard_parallel_2";
enum SRS_PP_PSEUDO_STD_PARALLEL_1 = "pseudo_standard_parallel_1";
enum SRS_PP_LONGITUDE_OF_CENTER = "longitude_of_center";
enum SRS_PP_LATITUDE_OF_CENTER = "latitude_of_center";
enum SRS_PP_LONGITUDE_OF_ORIGIN = "longitude_of_origin";
enum SRS_PP_LATITUDE_OF_ORIGIN = "latitude_of_origin";
enum SRS_PP_FALSE_EASTING = "false_easting";
enum SRS_PP_FALSE_NORTHING = "false_northing";
enum SRS_PP_AZIMUTH = "azimuth";
enum SRS_PP_LONGITUDE_OF_POINT_1 = "longitude_of_point_1";
enum SRS_PP_LATITUDE_OF_POINT_1 = "latitude_of_point_1";
enum SRS_PP_LONGITUDE_OF_POINT_2 = "longitude_of_point_2";
enum SRS_PP_LATITUDE_OF_POINT_2 = "latitude_of_point_2";
enum SRS_PP_LONGITUDE_OF_POINT_3 = "longitude_of_point_3";
enum SRS_PP_LATITUDE_OF_POINT_3 = "latitude_of_point_3";
enum SRS_PP_RECTIFIED_GRID_ANGLE = "rectified_grid_angle";
enum SRS_PP_LANDSAT_NUMBER = "landsat_number";
enum SRS_PP_PATH_NUMBER = "path_number";
enum SRS_PP_PERSPECTIVE_POINT_HEIGHT = "perspective_point_height";
enum SRS_PP_SATELLITE_HEIGHT = "satellite_height";
enum SRS_PP_FIPSZONE = "fipszone";
enum SRS_PP_ZONE = "zone";
enum SRS_PP_LATITUDE_OF_1ST_POINT = "Latitude_Of_1st_Point";
enum SRS_PP_LONGITUDE_OF_1ST_POINT = "Longitude_Of_1st_Point";
enum SRS_PP_LATITUDE_OF_2ND_POINT = "Latitude_Of_2nd_Point";
enum SRS_PP_LONGITUDE_OF_2ND_POINT = "Longitude_Of_2nd_Point";
enum SRS_PP_PEG_POINT_LATITUDE = "peg_point_latitude";
enum SRS_PP_PEG_POINT_LONGITUDE = "peg_point_longitude";
enum SRS_PP_PEG_POINT_HEADING = "peg_point_heading";
enum SRS_PP_PEG_POINT_HEIGHT = "peg_point_height";

enum SRS_UL_METER = "Meter";
enum SRS_UL_FOOT = "Foot (International)"; /* or just "FOOT"? */
enum SRS_UL_FOOT_CONV = "0.3048";
enum SRS_UL_US_FOOT = "Foot_US"; /* or "US survey foot" from EPSG */
enum SRS_UL_US_FOOT_CONV = "0.3048006096012192";
enum SRS_UL_NAUTICAL_MILE = "Nautical Mile";
enum SRS_UL_NAUTICAL_MILE_CONV = "1852.0";
enum SRS_UL_LINK = "Link";          /* Based on US Foot */
enum SRS_UL_LINK_CONV = "0.20116684023368047";
enum SRS_UL_CHAIN = "Chain";         /* based on US Foot */
enum SRS_UL_CHAIN_CONV = "20.116684023368047";
enum SRS_UL_ROD = "Rod";           /* based on US Foot */
enum SRS_UL_ROD_CONV = "5.02921005842012";
enum SRS_UL_LINK_Clarke = "Link_Clarke";
enum SRS_UL_LINK_Clarke_CONV = "0.2011661949";

enum SRS_UL_KILOMETER = "Kilometer";
enum SRS_UL_KILOMETER_CONV = "1000.";
enum SRS_UL_DECIMETER = "Decimeter";
enum SRS_UL_DECIMETER_CONV = "0.1";
enum SRS_UL_CENTIMETER = "Centimeter";
enum SRS_UL_CENTIMETER_CONV = "0.01";
enum SRS_UL_MILLIMETER = "Millimeter";
enum SRS_UL_MILLIMETER_CONV = "0.001";
enum SRS_UL_INTL_NAUT_MILE = "Nautical_Mile_International";
enum SRS_UL_INTL_NAUT_MILE_CONV = "1852.0";
enum SRS_UL_INTL_INCH = "Inch_International";
enum SRS_UL_INTL_INCH_CONV = "0.0254";
enum SRS_UL_INTL_FOOT = "Foot_International";
enum SRS_UL_INTL_FOOT_CONV = "0.3048";
enum SRS_UL_INTL_YARD = "Yard_International";
enum SRS_UL_INTL_YARD_CONV = "0.9144";
enum SRS_UL_INTL_STAT_MILE = "Statute_Mile_International";
enum SRS_UL_INTL_STAT_MILE_CONV = "1609.344";
enum SRS_UL_INTL_FATHOM = "Fathom_International";
enum SRS_UL_INTL_FATHOM_CONV = "1.8288";
enum SRS_UL_INTL_CHAIN = "Chain_International";
enum SRS_UL_INTL_CHAIN_CONV = "20.1168";
enum SRS_UL_INTL_LINK = "Link_International";
enum SRS_UL_INTL_LINK_CONV = "0.201168";
enum SRS_UL_US_INCH = "Inch_US_Surveyor";
enum SRS_UL_US_INCH_CONV = "0.025400050800101603";
enum SRS_UL_US_YARD = "Yard_US_Surveyor";
enum SRS_UL_US_YARD_CONV = "0.914401828803658";
enum SRS_UL_US_CHAIN = "Chain_US_Surveyor";
enum SRS_UL_US_CHAIN_CONV = "20.11684023368047";
enum SRS_UL_US_STAT_MILE = "Statute_Mile_US_Surveyor";
enum SRS_UL_US_STAT_MILE_CONV = "1609.347218694437";
enum SRS_UL_INDIAN_YARD = "Yard_Indian";
enum SRS_UL_INDIAN_YARD_CONV = "0.91439523";
enum SRS_UL_INDIAN_FOOT = "Foot_Indian";
enum SRS_UL_INDIAN_FOOT_CONV = "0.30479841";
enum SRS_UL_INDIAN_CHAIN = "Chain_Indian";
enum SRS_UL_INDIAN_CHAIN_CONV = "20.11669506";

enum SRS_UA_DEGREE = "degree";
enum SRS_UA_DEGREE_CONV = "0.0174532925199433";
enum SRS_UA_RADIAN = "radian";

enum SRS_PM_GREENWICH = "Greenwich";

enum SRS_DN_NAD27 = "North_American_Datum_1927";
enum SRS_DN_NAD83 = "North_American_Datum_1983";
enum SRS_DN_WGS72 = "WGS_1972";
enum SRS_DN_WGS84 = "WGS_1984";

enum SRS_WGS84_SEMIMAJOR = 6378137.0;
enum SRS_WGS84_INVFLATTENING = 298.257223563;
/* -------------------------------------------------------------------- */
/*      C Wrappers for C++ objects and methods.                         */
/* -------------------------------------------------------------------- */
alias void *OGRSpatialReferenceH;
alias void *OGRCoordinateTransformationH;

extern (Windows):
OGRSpatialReferenceH  OSRNewSpatialReference(const(char) *);
OGRSpatialReferenceH  OSRCloneGeogCS(OGRSpatialReferenceH );
OGRSpatialReferenceH  OSRClone(OGRSpatialReferenceH );
void  OSRDestroySpatialReference(OGRSpatialReferenceH );

extern (C):
int  OSRReference(OGRSpatialReferenceH );
int  OSRDereference(OGRSpatialReferenceH );
void  OSRRelease(OGRSpatialReferenceH );

OGRErr  OSRValidate(OGRSpatialReferenceH );
OGRErr  OSRFixupOrdering(OGRSpatialReferenceH );
OGRErr  OSRFixup(OGRSpatialReferenceH );
OGRErr  OSRStripCTParms(OGRSpatialReferenceH );

extern (Windows):
OGRErr  OSRImportFromEPSG(OGRSpatialReferenceH , int );
OGRErr  OSRImportFromEPSGA(OGRSpatialReferenceH , int );
extern (C):
OGRErr  OSRImportFromWkt(OGRSpatialReferenceH , char **);
OGRErr  OSRImportFromProj4(OGRSpatialReferenceH , const(char) *);
OGRErr  OSRImportFromESRI(OGRSpatialReferenceH , char **);
OGRErr  OSRImportFromPCI(OGRSpatialReferenceH hSRS, char *, char *, double *);
OGRErr  OSRImportFromUSGS(OGRSpatialReferenceH , int , int , double *, int );
OGRErr  OSRImportFromXML(OGRSpatialReferenceH , char *);
OGRErr  OSRImportFromDict(OGRSpatialReferenceH , char *, char *);
OGRErr  OSRImportFromPanorama(OGRSpatialReferenceH , int , int , int , double *);
OGRErr  OSRImportFromOzi(OGRSpatialReferenceH , const(char*)*);
OGRErr  OSRImportFromMICoordSys(OGRSpatialReferenceH , const(char) *);
OGRErr  OSRImportFromERM(OGRSpatialReferenceH , const(char) *, const(char) *, const(char) *);
OGRErr  OSRImportFromUrl(OGRSpatialReferenceH , char *);

extern (Windows):
OGRErr  OSRExportToWkt(OGRSpatialReferenceH , char **);
OGRErr  OSRExportToPrettyWkt(OGRSpatialReferenceH , char **, int );
OGRErr  OSRExportToProj4(OGRSpatialReferenceH , char **);
extern (C):
OGRErr  OSRExportToPCI(OGRSpatialReferenceH , char **, char **, double **);
OGRErr  OSRExportToUSGS(OGRSpatialReferenceH , int *, int *, double **, int *);
OGRErr  OSRExportToXML(OGRSpatialReferenceH , char **, const(char) *);
OGRErr  OSRExportToPanorama(OGRSpatialReferenceH , int *, int *, int *, int *, double *);
OGRErr  OSRExportToMICoordSys(OGRSpatialReferenceH , char **);
OGRErr  OSRExportToERM(OGRSpatialReferenceH , char *, char *, char *);

OGRErr  OSRMorphToESRI(OGRSpatialReferenceH );
OGRErr  OSRMorphFromESRI(OGRSpatialReferenceH );

extern (Windows):
OGRErr  OSRSetAttrValue(OGRSpatialReferenceH hSRS, const(char) *pszNodePath, const(char) *pszNewNodeValue);
char * OSRGetAttrValue(OGRSpatialReferenceH hSRS, const(char) *pszName, int iChild);

extern (C):
OGRErr  OSRSetAngularUnits(OGRSpatialReferenceH , const(char) *, double );
double  OSRGetAngularUnits(OGRSpatialReferenceH , char **);
OGRErr  OSRSetLinearUnits(OGRSpatialReferenceH , const(char) *, double );
OGRErr  OSRSetTargetLinearUnits(OGRSpatialReferenceH , const(char) *, const(char) *, double );
OGRErr  OSRSetLinearUnitsAndUpdateParameters(OGRSpatialReferenceH , const(char) *, double );
double  OSRGetLinearUnits(OGRSpatialReferenceH , char **);
double  OSRGetTargetLinearUnits(OGRSpatialReferenceH , char *, char **);

double  OSRGetPrimeMeridian(OGRSpatialReferenceH , char **);

int  OSRIsGeographic(OGRSpatialReferenceH );
int  OSRIsLocal(OGRSpatialReferenceH );
int  OSRIsProjected(OGRSpatialReferenceH );
int  OSRIsCompound(OGRSpatialReferenceH );
int  OSRIsGeocentric(OGRSpatialReferenceH );
int  OSRIsVertical(OGRSpatialReferenceH );
int  OSRIsSameGeogCS(OGRSpatialReferenceH , OGRSpatialReferenceH );
int  OSRIsSameVertCS(OGRSpatialReferenceH , OGRSpatialReferenceH );
int  OSRIsSame(OGRSpatialReferenceH , OGRSpatialReferenceH );

OGRErr  OSRSetLocalCS(OGRSpatialReferenceH hSRS, const(char) *pszName);
OGRErr  OSRSetProjCS(OGRSpatialReferenceH hSRS, const(char) *pszName);
OGRErr  OSRSetGeocCS(OGRSpatialReferenceH hSRS, const(char) *pszName);
OGRErr  OSRSetWellKnownGeogCS(OGRSpatialReferenceH hSRS, const(char) *pszName);
extern (Windows):
OGRErr  OSRSetFromUserInput(OGRSpatialReferenceH hSRS, const(char) *);
extern (C):
OGRErr  OSRCopyGeogCSFrom(OGRSpatialReferenceH hSRS, OGRSpatialReferenceH hSrcSRS);
OGRErr  OSRSetTOWGS84(OGRSpatialReferenceH hSRS, double , double , double , double , double , double , double );
OGRErr  OSRGetTOWGS84(OGRSpatialReferenceH hSRS, double *, int );

OGRErr  OSRSetCompoundCS(OGRSpatialReferenceH hSRS, const(char) *pszName, OGRSpatialReferenceH hHorizSRS, OGRSpatialReferenceH hVertSRS);
OGRErr  OSRSetGeogCS(OGRSpatialReferenceH hSRS, const(char) *pszGeogName, const(char) *pszDatumName, const(char) *pszEllipsoidName, double dfSemiMajor, double dfInvFlattening, const(char) *pszPMName, double dfPMOffset, const(char) *pszUnits, double dfConvertToRadians);

OGRErr  OSRSetVertCS(OGRSpatialReferenceH hSRS, const(char) *pszVertCSName, const(char) *pszVertDatumName, int nVertDatumType);

double  OSRGetSemiMajor(OGRSpatialReferenceH , OGRErr *);
double  OSRGetSemiMinor(OGRSpatialReferenceH , OGRErr *);
double  OSRGetInvFlattening(OGRSpatialReferenceH , OGRErr *);

OGRErr  OSRSetAuthority(OGRSpatialReferenceH hSRS, const(char) *pszTargetKey, const(char) *pszAuthority, int nCode);
char * OSRGetAuthorityCode(OGRSpatialReferenceH hSRS, const(char) *pszTargetKey);
char * OSRGetAuthorityName(OGRSpatialReferenceH hSRS, const(char) *pszTargetKey);
OGRErr  OSRSetProjection(OGRSpatialReferenceH , const(char) *);
OGRErr  OSRSetProjParm(OGRSpatialReferenceH , const(char) *, double );
double  OSRGetProjParm(OGRSpatialReferenceH hSRS, const(char) *pszParmName, double dfDefault, OGRErr *);
OGRErr  OSRSetNormProjParm(OGRSpatialReferenceH , const(char) *, double );
double  OSRGetNormProjParm(OGRSpatialReferenceH hSRS, const(char) *pszParmName, double dfDefault, OGRErr *);

OGRErr  OSRSetUTM(OGRSpatialReferenceH hSRS, int nZone, int bNorth);
int  OSRGetUTMZone(OGRSpatialReferenceH hSRS, int *pbNorth);
OGRErr  OSRSetStatePlane(OGRSpatialReferenceH hSRS, int nZone, int bNAD83);
OGRErr  OSRSetStatePlaneWithUnits(OGRSpatialReferenceH hSRS, int nZone, int bNAD83, const(char) *pszOverrideUnitName, double dfOverrideUnit);
OGRErr  OSRAutoIdentifyEPSG(OGRSpatialReferenceH hSRS);

int  OSREPSGTreatsAsLatLong(OGRSpatialReferenceH hSRS);
int  OSREPSGTreatsAsNorthingEasting(OGRSpatialReferenceH hSRS);
const(char) * OSRGetAxis(OGRSpatialReferenceH hSRS, const(char) *pszTargetKey, int iAxis, OGRAxisOrientation *peOrientation);
OGRErr  OSRSetAxes(OGRSpatialReferenceH hSRS, const(char) *pszTargetKey, const(char) *pszXAxisName, OGRAxisOrientation eXAxisOrientation, const(char) *pszYAxisName, OGRAxisOrientation eYAxisOrientation);
/** Albers Conic Equal Area */
OGRErr  OSRSetACEA(OGRSpatialReferenceH hSRS, double dfStdP1, double dfStdP2, double dfCenterLat, double dfCenterLong, double dfFalseEasting, double dfFalseNorthing);

/** Azimuthal Equidistant */
OGRErr  OSRSetAE(OGRSpatialReferenceH hSRS, double dfCenterLat, double dfCenterLong, double dfFalseEasting, double dfFalseNorthing);

/** Bonne */
OGRErr  OSRSetBonne(OGRSpatialReferenceH hSRS, double dfStandardParallel, double dfCentralMeridian, double dfFalseEasting, double dfFalseNorthing);

/** Cylindrical Equal Area */
OGRErr  OSRSetCEA(OGRSpatialReferenceH hSRS, double dfStdP1, double dfCentralMeridian, double dfFalseEasting, double dfFalseNorthing);

OGRErr  OSRSetCS(OGRSpatialReferenceH hSRS, double dfCenterLat, double dfCenterLong, double dfFalseEasting, double dfFalseNorthing);

/** Equidistant Conic */
OGRErr  OSRSetEC(OGRSpatialReferenceH hSRS, double dfStdP1, double dfStdP2, double dfCenterLat, double dfCenterLong, double dfFalseEasting, double dfFalseNorthing);

/** Eckert I-VI */
OGRErr  OSRSetEckert(OGRSpatialReferenceH hSRS, int nVariation, double dfCentralMeridian, double dfFalseEasting, double dfFalseNorthing);

/** Eckert IV */
OGRErr  OSRSetEckertIV(OGRSpatialReferenceH hSRS, double dfCentralMeridian, double dfFalseEasting, double dfFalseNorthing);

/** Eckert VI */
OGRErr  OSRSetEckertVI(OGRSpatialReferenceH hSRS, double dfCentralMeridian, double dfFalseEasting, double dfFalseNorthing);

/** Equirectangular */
OGRErr  OSRSetEquirectangular(OGRSpatialReferenceH hSRS, double dfCenterLat, double dfCenterLong, double dfFalseEasting, double dfFalseNorthing);

/** Equirectangular generalized form */
OGRErr  OSRSetEquirectangular2(OGRSpatialReferenceH hSRS, double dfCenterLat, double dfCenterLong, double dfPseudoStdParallel1, double dfFalseEasting, double dfFalseNorthing);

/** Gall Stereograpic */
OGRErr  OSRSetGS(OGRSpatialReferenceH hSRS, double dfCentralMeridian, double dfFalseEasting, double dfFalseNorthing);

/** Goode Homolosine */
OGRErr  OSRSetGH(OGRSpatialReferenceH hSRS, double dfCentralMeridian, double dfFalseEasting, double dfFalseNorthing);

/** Interrupted Goode Homolosine */
OGRErr  OSRSetIGH(OGRSpatialReferenceH hSRS);

/** GEOS - Geostationary Satellite View */
OGRErr  OSRSetGEOS(OGRSpatialReferenceH hSRS, double dfCentralMeridian, double dfSatelliteHeight, double dfFalseEasting, double dfFalseNorthing);

/** Gauss Schreiber Transverse Mercator */
OGRErr  OSRSetGaussSchreiberTMercator(OGRSpatialReferenceH hSRS, double dfCenterLat, double dfCenterLong, double dfScale, double dfFalseEasting, double dfFalseNorthing);
/** Gnomonic */
OGRErr  OSRSetGnomonic(OGRSpatialReferenceH hSRS, double dfCenterLat, double dfCenterLong, double dfFalseEasting, double dfFalseNorthing);

/** Oblique Mercator (aka HOM (variant B) */
OGRErr  OSRSetOM(OGRSpatialReferenceH hSRS, double dfCenterLat, double dfCenterLong, double dfAzimuth, double dfRectToSkew, double dfScale, double dfFalseEasting, double dfFalseNorthing);

/** Hotine Oblique Mercator using azimuth angle */
OGRErr  OSRSetHOM(OGRSpatialReferenceH hSRS, double dfCenterLat, double dfCenterLong, double dfAzimuth, double dfRectToSkew, double dfScale, double dfFalseEasting, double dfFalseNorthing);

OGRErr  OSRSetHOMAC(OGRSpatialReferenceH hSRS, double dfCenterLat, double dfCenterLong, double dfAzimuth, double dfRectToSkew, double dfScale, double dfFalseEasting, double dfFalseNorthing);

/** Hotine Oblique Mercator using two points on centerline */
OGRErr  OSRSetHOM2PNO(OGRSpatialReferenceH hSRS, double dfCenterLat, double dfLat1, double dfLong1, double dfLat2, double dfLong2, double dfScale, double dfFalseEasting, double dfFalseNorthing);

/** International Map of the World Polyconic */
OGRErr  OSRSetIWMPolyconic(OGRSpatialReferenceH hSRS, double dfLat1, double dfLat2, double dfCenterLong, double dfFalseEasting, double dfFalseNorthing);

/** Krovak Oblique Conic Conformal */
OGRErr  OSRSetKrovak(OGRSpatialReferenceH hSRS, double dfCenterLat, double dfCenterLong, double dfAzimuth, double dfPseudoStdParallelLat, double dfScale, double dfFalseEasting, double dfFalseNorthing);

/** Lambert Azimuthal Equal-Area */
OGRErr  OSRSetLAEA(OGRSpatialReferenceH hSRS, double dfCenterLat, double dfCenterLong, double dfFalseEasting, double dfFalseNorthing);

/** Lambert Conformal Conic */
OGRErr  OSRSetLCC(OGRSpatialReferenceH hSRS, double dfStdP1, double dfStdP2, double dfCenterLat, double dfCenterLong, double dfFalseEasting, double dfFalseNorthing);

/** Lambert Conformal Conic 1SP */
OGRErr  OSRSetLCC1SP(OGRSpatialReferenceH hSRS, double dfCenterLat, double dfCenterLong, double dfScale, double dfFalseEasting, double dfFalseNorthing);

/** Lambert Conformal Conic (Belgium) */
OGRErr  OSRSetLCCB(OGRSpatialReferenceH hSRS, double dfStdP1, double dfStdP2, double dfCenterLat, double dfCenterLong, double dfFalseEasting, double dfFalseNorthing);

/** Miller Cylindrical */
OGRErr  OSRSetMC(OGRSpatialReferenceH hSRS, double dfCenterLat, double dfCenterLong, double dfFalseEasting, double dfFalseNorthing);

/** Mercator */
OGRErr  OSRSetMercator(OGRSpatialReferenceH hSRS, double dfCenterLat, double dfCenterLong, double dfScale, double dfFalseEasting, double dfFalseNorthing);
OGRErr  OSRSetMercator2SP(OGRSpatialReferenceH hSRS, double dfStdP1, double dfCenterLat, double dfCenterLong, double dfFalseEasting, double dfFalseNorthing);

/** Mollweide */
OGRErr  OSRSetMollweide(OGRSpatialReferenceH hSRS, double dfCentralMeridian, double dfFalseEasting, double dfFalseNorthing);

/** New Zealand Map Grid */
OGRErr  OSRSetNZMG(OGRSpatialReferenceH hSRS, double dfCenterLat, double dfCenterLong, double dfFalseEasting, double dfFalseNorthing);

/** Oblique Stereographic */
OGRErr  OSRSetOS(OGRSpatialReferenceH hSRS, double dfOriginLat, double dfCMeridian, double dfScale, double dfFalseEasting, double dfFalseNorthing);

/** Orthographic */
OGRErr  OSRSetOrthographic(OGRSpatialReferenceH hSRS, double dfCenterLat, double dfCenterLong, double dfFalseEasting, double dfFalseNorthing);

/** Polyconic */
OGRErr  OSRSetPolyconic(OGRSpatialReferenceH hSRS, double dfCenterLat, double dfCenterLong, double dfFalseEasting, double dfFalseNorthing);

/** Polar Stereographic */
OGRErr  OSRSetPS(OGRSpatialReferenceH hSRS, double dfCenterLat, double dfCenterLong, double dfScale, double dfFalseEasting, double dfFalseNorthing);

/** Robinson */
OGRErr  OSRSetRobinson(OGRSpatialReferenceH hSRS, double dfCenterLong, double dfFalseEasting, double dfFalseNorthing);

/** Sinusoidal */
OGRErr  OSRSetSinusoidal(OGRSpatialReferenceH hSRS, double dfCenterLong, double dfFalseEasting, double dfFalseNorthing);

/** Stereographic */
OGRErr  OSRSetStereographic(OGRSpatialReferenceH hSRS, double dfCenterLat, double dfCenterLong, double dfScale, double dfFalseEasting, double dfFalseNorthing);

/** Swiss Oblique Cylindrical */
OGRErr  OSRSetSOC(OGRSpatialReferenceH hSRS, double dfLatitudeOfOrigin, double dfCentralMeridian, double dfFalseEasting, double dfFalseNorthing);

/** Transverse Mercator
 *
 * Special processing available for Transverse Mercator with GDAL &gt;= 1.10 and PROJ &gt;= 4.8 :
 * see OGRSpatialReference::exportToProj4().
 */

OGRErr  OSRSetTM(OGRSpatialReferenceH hSRS, double dfCenterLat, double dfCenterLong, double dfScale, double dfFalseEasting, double dfFalseNorthing);

/** Transverse Mercator variant */
OGRErr  OSRSetTMVariant(OGRSpatialReferenceH hSRS, const(char) *pszVariantName, double dfCenterLat, double dfCenterLong, double dfScale, double dfFalseEasting, double dfFalseNorthing);

/** Tunesia Mining Grid  */
OGRErr  OSRSetTMG(OGRSpatialReferenceH hSRS, double dfCenterLat, double dfCenterLong, double dfFalseEasting, double dfFalseNorthing);

/** Transverse Mercator (South Oriented) */
OGRErr  OSRSetTMSO(OGRSpatialReferenceH hSRS, double dfCenterLat, double dfCenterLong, double dfScale, double dfFalseEasting, double dfFalseNorthing);

OGRErr  OSRSetTPED(OGRSpatialReferenceH hSRS, double dfLat1, double dfLong1, double dfLat2, double dfLong2, double dfFalseEasting, double dfFalseNorthing);

/** VanDerGrinten */
OGRErr  OSRSetVDG(OGRSpatialReferenceH hSRS, double dfCenterLong, double dfFalseEasting, double dfFalseNorthing);

/** Wagner I -- VII */
OGRErr  OSRSetWagner(OGRSpatialReferenceH hSRS, int nVariation, double dfCenterLat, double dfFalseEasting, double dfFalseNorthing);

/** Quadrilateralized Spherical Cube */
OGRErr  OSRSetQSC(OGRSpatialReferenceH hSRS, double dfCenterLat, double dfCenterLong);

/** Spherical, Cross-track, Height */
OGRErr  OSRSetSCH(OGRSpatialReferenceH hSRS, double dfPegLat, double dfPegLong, double dfPegHeading, double dfPegHgt);


double  OSRCalcInvFlattening(double dfSemiMajor, double dfSemiMinor);
double  OSRCalcSemiMinorFromInvFlattening(double dfSemiMajor, double dfInvFlattening);

void  OSRCleanup();

/* -------------------------------------------------------------------- */
/*      OGRCoordinateTransform C API.                                   */
/* -------------------------------------------------------------------- */
extern (Windows):
OGRCoordinateTransformationH  OCTNewCoordinateTransformation(OGRSpatialReferenceH hSourceSRS, OGRSpatialReferenceH hTargetSRS);
void  OCTDestroyCoordinateTransformation(OGRCoordinateTransformationH );

int  OCTTransform(OGRCoordinateTransformationH hCT, int nCount, double *x, double *y, double *z);

int  OCTTransformEx(OGRCoordinateTransformationH hCT, int nCount, double *x, double *y, double *z, int *pabSuccess);

/* this is really private to OGR. */
extern (C):
char * OCTProj4Normalize(char *pszProj4Src);

void  OCTCleanupProjMutex();

/* -------------------------------------------------------------------- */
/*      Projection transform dictionary query.                          */
/* -------------------------------------------------------------------- */

char ** OPTGetProjectionMethods();
char ** OPTGetParameterList(const(char) *pszProjectionMethod, char **ppszUserName);
int  OPTGetParameterInfo(const(char) *pszProjectionMethod, const(char) *pszParameterName, char **ppszUserName, char **ppszType, double *pdfDefaultValue);
