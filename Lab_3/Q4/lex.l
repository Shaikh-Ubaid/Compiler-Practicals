 /*  
    Group ID 15
    Adarsh 180001001
    Jeevan 180001039
    Ubaid  180001050
    
    -------------------------------------------------------------

    Question 4: 
    Write a LEX - YACC code to recognize a valid nested IF statement and
    print the nested depth.
    
    For Example- 
    if(kajfsdkljf){
        if(4+5){
            if(somether thing){

            }
        }
        if(some){

        }
    }
    if(xyz){

    }

    Output: 3
    -------------------------------------------------------------

    How to run?
    lex lex.l && yacc gram.y && gcc lex.yy.c y.tab.c && ./a.out < input.txt
 */

%%

"if" {printf("if"); return 50;}; /* Regex for accepting 'if' */
[(){}] {printf("%s", yytext); return *yytext;} /* Regex for accepting '(', ')', '{', '}' */
.|\n ; /* Regex for skipping every character other than '(', ')', '{', '}' */


%%

int yywrap() {return 1;}