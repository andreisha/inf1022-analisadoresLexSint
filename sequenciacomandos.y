%{
      #include <stdlib.h>
      #include <stdio.h>
      #include <string.h>

  
int yylex();
void yyerror(const char *s){
      fprintf(stderr, "%s\n", s);
   };

 
%}
%union
 {
   char *str;
   int  number;
};
%type <str> zeilen zeile aussage ausdruck term program;
%token<str> NAME
%token<number> ZEILENENDE
%token<number> ZAHL
%token<number> ASSIGN
%token<number> PLUS
%token<number> AP
%token<number> FP
%token<number> MULT
%token<number> END
%token<number> PROGRAM


%start program
%%
program : PROGRAM zeilen END ZEILENENDE {printf("Codigo Objeto :\n %s\n", $2);exit(1);};
zeilen : zeile {$$=$1;};
       | zeilen zeile {char *result=malloc(strlen($1) + strlen($2) + 1);strcpy(result, $1);strcat(result,";");strcat(result,$2);$$=result;}
       ;
zeile  : aussage ZEILENENDE {$$=$1;}
       ;
aussage : NAME ASSIGN ausdruck  {char *result=malloc(strlen($1) + strlen($3) + 1);strcpy(result, $1);strcat(result,"=");strcat(result, $3);$$=result;}
ausdruck : ausdruck PLUS term {char *result = malloc(strlen($1) + strlen($3) + 1);
  strcpy(result, $1);strcat(result,"+");strcat(result, $3);$$=result;}
   |
   term {$$=$1;};
term : AP ausdruck FP {char *result = malloc(strlen($2)+2); strcpy(result,"{");strcat(result,$2);strcat(result,"}");$$=result;}
   |
   NAME {$$=$1;};


%%



int main(int argc, char *argv[])
{
    yyparse();
    return(0);
}
