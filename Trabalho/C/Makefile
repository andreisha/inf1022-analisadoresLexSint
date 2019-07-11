default:
	clear
	flex -l trabmain.l
	bison -dv trabmainC.y
	gcc -o trabmainC trabmainC.tab.c lex.yy.c -lfl
	gcc -o provolone provolone.C