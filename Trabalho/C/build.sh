bison -d trabmainC.y
flex -l trabmain.l
gcc -o trabmainC trabmainC.tab.c lex.yy.c -ll