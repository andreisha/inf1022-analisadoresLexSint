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
%type <str> lines line statement program cmd cmds varlist;
%token<str> ENTRADA
%token<str> SAIDA;
%token<str> FIM;
%token<str> FACA;
%token<str> VEZES;
%token<str> ENQUANTO;
%token<str> SE;
%token<str> ENTAO;
%token<str> SENAO;
%token<str> INC;
%token<str> ZERA;
%token<str> NAME;
%token<str> ESPACO;
%token<str> FIMFACA;
%token<str> FIMENTAO;
%token<str> FIMSENAO;
%token<str> FIMENQUANTO;
%token<str> FIMSE;
%token<number> ROWEND;
%token<number> NUMBER;
%token<number> ASSIGN;
%token<number> PLUS;
%token<number> AP;
%token<number> FP;
%token<number> MULT;
%token<number> END;
%token<number> PROGRAM;
%token<str> id;

%start program
%%
program: PROGRAM lines ROWEND {printf ("Fim do processo:\n%s\n", $2); exit(1);};

lines: line {$$ = $1;};
          | lines line {char * result = malloc(strlen($1) + strlen($2) + 1); strcpy(result, $1); strcat(result, ";\n"); strcat(result, $2); $$=result;};

line: statement ROWEND {$$ = $1;};

statement: ENTRADA varlist{printf ("input(%s);\n", $2);};
        | SAIDA varlist {printf ("output(%s);\n", $2);};
        | cmds;
        | FIM {printf ("end of program;%s\n", $1);};
    
varlist: id varlist {char * result = malloc(strlen($1) + strlen($2) + 1); strcpy(result, $1); strcat(result, ","); strcat(result, $2); $$=result;};
       | id {$$ = $1;};
       
cmds: cmd cmds {$$=$1};
	| cmd {$$=$1};
    
cmd: FACA id VEZES cmds FIMFACA {};
	| ENQUANTO id FACA cmds FIMENQUANTO {};
	| SE id ENTAO cmds FIMENTAO SENAO cmds FIMSENAO{};
	| SE id ENTAO cmds FIMSE{};
        | id ASSIGN id {$1 = $3;};
	| INC id  {printf ("incrementa(%s);\n",$2);};
	| ZERA id {printf ("zera(%s);\n",$2);};

%%

int main(int argc, char *argv[])
{
    yyparse();
    return(0);
}
