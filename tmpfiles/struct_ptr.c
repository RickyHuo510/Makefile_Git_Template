#include <stdio.h>
#include <stdlib.h>
struct cpu{
    int cpuid;
    int mem[3];
    char regs[2];
    int *pc;
    int (*func)(int,int);
};

int add(int a, int b)
{
    return a+b;
}

int main()
{
    struct cpu p;
    struct cpu* pointer;
    pointer=&p;

    p.cpuid=10;
    for(int i=0;i<=2;i++)
        p.mem[i]=i;
    p.regs[0]='A';
    p.regs[1]='B';

    int *ptr=malloc(sizeof(int));
    p.func=add;
    p.pc=ptr;

    printf("%d\n%p\nmalloc=%p\nmain=  %p\n&p=    %p\n",*((*pointer).mem+2), (pointer->mem),pointer->pc,main,&p);
    return 0;
}