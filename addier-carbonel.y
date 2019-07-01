%{
      #include <stdio.h>

float count=0;
int yylex();
void yyerror(const char *s){
      fprintf(stderr, "%s\n", s);
   };
 void result(float value)
{
    printf("Valor Acumulado=%f\n", value);
}
%}
%token NUMBER
%token PLUS
%token MINUS
%token EQUALS
%token ENDLINE
%token TIMES
%token DIVIDE

%start lines
%%
lines : line | lines line
       ;
line  : ENDLINE | expression ENDLINE {result(count);}
       ;
expression : NUMBER {count+=$1;}
	 | PLUS NUMBER {count+=$2;}
	 | MINUS NUMBER {count-=$2;}
	 | TIMES NUMBER {count*=$2;}
	 | DIVIDE NUMBER {count/=$2;}
	 | EQUALS NUMBER {count=$2;}
	 ;

%%



int main(int argc, char *argv[])
{
    yyparse();
    return(0);
}