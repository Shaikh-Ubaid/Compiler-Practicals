/*  
    Group ID 15
    Adarsh 180001001
    Jeevan 180001039
    Ubaid  180001050
    
    Question 2:  
    Write a LEX - YACC code to recognize a string of the form, any number
    of As followed by any number of Bs (e.g., AA....ABB...B).
    
    How to run?
    lex lex.l && yacc gram.y && gcc lex.yy.c y.tab.c && ./a.out 

    Input is to be taken from the console
 */

%{
    #include<stdio.h> /* for using printf */
    int yylex();  /* delcaring yylex function */
    void yyerror(char*); /* declaring yyerror function */
%}

%%

S: E '\n'  {return 0;}
    ;

E:  A B
    ;

A:      /* A -> epsilon, empty production */ 
    |   'A' A
    ;

B:      /* B -> epsilon, empty production */
    |   'B' B
    ;
    
%%

void yyerror(char* err){ /* defining the yyerror function here */
    fprintf(stderr, "%s\n", err);
}

int main(){
    printf("Enter the input string: ");
    if(yyparse() == 0){          /* if there is no error then yyparse() returns 0 */
        printf("\nString is accepted\n");
    }
    else{                        /* if there is error then yyparse() returns 1 */
        printf("\nString is not accepted\n");
    }
    return 0;
}

