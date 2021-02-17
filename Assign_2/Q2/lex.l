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

%%
[(){}] {printf("%s", yytext); return *yytext;} /* Regex for accepting '(', ')', '{', '}' */
.|\n ; /* Regex for skipping every character other than '(', ')', '{', '}' */


%%

int yywrap() {return 1;}
