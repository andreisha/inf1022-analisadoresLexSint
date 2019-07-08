%{
      #include <stdlib.h>
      #include <stdio.h>
      #include <string.h>

  
int yylex();
void yyerror(const char *s){
      fprintf(stderr, "%s\n", s);
   };
void ZERA(int id);
void INC(int id);
 
%}
%union
 {
   char *str;
   int  number;
};
%type <str> line exp term
%type <number> assignment
%start line
%token<str> id
%token<number> id

%start program
%%
program : ENTRADA varlist SAIDA varlist cmds FIM {};
varlist : id varlist {};
       | id {;}
       ;
cmds  : cmd cmds {;}
	| cmd {;}
       ;
cmd : FACA id VEZES cmds FIM {};
	| ENQUANTO id FACA cmds FIM {};
	| SE id ENTAO cmds SENAO cmds {};
	| SE id ENTAO cmds {};
	| id = id {};
	| INC(id) {};
	| ZERA(id) {};

%%

void INC(int id){
	id = id + 1;	
};

void ZERA(int id){
	id = 0;	
};

int main(int argc, char *argv[])
{
    yyparse();
    return(0);
}
