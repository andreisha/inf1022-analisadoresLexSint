%option yywrap
      #include <stdio.h>
      #include <string.h>
      #include "trab.tab.h"
%%
ende     return(END);
Program  return(PROGRAM);
ENTRADA  ;
SAIDA ;
FIM ;
[0-9]+   {printf("lido %s",yytext); yylval.number=atoi(yytext); return ZAHL; }
[a-zA-Z]+   {printf("lido %s",yytext); yylval.str=strdup(yytext); return NAME ; }
\n       ;
"="      return(ASSIGN);
"+"      return(PLUS);
"*"      return(MULT);
"("      return(AP);
")"      return(FP);

