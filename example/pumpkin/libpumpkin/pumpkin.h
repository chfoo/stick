#pragma once

#include <stdlib.h>
#include <stdint.h>

// This is a example library called "pumpkin". It is intended to fullfill
// https://github.com/larsiusprime/larsBounties/issues/2

#ifdef __cplusplus
extern "C" {
#endif

// Add two numbers and return the result.
int32_t pumpkin_add(int32_t a, int32_t b);

// Reads the first few bytes from the given filename.
// Returns 0 if success.
int pumpkin_read(const char *filename, uint8_t *buffer, size_t buffer_length, size_t *bytes_read);

// Concatenates two strings.
// Returns the concatinated string or NULL. Caller is responsible for freeing.
const char* pumpkin_concat(const char *text1, const char *text2);

#ifdef __cplusplus
}
#endif
