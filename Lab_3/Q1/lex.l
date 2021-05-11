 /* Group ID 15
    Adarsh 180001001
    Jeevan 180001039
    Ubaid  180001050

    -------------------------------------------------------------

    Question 1:  
    Write a LEX program to recognize a valid arithmetic expression and
    identify the operands and operators present. 

    For example-
    Input: a+b 
    
    Output:
    total operands = 2
    total operators = 1

    How to run?
    lex lex.l && gcc lex.yy.c && ./a.out
 */

%{
    #include <stdio.h> /* for using printf */
    int operand_cnt, operator_cnt; /* declaring variables for storing counts */
%}

%%

[a-zA-Z_][a-zA-Z0-9_]* {printf("Operand: %s\n", yytext); operand_cnt++;} /* Regex for accepting identifiers */
[0-9]+(\.[0-9][0-9]*)? {printf("Operand: %s\n", yytext); operand_cnt++;} /* Regex for accepting integers or floating numbers */
[-+*/%]    {printf("Operator: %s\n", yytext); operator_cnt++;} /* Regex for accepting '-', '+', '*', '/', '%' */
[\(\)\{\}\[\]] ;   /* Regex for ignoring/skipping brackets */
" " ;   /* Regex for ignoring/skipping spaces */
\n return 1; /* return when we get a new line character */
. {printf("Illegal Character found: %s\nExiting...\n", yytext); exit(1);} /* Regex for accepting illegal characters and exits */

%%

int yywrap(){return 1;}

int main(){
    /* initializing counts to 0 */
    operand_cnt = 0;
    operator_cnt = 0;
    printf("Enter an arithmetic expression: "); /* prompt user for input */
    yylex(); /* our lexical analyzer starts from here */

    /* printing the results */
    printf("Number of operands = %d\n", operand_cnt);
    printf("Number of operators = %d\n", operator_cnt);
    return 0;
}