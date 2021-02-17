/*  
    Group ID 15
    Adarsh 180001001
    Jeevan 180001039
    Ubaid  180001050
    
    -------------------------------------------------------------

    Question 2: 
    Write a LEX (and YACC) program that can take c program file as an input and can check if there are balance parenthesis ( () and {} ) or not? 
    
    For Example- 
    Input: hello world C program file (or any C program file)
    Output: Parenthesis are balanced
    Or Parenthesis are not balanced

    -------------------------------------------------------------
    
    How to run?
    lex lex.l && yacc gram.y && gcc lex.yy.c y.tab.c && ./a.out < input.txt
 */

%{
    #include<stdio.h> /* for using printf */
    int yylex();  /* delcaring yylex function */
    void yyerror(char*); /* declaring yyerror function */
%}

%%

E:                    /* empty production E -> epsilon*/
 | '(' E ')' E
 | '{' E '}' E
 ;

%%

void yyerror(char* err){
    fprintf(stderr, "%s\n", err);
}

int main(){
    if(yyparse() == 0){          /* if there is no error then yyparse() returns 0 */
        printf("\nParenthesis are Balanced\n");
    }
    else{                        /* if there is error then yyparse() returns 1 */
        printf("\nParenthesis are NOT Balanced\n");
    }
    return 0;
}

