/* A Bison parser, made by GNU Bison 3.0.5.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

#ifndef YY_YY_TRABMAIN_TAB_H_INCLUDED
# define YY_YY_TRABMAIN_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    ENTRADA = 258,
    SAIDA = 259,
    FIM = 260,
    FACA = 261,
    VEZES = 262,
    ENQUANTO = 263,
    SE = 264,
    ENTAO = 265,
    SENAO = 266,
    INC = 267,
    ZERA = 268,
    NAME = 269,
    ESPACO = 270,
    FIMFACA = 271,
    FIMENTAO = 272,
    FIMSENAO = 273,
    FIMENQUANTO = 274,
    FIMSE = 275,
    ROWEND = 276,
    NUMBER = 277,
    ASSIGN = 278,
    PLUS = 279,
    AP = 280,
    FP = 281,
    MULT = 282,
    END = 283,
    PROGRAM = 284,
    id = 285
  };
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED

union YYSTYPE
{
#line 14 "trabmain.y" /* yacc.c:1910  */

   char *str;
   int  number;

#line 90 "trabmain.tab.h" /* yacc.c:1910  */
};

typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_TRABMAIN_TAB_H_INCLUDED  */
