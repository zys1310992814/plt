#include <stdio.h>
#include <stdlib.h>

int main(int argc, char **argv)
{
	int *s=0x804c00c;  //桩的地址
	printf("The address of  first call printf function is %p\n", *s); //第1次调用时的地址
	printf("The address of second call printf function is %p\n", *s); //第2次调用时的地址
}