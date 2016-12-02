# GDAL-2-Binding
D language binding to GDAL C interface

## GDAL
The GDAL website is [gdal.org](gdal.org) and has a lot of documentation. When reading the
documentation and tutorials, remember this binding was created for the C-API.

## Update
Current binding is to GDAL 2.1.0.

## Completeness
Currently the vast majority of the C-interface in gdal.h has bindings created. The virtual
memory portion of the API has not had bindings created yet. If I had created
bindings for these functions, it would have required a whole host of other
header files be binded also, and the API was quickly growing larger than I 
want to maintain.

The modules other gdal were created to support the interface provided by gdal.h and gdal.d. As
a result they may be incomplete, or they may be trimmed in  future versions. The exception is
the gdal.cpl.conv, which while it is incomplete provides bindings to CPLMalloc and CPLFree.
CPLFree is necessary to free (usually) strings returned by some gdal functions.

## Bugs
The most likely bugs will relate to the use of `const`. The mapping from C to D is not so 
straightforward, and so much of this was done by hand.

## Memory Management
Many of the GDAL functions require a supplied buffer. That buffer may be managed on the D
garbage collected heap, via the standard malloc/free functions, or using CPLMalloc and CPLFree.

## Operating Systems
When htod was run, it was done on a Windows system. GDAL is well written in terms of portability,
but it has not been tested on non-Windows operating systems.
 