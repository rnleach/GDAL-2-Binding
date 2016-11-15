# GDAL-2-Binding
D language binding to GDAL C interface

## GDAL
The GDAL website is [gdal.org](gdal.org) and has a lot of documentation. When reading the
documentation and tutorials, remember this binding was created for the C-API.

## Update
Current binding is to GDAL 2.1.0.

## Completeness
Currently the vast majority of the C-interface has bindings created. The virtual
memory portion of the API has not had bindings created yet. If I had created
bindings for these functions, it would have required a whole host of other
header files be binded also, and the API was quickly growing larger than I 
want to maintain.
 