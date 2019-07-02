%option yywrap
		#include <stdio.h>
		#include <string.h>
		#include "sequenciacomandos.tab.h"
%%
end 		return END;
Program 	return PROGRAM;
[0-9]+		{ printf("lido %s", yytext); yylval.number = atoi(yytext); return NUMBER; }
[a-zA-Z]+	{ printf("lido %s", yytext); yylval.str = strdup(yytext); return NAME; }
\n 		return ROWEND;
"=" 		return ASSIGN;
"+" 		return PLUS;
"*" 		return MULT;
"(" 		return AP;
")"		return FP;
.               ;
