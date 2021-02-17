

%%
[(){}] {printf("%s", yytext); return *yytext;}
.|\n ;


%%

int yywrap() {return 1;}
