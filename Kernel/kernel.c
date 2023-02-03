#include "Types.h"
#include "printk.c"

extern void _start()
{
char* mem = (char*)0xb8000;

printk("Kernel Loaded Successfully...!");
return;
}
