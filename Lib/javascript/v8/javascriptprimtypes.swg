/* ------------------------------------------------------------
 * Primitive Types
 * ------------------------------------------------------------ */

/* boolean */

%fragment(SWIG_From_frag(bool),"header") {
SWIGINTERNINLINE
%#if (V8_MAJOR_VERSION-0) < 4 && (SWIG_V8_VERSION < 0x031903)
v8::Handle<v8::Value>
%#else
v8::Local<v8::Value>
%#endif
SWIG_From_dec(bool)(bool value)
{
  return SWIGV8_BOOLEAN_NEW(value);
}
}

%fragment(SWIG_AsVal_frag(bool),"header",
          fragment=SWIG_AsVal_frag(long)) {
SWIGINTERN
%#if (V8_MAJOR_VERSION-0) < 4 && (SWIG_V8_VERSION < 0x031903)
int SWIG_AsVal_dec(bool)(v8::Handle<v8::Value> obj, bool *val)
%#else
int SWIG_AsVal_dec(bool)(v8::Local<v8::Value> obj, bool *val)
%#endif
{
  if(!obj->IsBoolean()) {
    return SWIG_ERROR;
  }

  if (val) *val = SWIGV8_BOOLEAN_VALUE(obj);
  return SWIG_OK;
}
}

/* int */

%fragment(SWIG_From_frag(int),"header") {
SWIGINTERNINLINE
%#if (V8_MAJOR_VERSION-0) < 4 && (SWIG_V8_VERSION < 0x031903)
v8::Handle<v8::Value> SWIG_From_dec(int)(int value)
%#else
v8::Local<v8::Value> SWIG_From_dec(int)(int value)
%#endif
{
  return SWIGV8_INT32_NEW(value);
}
}

%fragment(SWIG_AsVal_frag(int),"header") {
SWIGINTERN
%#if (V8_MAJOR_VERSION-0) < 4 && (SWIG_V8_VERSION < 0x031903)
int SWIG_AsVal_dec(int)(v8::Handle<v8::Value> valRef, int* val)
%#else
int SWIG_AsVal_dec(int)(v8::Local<v8::Value> valRef, int* val)
%#endif
{
  if (!valRef->IsNumber()) {
    return SWIG_TypeError;
  }
  if(val) *val = SWIGV8_INTEGER_VALUE(valRef);

  return SWIG_OK;
}
}

/* long */

%fragment(SWIG_From_frag(long),"header") {
SWIGINTERNINLINE
%#if (V8_MAJOR_VERSION-0) < 4 && (SWIG_V8_VERSION < 0x031903)
v8::Handle<v8::Value> SWIG_From_dec(long)(long value)
%#else
v8::Local<v8::Value> SWIG_From_dec(long)(long value)
%#endif
{
  return SWIGV8_NUMBER_NEW(value);
}
}

%fragment(SWIG_AsVal_frag(long),"header",
          fragment="SWIG_CanCastAsInteger") {
SWIGINTERN
%#if (V8_MAJOR_VERSION-0) < 4 && (SWIG_V8_VERSION < 0x031903)
int SWIG_AsVal_dec(long)(v8::Handle<v8::Value> obj, long* val)
%#else
int SWIG_AsVal_dec(long)(v8::Local<v8::Value> obj, long* val)
%#endif
{
  if (!obj->IsNumber()) {
    return SWIG_TypeError;
  }
  if(val) *val = (long) SWIGV8_INTEGER_VALUE(obj);

  return SWIG_OK;
}
}

/* unsigned long */

%fragment(SWIG_From_frag(unsigned long),"header",
          fragment=SWIG_From_frag(long)) {
SWIGINTERNINLINE
%#if (V8_MAJOR_VERSION-0) < 4 && (SWIG_V8_VERSION < 0x031903)
v8::Handle<v8::Value> SWIG_From_dec(unsigned long)(unsigned long value)
%#else
v8::Local<v8::Value> SWIG_From_dec(unsigned long)(unsigned long value)
%#endif
{
  return (value > LONG_MAX) ?
    SWIGV8_INTEGER_NEW_UNS(value) : SWIGV8_INTEGER_NEW(%numeric_cast(value,long));
}
}

%fragment(SWIG_AsVal_frag(unsigned long),"header",
          fragment="SWIG_CanCastAsInteger") {
SWIGINTERN
%#if (V8_MAJOR_VERSION-0) < 4 && (SWIG_V8_VERSION < 0x031903)
int SWIG_AsVal_dec(unsigned long)(v8::Handle<v8::Value> obj, unsigned long *val)
%#else
int SWIG_AsVal_dec(unsigned long)(v8::Local<v8::Value> obj, unsigned long *val)
%#endif
{
  if(!obj->IsNumber()) {
    return SWIG_TypeError;
  }

  long longVal = (long) SWIGV8_NUMBER_VALUE(obj);

  if(longVal < 0) {
      return SWIG_OverflowError;
  }

  if(val) *val = longVal;

  return SWIG_OK;
}
}

/* long long */
// Note: these are copied from 'long' and probably need fixing

%fragment(SWIG_From_frag(long long),"header",
    fragment=SWIG_From_frag(long),
    fragment="SWIG_LongLongAvailable") {
%#ifdef SWIG_LONG_LONG_AVAILABLE
SWIGINTERNINLINE
%#if (V8_MAJOR_VERSION-0) < 4 && (SWIG_V8_VERSION < 0x031903)
v8::Handle<v8::Value> SWIG_From_dec(long long)(long long value)
%#else
v8::Local<v8::Value> SWIG_From_dec(long long)(long long value)
%#endif
{
  return SWIGV8_NUMBER_NEW(value);
}
%#endif
}

%fragment(SWIG_AsVal_frag(long long),"header",
    fragment=SWIG_AsVal_frag(long),
    fragment="SWIG_CanCastAsInteger",
    fragment="SWIG_LongLongAvailable") {
%#ifdef SWIG_LONG_LONG_AVAILABLE
SWIGINTERN
%#if (V8_MAJOR_VERSION-0) < 4 && (SWIG_V8_VERSION < 0x031903)
int SWIG_AsVal_dec(long long)(v8::Handle<v8::Value> obj, long long* val)
%#else
int SWIG_AsVal_dec(long long)(v8::Local<v8::Value> obj, long long* val)
%#endif
{
  if (!obj->IsNumber()) {
    return SWIG_TypeError;
  }
  if(val) *val = (long long) SWIGV8_INTEGER_VALUE(obj);

  return SWIG_OK;
}
%#endif
}

/* unsigned long long */
// Note: these are copied from 'unsigned long' and probably need fixing

%fragment(SWIG_From_frag(unsigned long long),"header",
    fragment=SWIG_From_frag(long long),
    fragment="SWIG_LongLongAvailable") {
%#ifdef SWIG_LONG_LONG_AVAILABLE
SWIGINTERNINLINE
%#if (V8_MAJOR_VERSION-0) < 4 && (SWIG_V8_VERSION < 0x031903)
v8::Handle<v8::Value> SWIG_From_dec(unsigned long long)(unsigned long long value)
%#else
v8::Local<v8::Value> SWIG_From_dec(unsigned long long)(unsigned long long value)
%#endif
{
  return (value > LONG_MAX) ?
    SWIGV8_INTEGER_NEW_UNS(value) : SWIGV8_INTEGER_NEW(%numeric_cast(value,long));
}
%#endif
}

%fragment(SWIG_AsVal_frag(unsigned long long),"header",
    fragment=SWIG_AsVal_frag(unsigned long),
    fragment="SWIG_CanCastAsInteger",
    fragment="SWIG_LongLongAvailable") {
%#ifdef SWIG_LONG_LONG_AVAILABLE
SWIGINTERN
%#if (V8_MAJOR_VERSION-0) < 4 && (SWIG_V8_VERSION < 0x031903)
int SWIG_AsVal_dec(unsigned long long)(v8::Handle<v8::Value> obj, unsigned long long *val)
%#else
int SWIG_AsVal_dec(unsigned long long)(v8::Local<v8::Value> obj, unsigned long long *val)
%#endif
{
  if(!obj->IsNumber()) {
    return SWIG_TypeError;
  }

  long long longVal = (long long) SWIGV8_NUMBER_VALUE(obj);

  if(longVal < 0) {
      return SWIG_OverflowError;
  }

  if(val) *val = longVal;

  return SWIG_OK;
}
%#endif
}

/* double */

%fragment(SWIG_From_frag(double),"header") {
SWIGINTERN
%#if (V8_MAJOR_VERSION-0) < 4 && (SWIG_V8_VERSION < 0x031903)
v8::Handle<v8::Value> SWIG_From_dec(double) (double val)
%#else
v8::Local<v8::Value> SWIG_From_dec(double) (double val)
%#endif
{
  return SWIGV8_NUMBER_NEW(val);
}
}

%fragment(SWIG_AsVal_frag(double),"header") {
SWIGINTERN
%#if (V8_MAJOR_VERSION-0) < 4 && (SWIG_V8_VERSION < 0x031903)
int SWIG_AsVal_dec(double)(v8::Handle<v8::Value> obj, double *val)
%#else
int SWIG_AsVal_dec(double)(v8::Local<v8::Value> obj, double *val)
%#endif
{
  if(!obj->IsNumber()) {
    return SWIG_TypeError;
  }
  if(val) *val = SWIGV8_NUMBER_VALUE(obj);

  return SWIG_OK;
}
}
