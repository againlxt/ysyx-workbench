#include <common.h>
// #define PRED 1
#define CACHE 1
extern char *cachesim_file;
extern char *pred_file;
extern void cachesim();
extern void branchsim(void);
int main(int args, char** argv) {
    #ifdef PRED
    pred_file = argv[1];
    branchsim();
    #elif CACHE
    cachesim_file = argv[1];
    cachesim();
    #endif
}
