 /* Group ID 15
    Adarsh 180001001
    Jeevan 180001039
    Ubaid  180001050

    Question 3:  
    Write a LEX program to count the number of comments in a given C
    program file.
    
    Command to Run:
    lex lex.l && gcc lex.yy.c && ./a.out < input.txt 

 */

%{
    int cnt;
%}

%%


"//".*\n {printf("Comment Found: %s", yytext); cnt++;}
"/*"(.|\n)*"*/" {printf("Comment Found: %s\n", yytext); cnt++;}

. ;
\n ;

%%

int yywrap(){return 1;}

int main(){
    cnt = 0;
    yylex();
    printf("The count of comments is: %d\n", cnt);
    return 0;
}