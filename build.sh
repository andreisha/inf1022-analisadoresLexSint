bison -d trab.y
flex trab.l
gcc -o sequencia lex.yy.c trab.tab.c -ll