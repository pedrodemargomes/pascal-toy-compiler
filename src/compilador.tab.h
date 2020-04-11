/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015 Free Software Foundation, Inc.

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

#ifndef YY_YY_COMPILADOR_TAB_H_INCLUDED
# define YY_YY_COMPILADOR_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 1
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    PROGRAM = 258,
    ABRE_PARENTESES = 259,
    FECHA_PARENTESES = 260,
    VIRGULA = 261,
    PONTO_E_VIRGULA = 262,
    DOIS_PONTOS = 263,
    PONTO = 264,
    T_BEGIN = 265,
    T_END = 266,
    VAR = 267,
    ATRIBUICAO = 268,
    T_IF = 269,
    T_LABEL = 270,
    T_TYPE = 271,
    T_GOTO = 272,
    T_THEN = 273,
    T_ELSE = 274,
    T_WHILE = 275,
    T_DO = 276,
    T_OR = 277,
    T_AND = 278,
    T_DIV = 279,
    T_NOT = 280,
    T_SUM = 281,
    T_MINUS = 282,
    T_MULT = 283,
    T_MENOR = 284,
    T_MENOR_IGUAL = 285,
    T_MAIOR = 286,
    T_MAIOR_IGUAL = 287,
    T_IGUAL = 288,
    T_DIFERENTE = 289,
    T_WRITE = 290,
    T_READ = 291,
    T_IDENT = 292,
    T_NUMERO = 293,
    IFX = 294
  };
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED

union YYSTYPE
{
#line 14 "compilador.y" /* yacc.c:1909  */

	char *string;
	int number;
	struct NodeBlock *block;
	struct DeclIntegerVariable *declIntVar;
	struct Variable *variable;
	struct NodeStatemet *stmt; 
	struct NodeExpression *expr;
	struct NodeAsignVariable *asign;
	struct NodeWrite *write;

#line 106 "compilador.tab.h" /* yacc.c:1909  */
};

typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_COMPILADOR_TAB_H_INCLUDED  */
