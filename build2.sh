bison -d trab2.y
flex trab2.l
gcc -o sequencia2 lex.yy.c trab2.tab.c -ll