default:
	clear
	flex -l trab2.l
	bison -dv trab3.y
	gcc -o trab3 trab3.tab.c lex.yy.c -lfl