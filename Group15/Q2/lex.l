 /* Group ID 15
    Adarsh 180001001
    Jeevan 180001039
    Ubaid  180001050

    Question 2:  
    You need to build a simple Calculator using LEX and YACC. 
    For Example- Input: 2+2*3
    Output: 8

    Input can be given from terminal or any other interface. 
 */

%{
    
    #define YYSTYPE double  /* overriding type of yystype to be double */
    #include "y.tab.h" /* header file which contains definitions for NUM */
%}

%%
 
[0-9]+(\.[0-9][0-9]*)? {yylval = atof(yytext); return NUM;} /* Regex for accepting integers or floating numbers */
[-+()*/%\n]    {return *yytext;} /* Regex for accepting '-', '+', '(', ')', '*', '/', '%', '\n' */
" " ;   /* Regex for ignoring spaces */
. {printf("Illegal Character found: %s\n", yytext); return 1;} /* Regex for accepting illegal characters and returns 1 so as to raise an error */

%%

int yywrap(){return 1;}