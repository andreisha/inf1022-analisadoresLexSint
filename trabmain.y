%{
        #include <stdlib.h>
        #include <stdio.h>
        #include <string.h>

  	FILE * fp;
        int yylex();
        char * output;
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

%token<str> ENTRADA SAIDA FIM FACA VEZES ENQUANTO SE ENTAO SENAO INC ZERA NAME ESPACO FIMFACA FIMENTAO FIMSENAO FIMENQUANTO FIMSE EPSILON;

%token<number> ROWEND NUMBER ASSIGN PLUS AP FP MULT END PROGRAM;
%token<str> id;

%start program
%%
program: PROGRAM lines {printf ("Fim do processo:\n%s\n", $2);};

lines: line {$$ = $1;}
        | line lines {char * result = malloc(strlen($1) + strlen($2) + 1); strcpy(result, $1); strcat(result, ";\n"); strcat(result, $2); $$=result;};

line: statement ROWEND {$$ = $1;};

statement: ENTRADA varlist{fp = fopen("provolone.txt","w");fprintf (fp,"\ninput(%s);\n", $2);}
        | SAIDA varlist {output = (char *)malloc(11+(strlen($2))*sizeof(char)); 
			strcpy(output,"\noutput(");
			strcat(output,$2);
			strcat(output,");\n");}
        | cmds 
        | FIM {	fputs(output,fp);
		fprintf (fp,"\nend of program;\n");fclose(fp); exit(1);}
        
varlist: id varlist {char * result = malloc(strlen($1) + strlen($2) + 1); strcpy(result, $1); strcat(result, ","); strcat(result, $2); $$=result;}
        | id {$$ = $1;};
       
cmds: cmd cmds {char * result = malloc(strlen($1) + strlen($2) + 1); strcpy(result, $1); strcat(result, ";\n"); strcat(result, $2); $$=result;}
        | cmd {$$=$1;}
    
cmd: FACA id VEZES {fprintf(fp,"\ndurante %s vezes faca {\n\n", $2);} ROWEND cmds FIMFACA {fprintf(fp,"\n}\n");fprintf (fp,"\nfim do faca;\n"); $$ = $1;}
	| ENQUANTO id FACA {fprintf(fp,"\nenquanto %s > 0 faca {\n\n", $2);} ROWEND cmds FIMENQUANTO {fprintf(fp,"\n}\n");fprintf (fp,"\nfim do enquanto;\n"); $$ = $1;}
	| SE id ENTAO {fprintf(fp,"\nse %s > 0 entao {\n\n", $2);} ROWEND cmds check FIMENTAO ROWEND SENAO {fprintf(fp,"\n}\n"); fprintf(fp,"\nfim do entao;\n"); fprintf(fp,"senao {\n\n");} ROWEND cmds FIMSENAO {fprintf(fp,"\n}\n");fprintf (fp,"\nfim do senao;\n"); $$ = $1;}
	| SE id ENTAO {fprintf(fp,"\nse %s > 0 entao {\n\n", $2);} ROWEND cmds check FIMSE {fprintf(fp,"\n}\n"); fprintf(fp,"\nfim do se\n");}
        | id ASSIGN id ROWEND {fprintf(fp,"copia(%s,%s);\n",$3,$1);}
	| INC AP id FP ROWEND {fprintf (fp,"incrementa(%s);\n", $3); $$=$3;}
	| ZERA AP id FP ROWEND {fprintf (fp,"zera(%s);\n",$3);};

check: SENAO cmds
        | EPSILON

%%

int main(int argc, char *argv[])
{
    yyparse();
    return(0);
}
