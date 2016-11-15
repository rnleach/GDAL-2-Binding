/* Converted to D from C:/devLibs/gdal21/include/gdal_version.h by htod */
module gdal.gdalversion;

/* -------------------------------------------------------------------- */
/*      GDAL Version Information.                                       */
/* -------------------------------------------------------------------- */

enum uint GDAL_VERSION_MAJOR = 2;
enum uint GDAL_VERSION_MINOR = 1;
enum uint GDAL_VERSION_REV   = 0;
enum uint GDAL_VERSION_BUILD = 0;

/* GDAL_COMPUTE_VERSION macro introduced in GDAL 1.10 */
/* Must be used ONLY to compare with version numbers for GDAL >= 1.10 */
uint GDAL_COMPUTE_VERSION(uint maj, uint min, uint rev) 
{
  return maj * 1000000 + min * 10000 + rev * 100;
}

/* Note: the formula to compute GDAL_VERSION_NUM has changed in GDAL 1.10 */
enum GDAL_VERSION_NUM = GDAL_COMPUTE_VERSION( GDAL_VERSION_MAJOR, 
  GDAL_VERSION_MINOR, 
  GDAL_VERSION_REV) + GDAL_VERSION_BUILD;

enum GDAL_RELEASE_DATE = 20160425;
enum GDAL_RELEASE_NAME = "2.1.0";
