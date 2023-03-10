#pragma once

#include "Types.h"
#include "IO.c"

#define VGA_MEMORY (uint_8*)0xb8000
#define VGA_HEIGHT 80
#define VGA_WIDTH  80

uint_16 CursorPosition;

void SetCursorPosition(uint_16 position)
{
  outb(0x3D4, 0x0F);
  outb(0x3D5, (uint_8)(position & 0xFF));
  outb(0x3D4, 0x0E);
  outb(0x3D5, (uint_8)((position >> 8) & 0xFF));
  CursorPosition = position;
}


uint_32 CursorPos(uint_32 X, uint_32 Y)
{
   return Y * VGA_WIDTH + X;
}

void printk(const char* str)
{
   uint_8* charptr = (uint_8*)str;
   uint_16 index;

   while(*charptr!=0)
{
 switch(*charptr){
   case 10:
       index+=VGA_WIDTH;
       break;
   case 13:
       index -= index % VGA_WIDTH;
       break;
   default:
       *(VGA_MEMORY + index * 2) = *charptr;
        index++;
      }
      charptr++;
   }
   SetCursorPosition(index);
}

