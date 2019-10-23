%option noyywrap
%{
    #include<stdio.h>
    #include<stdlib.h>

    externintyylex();
    voidyyerror(char *error);
%}

%token A B NEW_LINE

%%
    S : E NEW_LINE {printf("Valid String");}
    ;
    E : A E B
    | A B
    ;
%%

voidyyerror(char *error)
{
	fprintf(stderr,"INVALID STRING %s\n",error);
	exit(1);
}

intmain()
{
	printf("\nEnter the string: ");
	yyparse();
	return 0;
}

%{
    #include "anbn.tab.h"
%}

%%
    [aA] {return A;}
    [bB] {return B;}
    [\n] {return NEW_LINE;}
    . {returnyytext[0];}
%%