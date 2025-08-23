#include "sys.h"

int add(int a, int b)
{
    return a + b;
}

int sub(int a, int b)
{
    return a - b;
}

int calculate(int a, int b, int (*operation)(int,int))
{
    return operation(a, b);
}
