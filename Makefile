default:
	clear
	flex -l trabmain.l
	bison -dv trabmain.y
	gcc -o trabmain trabmain.tab.c lex.yy.c -lfl