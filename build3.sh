bison -d trab3.y
flex trab.l
gcc -o sequencia lex.yy.c trab3.tab.c -ll