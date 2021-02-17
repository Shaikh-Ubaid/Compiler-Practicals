
%{
    #include<stdio.h>
    #include<bits/stdc++.h>
    int yylex();
    void yyerror(char*);
    int valid = 1;
    set<string> isVerbs = {
        "am", "is", "are", "was", "were", "being", "been", "be ","have", "has", "had", "do", "does", "did", "will", "would", "shall", "should", "may", "might", "must", "can", "could"
    };

%}

%%

S: 




%%

void yyerror(char *err){
    valid = 0;
    fprintf(stderr, "%s\n", err);
}

int main(){
    yyparse();

}

