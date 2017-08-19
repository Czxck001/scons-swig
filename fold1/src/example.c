/* File: example.c */

#include "example.h"
#include "multiply.h"


int fact(int n) {
    if (n < 0){ /* This should probably return an error, but this is simpler */
        return 0;
    }
    if (n == 0) {
        return 1;
    }
    else {
        /* testing for overflow would be a good idea here */
        return multiply(n, fact(n-1));
    }
}
