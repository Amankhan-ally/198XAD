extern "C" void _start()
{
char* ptr = (char*)0xb8000;
*ptr = 'C';
return;
}
