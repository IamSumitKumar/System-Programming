%option noyywrap
%{
    #include<stdio.h>
    #include<stdlib.h>
    externintyylex();
    voidyyerror(char *errmsg);
%}

%token NUM  ID NEW_LINE
%left '+' '-' '*' '/' /*left associativity*/

%%
    S : E NEW_LINE	{printf("\nEXPRESSION VALID");}
    ;
    E : E '+' E 	
    | E '-' E 
    | E '*' E
    | E '/' E
    | NUM
    | ID
    ;
%%

voidyyerror(char *errmsg)
{
	fprintf(stderr,"INVALID\t%s\n",errmsg);
	exit(1);
}

int main()
{
	printf("\nEnter an expression: ");
	yyparse();
	return 0;
}

%{
	#include "validate_expr.tab.h"
%}

%%
    [a-zA-Z]([a-zA-Z0-9])? {return ID;}
    [0-9] {return NUM;}
    [ \t] {;}
    [\n] {returnNEW_LINE;}
    . {returnyytext[0];}
%%