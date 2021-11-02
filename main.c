#include <stdio.h>
#include "plus.h"

int main()
{
    printf("Hello World! \n");
    int x = 10;
    int y = 20;
    
    printf("%d + %d = %d \n", x, y, add(x,y));

    return 0;
}