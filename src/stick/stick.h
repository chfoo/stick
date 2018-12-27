#pragma once

#include <stdint.h>

#ifdef HXCPP_API_LEVEL
    //#include <hxcpp.h>

    #define STICK_FUNC
    #define STICK_FUNC_NAME(name) name
    #define STICK_BYTE_ARRAY_T unsigned char*
    #define STICK_CHAR_ARRAY_T const char*
    #define STICK_INT64_EMU_T double
    #define STICK_INT64_T int64_t
    #define STICK_UINT64_T uint64_t
#endif

#ifdef LIBHL_EXPORTS
    #include <hl.h>

    #define STICK_FUNC HL_PRIM
    #define STICK_FUNC_NAME(name) hl_##name
    #define STICK_BYTE_ARRAY_T vbyte*
    #define STICK_CHAR_ARRAY_T const char*
    #define STICK_INT64_EMU_T double
    #define STICK_INT64_T int64
    #define STICK_UINT64_T uint64
#endif


#define STICK_INT64_EMU_TO_NATIVE(emu)  ((STICK_INT64_T) emu)
#define STICK_UINT64_EMU_TO_NATIVE(emu)  ((STICK_UINT64_T) emu)
#define STICK_INT64_NATIVE_TO_EMU(native)  ((STICK_INT64_EMU_T) native)
#define STICK_UINT64_NATIVE_TO_EMU(native)  ((STICK_INT64_EMU_T) native)
