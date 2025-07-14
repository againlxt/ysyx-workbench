#include <common.h>
extern char *cachesim_file;
extern void cachesim();
int main(int args, char** argv) {
    cachesim_file = argv[0];
    cachesim();
}
