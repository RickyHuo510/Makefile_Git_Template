#ifndef SYS_H
#define SYS_H

#include <stdio.h>

int add(int a, int b);
int sub(int a, int b);
int calculate(int a, int b, int (*operation)(int,int));

#endif