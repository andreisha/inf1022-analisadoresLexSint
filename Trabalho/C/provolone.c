#include<stdio.h>
#include<stdlib.h>

int main(int argc, char *argv[]){
int k = argc-1;

int y = atoi(argv[k]);
k--;
int x = atoi(argv[k]);
k--;
int i = atoi(argv[k]);
k--;

int m = atoi(argv[k]);
k--;
m = x;

for(int l = 0; l < i; l++){
m++;

int j = y;
while(j > 0){
m++;
j--;
}
}
printf("%d\n", m);

return 0;
}
