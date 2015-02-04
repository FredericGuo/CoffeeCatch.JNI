#include <stdio.h>
#include <stdlib.h>

#include "coffeecatch.h"

int recurse_madness(int level) {
  printf("recurse_madness( %d )\n", level );
  
  static int var[] = { 1, 2 };
  if (level > 200000) {
    return 1 + level;
  } else {
    return recurse_madness(level + 1)*var[level];
  }
}

void Crash() {
  volatile int* a = reinterpret_cast<volatile int*>(NULL);
  *a = 1;
}

static char string_buffer[256];

static __attribute__ ((noinline)) void demo(int *fault) {
  COFFEE_TRY() {
  
    Crash();
  
    printf("before recurse_madness()\n");
    recurse_madness(42);
    *fault = 0;
  } COFFEE_CATCH() {
    printf("COFFEE_CATCH()\n");
    const char*const message = coffeecatch_get_message();
    snprintf(string_buffer, sizeof(string_buffer), "%s", message);
    *fault = 1;
  } COFFEE_END();
}

int main(int argc, char **argv) {
  int fault;
  (void) argc;
  (void) argv;

  printf("running demo...\n");
  demo(&fault);
  if (fault != 0) {
    fprintf(stderr, "** coffeecatch.crash detected: %s\n", string_buffer);
    exit(EXIT_FAILURE);
  }
  printf("success!\n");

  return EXIT_SUCCESS;
}

