bison -d sequenciacomandos.y
flex sequenciacomandos.l
gcc -o sequencia lex.yy.c sequenciacomandos.tab.c -ll