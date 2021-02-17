/*  Group ID 15
    Adarsh 180001001
    Jeevan 180001039
    Ubaid  180001050

    Question 2:  
    You need to build a simple Calculator using LEX and YACC. 
    For Example- Input: 2+2*3
    Output: 8

    Input can be given from terminal or any other interface. 
 */

%{
 #define YYSTYPE double /* overriding type of yystype to be double */
 #include <stdio.h> /* for using printf */
 int yylex();
 void yyerror(char *);
%}

%start S
%left '+' '-'
%left '*' '/' '%'
%left '(' ')'
%token NUM

%%

S : E '\n' { printf("Result: %f\n", $1); return 0; }
  ;

E : E '+' E {$$ = $1 + $3;}
  | E '-' E {$$ = $1 - $3;}
  | E '*' E {$$ = $1 * $3;}
  | E '/' E {$$ = $1 / $3;}
  | E '%' E {$$ = (int)$1 % (int)$3;}
  | F       {$$ = $1;}
  ;

F : '+' F           { $$ = $2;}
  | '-' F           { $$ = -1 * $2;}
  | G               { $$ = $1;}
  ;

G : '(' E ')'        { $$ = $2;}
  | NUM              { $$ = $1;}
  ;

%%


void yyerror(char *s) {
 fprintf(stderr, "%s\n", s);
}


int main(void) {
 yyparse();  
 return 0;
} 