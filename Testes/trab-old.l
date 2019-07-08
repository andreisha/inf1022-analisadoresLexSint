%option yywrap
      #include <stdio.h>
      #include <string.h>
      #include "trab3.tab.h"
%%
ENTRADA 		{printf("ENTRADA "); return ENTRADA;}
SAIDA                   {printf("SAIDA "); return SAIDA;}
FIM                     {printf("FIM "); return FIM;}
FACA                    {printf("FACA "); return FACA;}
VEZES                   {printf("VEZES "); return VEZES;}
ENQUANTO                {printf("ENQUANTO "); return ENQUANTO;}
SE                      {printf("SE "); return SE;}
ENTAO                   {printf("ENTAO "); return ENTAO;}
SENAO                   {printf("SENAO "); return SENAO;}
INC                     {printf("INC "); return INC;}
ZERA                    {printf("ZERA "); return ZERA;}
[0-9]+                  {printf("%s",yytext); yylval.number=atoi(yytext); return NUMBER; }
[a-zA-Z]+               {printf("%s",yytext); yylval.str=strdup(yytext); return NAME; }
\n       {printf("\n"); return ROWEND;}
"="      return ASSIGN;
"+"      return PLUS;
"*"      return MULT;
"("      return AP;
")"      return FP;
.        ;

