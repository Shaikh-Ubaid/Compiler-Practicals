%{
    #define YYSTYPE double
    #include "y.tab.h"
    #include <stdlib.h>
%}

%%
 
[a-zA-Z_][a-zA-Z0-9_]* {return ID;}
[0-9]+ { yylval = atof(yytext); return ID;}
[-+*/()=]    {return *yytext;}
" " ;
. {printf("Illegal Character found: %s\n", yytext); return -1;}
\n {return yytext[0]; return -1;}

%%

int yywrap(){return 1;}