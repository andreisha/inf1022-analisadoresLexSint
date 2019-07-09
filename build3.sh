bison -d trabmain.y
flex trabmain.l
gcc -o trabmain lex.yy.c trabmain.tab.c -ll
