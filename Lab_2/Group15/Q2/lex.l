 /* Group ID 15
    Adarsh 180001001
    Jeevan 180001039
    Ubaid  180001050

    Question 2:  
    Write a LEX - YACC code to recognize a string of the form, any number
    of As followed by any number of Bs (e.g., AA....ABB...B).
    
    Command to Run:
   lex lex.l && yacc gram.y && gcc lex.yy.c y.tab.c && ./a.out
 */


%%

A return 'A'; /* returning 'A' to Yacc Program */
B return 'B'; /* returning 'B' to Yacc Program */
. {printf("Illegal Character found: %s\n", yytext); return 1;} /* Regex for accepting illegal characters and returns 1 so as to raise an error */ 
\n return '\n'; /* returning a '\n' to the Yacc Program indicating end of input */

%%

int yywrap(){return 1;} /* yywrap() return 1 on exhaustion of input */