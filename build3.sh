bison -d trab3.y
flex trab3.l
gcc -o sequencia3 lex.yy.c trab3.tab.c -ll