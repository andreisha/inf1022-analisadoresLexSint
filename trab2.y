%{
      #include <stdlib.h>
      #include <stdio.h>
      #include <string.h>

  
int yylex();
void yyerror(const char *s){
      fprintf(stderr, "%s\n", s);
   };
void zera(int num);
void inc(int num);
 
%}
%union
 {
   char *str;
   int  number;
};
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
%token<number> ROWEND;
%token<number> NUMBER;
%token<number> ASSIGN;
%token<number> PLUS;
%token<number> AP;
%token<number> FP;
%token<number> MULT;
%token<number> END;
%token<number> PROGRAM;
%token<number> id;

%start program
%%
program: ENTRADA varlist SAIDA varlist cmds FIM;
varlist: id varlist {};
       | id {}
       ;
cmds: cmd cmds {}
	| cmd {}
       ;
cmd: FACA id VEZES cmds FIM {};
	| ENQUANTO id FACA cmds FIM {};
	| SE id ENTAO cmds SENAO cmds {};
	| SE id ENTAO cmds {};
        | id ASSIGN id {$1 = $3;};
	| INC id  {inc($2);};
	| ZERA id {zera($2);};
%%

void inc(int num){
	num = num + 1;	
};

void zera(int num){
	num = 0;	
};

int main(int argc, char *argv[])
{
    yyparse();
    return(0);
}
