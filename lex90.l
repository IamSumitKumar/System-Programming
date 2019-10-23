%option noyywrap
%{
    #include<stdio.h>
    #include<stdlib.h>
    externintyylex();
    voidyyerror(char *errmsg);
%}

%union{
	float f;
}
%token  NUM
%type  E T F

%%
    S : E 		 {printf("%f\n",$1);} 		
    ;
    E : E '+' T  {$$ = $1 + $3;}
    | E '-' T  {$$ = $1 - $3;}
    | T         {$$ = $1;}
    ;
    T : T '*' F  {$$ = $1 * $3;}
    | T '/' F  {$$ = $1 / $3;}
    | F        {$$ = $1;}
    ;
    F : '(' E ')' {$$ = $2;}
    | '-' F     {$$ = -$2;}
    |NUM		  {$$ = $1;}
    ;
%%

voidyyerror(char *errmsg)
{
    fprintf(stderr, "%s\n",errmsg);
    exit(1);
}

int main()
{
    yyparse();
    return 0;
}

%{
    #include<stdio.h>
    #include<stdlib.h>
    #include "calc.tab.h"
%}

%%
    [0-9]+(\.[0-9]+)? 	{yylval.f = atof(yytext); return NUM;}
    [-+*/]				{returnyytext[0];}
    [ \t\n]				{;}
%%