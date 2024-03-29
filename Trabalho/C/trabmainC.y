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

%type <str> lines line statement program cmd cmds varlist check;

%token<str> ENTRADA SAIDA FIM FACA VEZES ENQUANTO SE ENTAO SENAO INC ZERA NAME ESPACO FIMFACA FIMENTAO FIMSENAO FIMENQUANTO FIMSE;

%token<number> ROWEND NUMBER ASSIGN PLUS AP FP MULT END PROGRAM;
%token<str> id;

%start program
%%
program: PROGRAM lines {printf ("Fim do processo:\n%s\n", $2);};

lines: line {$$ = $1;}
        | line lines {char * result = malloc(strlen($1) + strlen($2) + 1); strcpy(result, $1); strcat(result, ";\n"); strcat(result, $2); $$=result;};

line: statement ROWEND {$$ = $1;}

statement: ENTRADA {fp = fopen("provolone.c","w"); fprintf(fp, "#include<stdio.h>\n"); fprintf(fp, "#include<stdlib.h>\n\n"); 
        fprintf(fp, "int main(int argc, char *argv[]){\n");
        fprintf(fp, "int k = argc-1;\n\n");} 
        varlist {fprintf(fp,"\n");}
        | SAIDA varlist {output = (char *)malloc(32+(strlen($2))*sizeof(char)); 
			strcpy(output,"printf(\"%d\\n\", ");
			strcat(output,$2);
			strcat(output,");\n");}
        | cmds 
        | FIM {	fputs(output,fp);
		fprintf (fp,"\nreturn 0;\n}\n");fclose(fp); exit(1);}
        
varlist: id varlist {fprintf(fp, "int %s = atoi(argv[k]);\nk--;\n", $$); char * result = malloc(strlen($1) + strlen($2) + 1); strcpy(result, $1); strcat(result, ","); strcat(result, $2); $$=result;}
        | id {fprintf(fp, "int %s = atoi(argv[k]);\nk--;\n", $$); $$ = $1;};
       
cmds: cmd cmds {char * result = malloc(strlen($1) + strlen($2) + 1); strcpy(result, $1); strcat(result, ";\n"); strcat(result, $2); $$=result;}
        | cmd {$$=$1;}
    
cmd: FACA id VEZES {fprintf(fp,"\nfor(int j = 0; j < %s; j++){\n", $2);} ROWEND lines FIMFACA {fprintf(fp,"}\n"); $$ = $1;}
	| ENQUANTO id FACA {fprintf(fp,"\nint j = %s;\nwhile(j > 0){\n", $2);} ROWEND lines FIMENQUANTO {fprintf(fp,"j--;\n}\n"); $$ = $1;}
	| SE id ENTAO {fprintf(fp,"\nif(%s > 0){\n", $2);} ROWEND lines FIMSE ROWEND check
        | id ASSIGN id {fprintf(fp,"%s = %s;\n",$1,$3);}
	| INC AP id FP {fprintf (fp,"%s++;\n", $3); $$=$3;}
	| ZERA AP id FP {fprintf (fp,"%s = 0;\n",$3);};

check: SENAO {fprintf(fp,"}\n"); fprintf(fp,"else{\n");} ROWEND lines FIMSENAO {fprintf(fp,"}\n");fprintf (fp,"\n"); $$ = $1;}
        | {fprintf(fp,"}\n");} line {$$ = $2;}

%%

int main(int argc, char *argv[])
{
    yyparse();
    return(0);
}
