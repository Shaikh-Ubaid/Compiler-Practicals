%{
    #include "y.tab.h"
%}

%%
 
[a-zA-Z]+ {return ID;}
[-+()$]    {return *yytext;}
. {printf("Illegal Character found: %s\n", yytext); return -1;}
\n return -1;

%%

int yywrap(){return 1;}