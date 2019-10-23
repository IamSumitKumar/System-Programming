%option noyywrap
%{
    #include<stdio.h>
    int length=0;
    int temp=0,i;
    char a[16];
%}

letter [a-zA-Z]
not_a_letter.|[\n]

%%
{letter}
{
    temp++;
    if(temp>length)
    {
        length=temp;
        for(i=length;i>0;i--)
            a[i]=yytext[i-length];
    }
}
{not_a_letter}
{
    temp=0;
}
%%

int main()
{
	yyin=fopen("text.txt","r");
	yylex();
	printf("\nLongest word is: ");
    for(i=0;i<13;i++)
        printf("%c",a[i]);
	printf("\nLength: %d ",length);	
	return 0;
}