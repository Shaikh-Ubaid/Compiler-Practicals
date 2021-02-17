




%{
    #include<stdio.h> /* for using printf */
    int yylex();
    void yyerror(char*);
%}

%%

E:
 | '(' E ')' E
 | '{' E '}' E
 ;

%%

void yyerror(char* err){
    printf("\nParenthesis are NOT Balanced\n");
}

int main(){
    if(yyparse() == 0){
        printf("\nParenthesis are Balanced\n");
    }
    return 0;
}

