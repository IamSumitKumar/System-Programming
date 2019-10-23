%option noyywrap
%{
    #include<stdio.h>
    char *a[16];
    inti=0;
%}

identint|float|main|void|double

%%
    {ident}+ {a[i++]=yytext;}
%%

void main()
{
	yyin=fopen("test.c","r");
	printf("\nIdentifiers are:\n");
	yylex();
	for(i=0;i<5;i++)
		printf("%s",a[i]);
}