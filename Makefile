default:
	clear
	flex -l trab.l
	bison -dv trab.y
	gcc -o trab trab.tab.c lex.yy.c -lfl