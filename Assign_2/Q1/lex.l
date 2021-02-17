
%{
    #include<ctype.h>
    int isVerbs(char*);
    char* verbs[]= {
        "am", "is", "are", "was", "were", "being", "been", "be ","have", "has", "had", "do", "does", "did", "will", "would", "shall", "should", "may", "might", "must", "can", "could"
    };
    int n = 23;
%}

%%
[a-zA-Z]+ {
    printf("%s: ", yytext);
    if(isVerbs(yytext)){
        printf("is a helping verb\n");
    }
    else{
        printf("is NOT a helping verb\n");
    }
}
. ;
\n return 1;

%%

int isVerbs(char* word){
    int k = 0;
    while(word[k] != '\0'){
        word[k] = tolower(word[k]);
        k++;
    }

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