 /* Group ID 15
    Adarsh 180001001
    Jeevan 180001039
    Ubaid  180001050

    Question 1:  
    Write a LEX program to recognize a valid arithmetic expression and
    identify the operands and operators present. (For example in a+b, total operands = 2, operator=1). 
    
    For Example- Input: 2+2*3
    Output: 8

    Input can be given from terminal or any other interface. 
 */

%{
    #include <stdio.h>
    int operand_cnt, operator_cnt; 
%}

%%

[a-zA-Z_][a-zA-Z0-9_]* {printf("Operand: %s\n", yytext); operand_cnt++;} /* Regex for accepting identifiers */
[0-9]+(\.[0-9][0-9]*)? {printf("Operand: %s\n", yytext); operand_cnt++;} /* Regex for accepting integers or floating numbers */
[-+*/%]    {printf("Operator: %s\n", yytext); operator_cnt++;} /* Regex for accepting '-', '+', '(', ')', '*', '/', '%', '\n' */
[\(\)\{\}\[\]] ;   /* Regex for ignoring brackets */
" " ;   /* Regex for ignoring spaces */
\n return 1;
. {printf("Illegal Character found: %s\nExiting...\n", yytext); exit(1);} /* Regex for accepting illegal characters and exits */

%%

int yywrap(){return 1;}

int main(){
    /* initializing counts to 0 */
    operand_cnt = 0;
    operator_cnt = 0;
    yylex(); /* calling the yylex() function here */

    /* printing the results */
    printf("Number of operands = %d\n", operand_cnt);
    printf("Number of operators = %d\n", operator_cnt);
    return 0;
}