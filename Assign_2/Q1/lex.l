
%{
    int isVerbs(char*);
    char* verbs[]= {
        "am", "is", "are", "was", "were", "being", "been", "be ","have", "has", "had", "do", "does", "did", "will", "would", "shall", "should", "may", "might", "must", "can", "could"
    };
    int n = 23;
%}

%%
[a-zA-Z]+ {

    if(isVerbs(yytext)){
        printf("%s is a helping verb\n", yytext);
    }
    else{
        printf("%s is NOT a helping verb\n", yytext);
    }
}
.|\n ;

%%

int isVerbs(char* word){
    for(int i = 0; i < n; ++i){
        if(strcmp(word, verbs[i]) == 0) return 1;
    }
    return 0;
}

int yywrap() {return 1;}

int main(){
    yylex();
    return 0;
}