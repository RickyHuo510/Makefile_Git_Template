#include <stdio.h>
#include "sys.h"
#include <stdlib.h>
#include <readline/readline.h>
#include <readline/history.h>
int main(int argc, char* argv[])
{ 
    for(int i=1;i<argc;i+=3)
    {
        if(argc==1)break;
        if(*argv[i+1]=='+')
        {
            int result = calculate(atoi(argv[i]), atoi(argv[i+2]), add);
            printf("%d + %d = %d\n", atoi(argv[i]), atoi(argv[i+2]), result);
        }
        else if(*argv[i+1]=='-')
        {
            int result = calculate(atoi(argv[i]), atoi(argv[i+2]), sub);
            printf("%d - %d = %d\n", atoi(argv[i]), atoi(argv[i+2]), result);
        }
    }
	char * input_line = readline("INPUT>");
    if(input_line && *input_line) {
        add_history(input_line);
    }
}