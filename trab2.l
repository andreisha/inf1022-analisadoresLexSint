%option yywrap
      #include <stdio.h>
      #include <string.h>
      #include "trab2.tab.h"
%%
ENTRADA 		{printf("ENTRADA ");}
SAIDA                   {printf("SAIDA ");}
Program                 {printf("PROGRAM ");}
FIM                     {printf("FIM ");}
FACA                    {printf("FACA ");}
VEZES                   {printf("VEZES ");}
ENQUANTO                {printf("ENQUANTO ");}
SE                      {printf("SE ");}
ENTAO                   {printf("ENTAO ");}
SENAO                   {printf("SENAO ");}
INC                     {printf("INC ");}
ZERA                    {printf("ZERA ");}
[0-9]+                  {printf("%s",yytext); yylval.number=atoi(yytext);}
[a-zA-Z]+               {printf("%s",yytext); yylval.str=strdup(yytext);}
\n       printf("\n");
"="      printf("ASSIGN");
"+"      printf("PLUS");
"*"      printf("MULT");
"("      printf("AP");
")"      printf("FP");
.        ;

