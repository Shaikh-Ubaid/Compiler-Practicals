 /* Group ID 15
    Adarsh 180001001
    Jeevan 180001039
    Ubaid  180001050

    Question 3:  
    Write a LEX program to count the number of
    (a) Positive and Negative integers
    (b) Positive and Negative fractions 
    i.e. whether the given number is positive integer, negative integer, positive fraction or negative fraction.
    
    Command to Run:
    lex lex.l && gcc lex.yy.c && ./a.out < input.txt 

 */

%{
    int cnt_pos=0,cnt_neg=0,cnt_fpos=0,cnt_fneg=0;
%}

%%

[-][0-9]*[0-9] {cnt_neg++;};
\+?[0-9]*[0-9] {cnt_pos++;};
\+?[0-9]*[.][0-9]* {cnt_fpos++;};
[-][0-9]*[.][0-9]* {cnt_fneg++;};
. ;
%%

int yywrap(){return 1;}

int main(){
    cnt_neg = cnt_neg = 0;
    yylex();
    printf("No of Positive integers: %d\nNo of Negative integers: %d\nNo of Positive Fractions: %d\nNo of Negative Fractions: %d\n",cnt_pos,cnt_neg,cnt_fpos,cnt_fneg);
    return 0;
}