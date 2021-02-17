 /* Group ID 15
    Adarsh 180001001
    Jeevan 180001039
    Ubaid  180001050

    Question 1:  
    You need to check if given arithmetic expression is valid or invalid. 
    For Example- Input:  x+y = z
    Output: Invalid Arithmetic Expression

    Input: x= y+3
    Output: Valid Arithmetic Expression
 */


%{
    #include "y.tab.h"  /* header file which contains definitions for NUM */
%}

%%
 
[a-zA-Z_][a-zA-Z0-9_]* {return ID;} /* Regex for accepting identifiers */
[0-9]+(\.[0-9][0-9]*)? {return NUM;} /* Regex for accepting integers or floating numbers */
[-+()*/%=\n]    {return *yytext;} /* Regex for accepting '-', '+', '(', ')', '*', '/', '%', '\n' */
" " ;   /* Regex for ignoring spaces */
. {printf("Illegal Character found: %s\n", yytext); return 1;} /* Regex for accepting illegal characters and returns 1 so as to raise an error */

%%

int yywrap(){return 1;}