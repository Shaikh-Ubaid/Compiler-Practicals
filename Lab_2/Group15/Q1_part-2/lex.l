 /* Group ID 15
    Adarsh 180001001
    Jeevan 180001039
    Ubaid  180001050

    Question 1_part-2

    Command to run:
    lex lex.l && gcc lex.yy.c && ./a.out < input.txt > output.txt

 */


%{
   int pos_of_char;
%}

%%


[a-zA-Z_] {printf("%c",('a'+(yytext[0]-'a'+pos_of_char)%26));} /* Regex for accepting identifiers */
. {printf("%s",yytext);}
%%

int yywrap(){return 1;}

int main(){
    pos_of_char=2;
    yylex();
    
}