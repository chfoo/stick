#ifdef LIBHL_EXPORTS
#include <hl.h>
#include "example.h"

HL_PRIM int hl_example_add_two(int a) {
    return example_add_two(a);
}

DEFINE_PRIM(_I32, example_add_two, _I32);

#endif
