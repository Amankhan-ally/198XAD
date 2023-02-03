#include "Types.h"

extern "C" int _start()
{
char* mem = (char*)0xb8000;

*(mem+1) = 'K';

return 0;
}
