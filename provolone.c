#include<stdio.h>
#include<stdlib.h>

int main(int argc, char *argv[]){
int k = argc-1;

int y = atoi(argv[k]);
k--;
int x = atoi(argv[k]);
k--;
int s = atoi(argv[k]);
k--;

int m = atoi(argv[k]);
k--;
x = 0;

for(int j = 0; j < 2; j++){
y++;
x = y;
y = 0;
}

int j = 2;
while(j > 0){
x = 0;
j--;
}

if(2 > 0){
s++;
x = 0;
}
else{
x++;
y = 0;
m = x;
}

printf("%d\n", m);

return 0;
}
