%{
      #include <stdlib.h>
      #include <stdio.h>
      #include <string.h>
int yylex();
void yyerror(const char *s) {
      fprintf(stderr, "%s\n", s);
   };
%}
%union
 {
    char *str;
    int number;
 };
%type <str> lines line statement expression term program;
%token<str> NAME;
%token<number> ROWEND;
%token<number> NUMBER;
%token<number> ASSIGN;
%token<number> PLUS;
%token<number> AP;
%token<number> FP;
%token<number> MULT;
%token<number> END;
%token<number> PROGRAM;
%start program
%%
program: PROGRAM lines END ROWEND {printf ("Codigo Objeto: \n%s\n", $2); exit(1);};
lines:      line {$$ = $1;};
          | line line {char * result = malloc(strlen($1) + strlen($2) + 1); strcpy(result, $1); strcat(result, ";"); strcat(result, $2); $$=result;};
line:       statement ROWEND {$$ = $1;};
statement:  NAME ASSIGN expression {char * result = malloc(strlen($1) + strlen($3) + 1); strcpy(result, $1); strcat(result, "="); strcat(result, $3); $$=result;}
expression: expression PLUS term {char * result = malloc(strlen($1) + strlen($3) + 1); strcpy(result, $1); strcat(result, ""); strcat(result, $3); $$=result;}
          | term {$$ = $1;};
term:       AP expression FP {char * result = malloc(strlen($2) + 2); strcpy(result, "{"); strcat(result, $2); strcat(result, "}");$$=result;}
          | NAME {$$ = $1;};
%%
int main(int argc, char *argv[])
{
    yyparse();
    return(0);
}