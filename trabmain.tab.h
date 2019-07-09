/* A Bison parser, made by GNU Bison 2.3.  */

/* Skeleton interface for Bison's Yacc-like parsers in C

   Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor,
   Boston, MA 02110-1301, USA.  */

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

/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
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
/* Tokens.  */
#define ENTRADA 258
#define SAIDA 259
#define FIM 260
#define FACA 261
#define VEZES 262
#define ENQUANTO 263
#define SE 264
#define ENTAO 265
#define SENAO 266
#define INC 267
#define ZERA 268
#define NAME 269
#define ESPACO 270
#define FIMFACA 271
#define FIMENTAO 272
#define FIMSENAO 273
#define FIMENQUANTO 274
#define FIMSE 275
#define ROWEND 276
#define NUMBER 277
#define ASSIGN 278
#define PLUS 279
#define AP 280
#define FP 281
#define MULT 282
#define END 283
#define PROGRAM 284
#define id 285




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
#line 15 "trabmain.y"
{
   char *str;
   int  number;
}
/* Line 1529 of yacc.c.  */
#line 114 "trabmain.tab.h"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif

extern YYSTYPE yylval;

