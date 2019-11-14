%{	
    #include<stdio.h>
	int lines=0, letter=0, schar=0, words=0, t=0 ;
%}
%%
    [a-zA-Z] letter++;
    [\n] lines++;
    [\t] words++;
    . schar++;
%%

int main()
{
	yyin=fopen("test.txt", "r");
	yylex();
	t=letter+schar;
	printf("No. of lines = %d\n", lines);
	printf("Total no of characters = %d\n", t);
	return 0;
}