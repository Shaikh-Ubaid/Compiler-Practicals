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
 #include <stdio.h> /* for using printf */
 int yylex();
 void yyerror(char *);
 int valid = 1;  /* variable to hold status of validation */
%}

%left '+' '-'
%left '*' '/' '%'
%left '(' ')'
%token ID
%token NUM

%%

S : ID '=' E '\n' {return 0;}
  | E '\n' {return 0;}
  ;

E : E '+' E 
  | E '-' E
  | E '*' E
  | E '/' E
  | E '%' E
  | '(' E ')'        
  | ID
  | NUM
  ;

%%


void yyerror(char *s) {
 valid = 0;      /* if there is error, set valid to 0 */
 fprintf(stderr, "%s\n", s);
}


int main(void) {
 
 yyparse();
 if(valid){
     printf("Valid Arithmetic Expression\n");
 }
 else{
     printf("Invalid Arithmetic Expression\n");
 }
 return 0;
} 