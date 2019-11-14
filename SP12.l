%{
    #include<stdio.h>
    #include<stdlib.h>

    externintyylex();
    voidyyerror(char *errmsg);
%}

%token A B NEW_LINE

%%
    S : A AAAAAAAAA E B NEW_LINE {printf("VALID STRING");}
    ;
    E : E A
    | A
    ;
%%

voidyyerror(char *errmsg)
{
	fprintf(stderr,"INVALID STRING\t%s\n",errmsg);
	exit(1);
}

int main()
{
	printf("\nEnter a string: ");
	yyparse();
	return 0;
}

%{
	#include "anb.tab.h"	
%}

%%
    [aA] {return A;}
    [bB] {return B;}
    [\n] {return NEW_LINE;}
    . {returnyytext[0];}
%%
