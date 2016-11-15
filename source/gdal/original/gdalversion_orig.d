/* Converted to D from C:/devLibs/gdal21/include/gdal_version.h by htod */
module ./gdalversion;

/* -------------------------------------------------------------------- */
/*      GDAL Version Information.                                       */
/* -------------------------------------------------------------------- */

//C     #ifndef GDAL_VERSION_MAJOR
//C     #  define GDAL_VERSION_MAJOR    2
//C     #  define GDAL_VERSION_MINOR    1
const GDAL_VERSION_MAJOR = 2;
//C     #  define GDAL_VERSION_REV      0
const GDAL_VERSION_MINOR = 1;
//C     #  define GDAL_VERSION_BUILD    0
const GDAL_VERSION_REV = 0;
//C     #endif
const GDAL_VERSION_BUILD = 0;

/* GDAL_COMPUTE_VERSION macro introduced in GDAL 1.10 */
/* Must be used ONLY to compare with version numbers for GDAL >= 1.10 */
//C     #ifndef GDAL_COMPUTE_VERSION
//C     #define GDAL_COMPUTE_VERSION(maj,min,rev) ((maj)*1000000+(min)*10000+(rev)*100)
//C     #endif

/* Note: the formula to compute GDAL_VERSION_NUM has changed in GDAL 1.10 */
//C     #ifndef GDAL_VERSION_NUM
//C     #  define GDAL_VERSION_NUM      (GDAL_COMPUTE_VERSION(GDAL_VERSION_MAJOR,GDAL_VERSION_MINOR,GDAL_VERSION_REV)+GDAL_VERSION_BUILD)
//C     #endif

//C     #ifndef GDAL_RELEASE_DATE
//C     #  define GDAL_RELEASE_DATE     20160425
//C     #endif
const GDAL_RELEASE_DATE = 20160425;
//C     #ifndef GDAL_RELEASE_NAME
//C     #  define GDAL_RELEASE_NAME     "2.1.0"
//C     #endif
