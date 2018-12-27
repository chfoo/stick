// This file was generated by Stick
#include <stick.h>
#include <pumpkin.h>

/* pumpkin_add */
STICK_FUNC int32_t STICK_FUNC_NAME(stick_native_pumpkin_add) (int32_t a, int32_t b) {
    int32_t return_value = pumpkin_add(a, b);
    return return_value;
}

#ifdef LIBHL_EXPORTS
DEFINE_PRIM(_I32, stick_native_pumpkin_add, _I32 _I32 );
#endif

int32_t pumpkin_stick_native_pumpkin_add(int32_t a, int32_t b) {
    return STICK_FUNC_NAME(stick_native_pumpkin_add)(a, b);
}

/* pumpkin_read */
STICK_FUNC int32_t STICK_FUNC_NAME(stick_native_pumpkin_read) (STICK_CHAR_ARRAY_T filename, STICK_BYTE_ARRAY_T buffer, int32_t buffer_length, STICK_INT64_EMU_T* bytes_read) {
    STICK_UINT64_T param_bytes_read = STICK_UINT64_EMU_TO_NATIVE(*bytes_read);
    int return_value = pumpkin_read(filename, buffer, buffer_length, &param_bytes_read);
    *bytes_read = STICK_UINT64_NATIVE_TO_EMU(param_bytes_read);
    return return_value;
}

#ifdef LIBHL_EXPORTS
DEFINE_PRIM(_I32, stick_native_pumpkin_read, _BYTES _BYTES _I32 _REF(_F64) );
#endif

int32_t pumpkin_stick_native_pumpkin_read(STICK_CHAR_ARRAY_T filename, STICK_BYTE_ARRAY_T buffer, int32_t buffer_length, STICK_INT64_EMU_T* bytes_read) {
    return STICK_FUNC_NAME(stick_native_pumpkin_read)(filename, buffer, buffer_length, bytes_read);
}

/* pumpkin_concat */
STICK_FUNC STICK_CHAR_ARRAY_T STICK_FUNC_NAME(stick_native_pumpkin_concat) (STICK_CHAR_ARRAY_T text1, STICK_CHAR_ARRAY_T text2) {
    const char * return_value = pumpkin_concat(text1, text2);
    return return_value;
}

#ifdef LIBHL_EXPORTS
DEFINE_PRIM(_BYTES, stick_native_pumpkin_concat, _BYTES _BYTES );
#endif

STICK_CHAR_ARRAY_T pumpkin_stick_native_pumpkin_concat(STICK_CHAR_ARRAY_T text1, STICK_CHAR_ARRAY_T text2) {
    return STICK_FUNC_NAME(stick_native_pumpkin_concat)(text1, text2);
}

