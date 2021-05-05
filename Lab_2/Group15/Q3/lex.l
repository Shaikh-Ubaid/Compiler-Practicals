 /* Group ID 15
    Adarsh 180001001
    Jeevan 180001039
    Ubaid  180001050

    Question 3:  
    Write a LEX code to take input from text file and count the number of
    characters.
    
    Command to Run:
    lex lex.l && gcc lex.yy.c && ./a.out < input.txt 

 */

%{
    int cnt;
%}

%%
 
\n ;
" " ;
. {printf("character: %s\n", yytext); cnt++;}
%%

int yywrap(){return 1;}

int main(){
    cnt = 0;
    yylex();
    printf("The count of characters is: %d\n", cnt);
    return 0;
}