/* ------------------------------------------------------------
 *  Typemap specializations for Javascript
 * ------------------------------------------------------------ */

/* ------------------------------------------------------------
 *  Fragment section
 * ------------------------------------------------------------ */

/* Include fundamental fragemt definitions */
%include <typemaps/fragments.swg>

/* Look for user fragments file. */
%include <javascriptfragments.swg>

/* Javascript fragments for fundamental types */
%include <javascriptprimtypes.swg>

/* Javascript fragments for char* strings */
%include <javascriptstrings.swg>


/* ------------------------------------------------------------
 *  Unified typemap section
 * ------------------------------------------------------------ */

/* Javascript types */

#if (V8_MAJOR_VERSION-0) < 4 && (SWIG_V8_VERSION < 0x031903)
#define SWIG_Object                     v8::Handle<v8::Value>
#else
#define SWIG_Object                     v8::Local<v8::Value>
#endif
#define VOID_Object                     SWIGV8_UNDEFINED()

/* Overload of the output/constant/exception/dirout handling */

/* append output */
#define SWIG_AppendOutput(result, obj) SWIGV8_AppendOutput(result, obj)

/* set constant */
#define SWIG_SetConstant(name, obj)

/* raise */
#define SWIG_Raise(obj, type, desc)  SWIG_V8_Raise(type)

/* Include the unified typemap library */
%include <typemaps/swigtypemaps.swg>
