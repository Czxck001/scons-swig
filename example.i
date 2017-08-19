/* File: example.i */
%module example

%inline %{
#define SWIG_FILE_WITH_INIT
#include "example.h"
%}
