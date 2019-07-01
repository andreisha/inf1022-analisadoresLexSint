%option yywrap
      #include <stdio.h>
      #include "exemplo.tab.h"
%%
[0-9]+   {printf("Valor lido %s \n",yytext);yylval=atoi(yytext); return(NUMBER); }
\n       return(ENDLINE);
"+"      return(PLUS);
"-"      return(MINUS);
"*"	 	 return(TIMES);
"/"	     return(DIVIDE);
"="      return(EQUALS);
ende     return(0);
.        ;