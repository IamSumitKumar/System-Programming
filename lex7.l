%option noyywrap
%{
    #include<stdio.h>
    #include<string.h>
    charch[8];
    inti,j;
%}

char [a-zA-Z]

%%
{char}+ {for(i=yyleng;i>=0;i--){
					for( j=0;j<i;j++)
					printf("%c",yytext[j]);
				printf("\n");
				}
		}
%%

int main()
{
	yylex();
	return 0;
}