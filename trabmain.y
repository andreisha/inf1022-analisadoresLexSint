%{
        #include <stdlib.h>
        #include <stdio.h>
        #include <string.h>

  	FILE * fp;
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
program: PROGRAM lines {printf ("Fim do processo:\n%s\n", $2);};

lines: line {$$ = $1;}
          | line lines {char * result = malloc(strlen($1) + strlen($2) + 1); strcpy(result, $1); strcat(result, ";\n"); strcat(result, $2); $$=result;};

line: statement ROWEND {$$ = $1;};

statement: ENTRADA varlist{fp = fopen("provolone.txt","w");fprintf (fp,"\ninput(%s);\n", $2);};
        | SAIDA varlist {printf ("\noutput(%s);", $2);};
        | cmds ;
        | FIM {fprintf (fp,"\nend of program;\n");fclose(fp); exit(1);};
        | FIMFACA {fprintf (fp,"\nfim do faca;\n"); $$ = $1;};

varlist: id varlist {char * result = malloc(strlen($1) + strlen($2) + 1); strcpy(result, $1); strcat(result, ","); strcat(result, $2); $$=result;}
       | id {$$ = $1;};
       
cmds: cmd cmds {char * result = malloc(strlen($1) + strlen($2) + 1); strcpy(result, $1); strcat(result, ";\n"); strcat(result, $2); $$=result;}

        | ROWEND cmd {$$=$2;}
    
cmd: FACA id VEZES {fprintf(fp,"\ndurante %s vezes faca {\n\n", $2);} cmds {fprintf(fp,"\n}\n"); $$ = $1;}
	| ENQUANTO id FACA cmds FIMENQUANTO {}
	| SE id ENTAO cmds FIMENTAO SENAO cmds FIMSENAO{}
	| SE id ENTAO cmds FIMSE{}
        | id ASSIGN id {fprintf(fp,"copia(%s,%s);\n",$3,$1);}
	| INC AP id FP {fprintf (fp,"incrementa(%s);\n", $3); $$=$3;}
	| ZERA AP id FP {fprintf (fp,"zera(%s);",$3);};

%%

int main(int argc, char *argv[])
{
    yyparse();
    return(0);
}
