#include <stdio.h>

int max(int a, int b){
	if (a > b){
		return a;
	}
	else{
		return b;
	}
}

int main(){
	int a, b;
	printf("Input a and b: ");
	scanf("%d%d", &a, &b);
	printf("Max = %d", max(a, b));
	getchar();
}