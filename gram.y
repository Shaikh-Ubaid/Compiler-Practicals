%{
 #include <stdio.h>
 int yylex();
 void yyerror(char *);
 int valid = 1;
%}

%start S
%token ID

%%

S : E '$'    
  ;

E : E '+' T 
  | E '-' T 
  | T       
  ;

T : ID
  | '(' E ')'
  ;


%%


void yyerror(char *s) {
 valid = 0;
 fprintf(stderr, "%s\n", s);
}


int main(void) {
 
 yyparse();
 if(valid){
     printf("Valid\n");
 }
 else{
     printf("Invalid\n");

 }

 return 0;
} 