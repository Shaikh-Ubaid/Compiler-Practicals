/*  
    Group ID 15
    Adarsh 180001001
    Jeevan 180001039
    Ubaid  180001050
    
    -------------------------------------------------------------

    Question 2: 
    Write a LEX - YACC code to recognize a valid nested IF statement and
    print the nested depth.
    
    For Example- 
    Input:
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

%{
    #include<stdio.h> /* for using printf */
    int yylex();  /* delcaring yylex function */
    void yyerror(char*); /* declaring yyerror function */
    int max(int, int); /* declaring user defined max function */
    int max_depth = 0; /* initially max depth is 0 */
%}

%token IF 50

%%

E:                              {$$ = 0;}   /* empty production E -> epsilon*/
 | IF '(' ')' '{' E '}' E       {$$ = max($5 + 1, $7); max_depth = max($$, max_depth); printf("$$ = %d\n", $$);}
 ;

%%

void yyerror(char* err){
    fprintf(stderr, "%s\n", err);
}

/* user-defined max function, it returns the max of given two numbers */
int max(int a, int b){
    return (a > b)? a:b;
}

int main(){
    if(yyparse() == 0){          /* if there is no error then yyparse() returns 0 */
        printf("\nThe maximum depth found is = %d\n", max_depth);
    }
    else{                        /* if there is error then yyparse() returns 1 */
        printf("\nThe given nested ifs are invalid!\n");
    }
    return 0;
}

