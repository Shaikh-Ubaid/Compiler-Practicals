/*  
    Group ID 15
    Adarsh 180001001
    Jeevan 180001039
    Ubaid  180001050
    
    
    
    How to run?
    lex lex.l && yacc gram.y && gcc lex.yy.c y.tab.c && ./a.out 
 */

%{
    #include<stdio.h> /* for using printf */
    int yylex();  /* delcaring yylex function */
    void yyerror(char*); /* declaring yyerror function */
%}

%%

E:                    /* empty production E -> epsilon*/
    |   'A' E 'B'
    |   'A' E
    |   E 'B'
    ;
    
%%

void yyerror(char* err){
    fprintf(stderr, "%s\n", err);
}

int main(){
    if(yyparse() == 0){          /* if there is no error then yyparse() returns 0 */
        printf("\nString is accepted\n");
    }
    else{                        /* if there is error then yyparse() returns 1 */
        printf("\nString is not accepted\n");
    }
    return 0;
}

