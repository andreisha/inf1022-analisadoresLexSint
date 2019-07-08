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

%token<str> ENTRADA SAIDA FIM FACA VEZES ENQUANTO SE ENTAO SENAO INC ZERA NAME ESPACO FIMFACA FIMENTAO FIMSENAO FIMENQUANTO FIMSE;

%token<number> ROWEND NUMBER ASSIGN PLUS AP FP MULT END PROGRAM;
%token<str> id;

%start program
%%
program: PROGRAM lines ROWEND {printf ("Fim do processo:\n%s\n", $2); exit(1);};

lines: line {$$ = $1;};
          | line lines {char * result = malloc(strlen($1) + strlen($2) + 1); strcpy(result, $1); strcat(result, ";\n"); strcat(result, $2); $$=result;};

line: statement ROWEND {$$ = $1;};

statement: ENTRADA varlist{printf ("input(%s);\n", $2);};
        | SAIDA varlist {printf ("output(%s);", $2);};
        | cmds ;
        | FIM {printf ("\nend of program;\n");};
        | FIMFACA {printf ("\nfim do faca;\n"); $$ = $1;};

varlist: id varlist {char * result = malloc(strlen($1) + strlen($2) + 1); strcpy(result, $1); strcat(result, ","); strcat(result, $2); $$=result;};
       | id {$$ = $1;};
       
cmds: cmd cmds {char * result = malloc(strlen($1) + strlen($2) + 1); strcpy(result, $1); strcat(result, ";\n"); strcat(result, $2); $$=result;};
	| cmd ROWEND {$$=$1;};
        | ROWEND cmd {$$=$2;};
    
cmd: FACA id VEZES cmds {printf("\ndurante %s vezes :", $2); $$ = $1;};
	| ENQUANTO id FACA cmds FIMENQUANTO {};
	| SE id ENTAO cmds FIMENTAO SENAO cmds FIMSENAO{};
	| SE id ENTAO cmds FIMSE{};
        | id ASSIGN id {printf("\ncopia(%s,%s);",$3,$1);};
	| INC AP id FP {printf ("\nincrementa(%s);", $3); $$=$3;};
	| ZERA AP id FP {printf ("\nzera(%s);",$3);};

%%

int main(int argc, char *argv[])
{
    yyparse();
    return(0);
}
