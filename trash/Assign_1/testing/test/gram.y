%{
 #include <stdio.h>
 #include <math.h>
 void yyerror(char *);
 int yylex(void);
 #define YYSTYPE double
 int valid = 1;
%}

%start S
%token ID
%left '*' '/'
%left '+'
%left '-'

%%

S : E '\n' { printf("\nResult: %f", $1); return $1;}
  ;

E : E '+' E   { $$ = $1 + $3;}
  | E '/' E   { $$ = $1 / $3;}
  | '(' E ')' { $$ = $2; }
  | ID { $$ = $1; } 
  ;

%%


void yyerror(char *s) {
 valid = 0;
 fprintf(stderr, "%s\n", s);
}


int main(void) {
 yyparse();
 if(valid){
     printf("\nValid\n");
 }
 else{
     printf("Invalid\n");
 }

 return 0;
} 