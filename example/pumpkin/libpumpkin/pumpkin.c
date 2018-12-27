#include "pumpkin.h"

#include <stdio.h>
#include <string.h>
#include <stdint.h>

int pumpkin_add(int a, int b) {
    return a + b;
}

int pumpkin_read(const char *filename, uint8_t *buffer, size_t buffer_length, size_t *bytes_read) {
    FILE *file = fopen(filename, "r");

    if (file == NULL) {
        return 1;
    }

    size_t fread_bytes_read = fread(buffer, 1, buffer_length, file);

    if (ferror(file) != 0) {
        return 1;
    }

    *bytes_read = fread_bytes_read;

    return 0;
}

const char* pumpkin_concat(const char *text1, const char *text2) {
    char *output = calloc((strlen(text1) + strlen(text2) + 1), sizeof(char));

    if (output == NULL) {
        return NULL;
    }

    strcat(output, text1);
    strcat(output, text2);

    return output;
}
