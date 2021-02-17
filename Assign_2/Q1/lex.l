/*  
    Group ID 15
    
    Adarsh 180001001
    Jeevan 180001039
    Ubaid  180001050

    -------------------------------------------------------------

    Question 1:  
    Write a LEX (and YACC) program to identify following helping verbs: 
    {am, is, are, was were, being, been, be ,have, has, had, do, does, 
    did, will, would, shall, should, may, might, must, can, could} in a sentence. 
    For Example- Input (from terminal): you are a nice person

    Output: you: is not a helping verb
    are: is a helping verb
    a:  is not a helping verb
    nice:  is not a helping verb
    person:  is not a helping verb

    --------------------------------------

    How to run?
    ~ lex lex.l
    ~ gcc lex.yy.c
    ~ ./a.out
 */

%{
    #include<ctype.h>  /* Needed for using tolower function */
    int isVerbs(char*); // Function declatation for isVerb

    int n = 23; // total no of helping verbs.
    char* verbs[]= {
        "am", "is", "are", "was", "were", "being", "been", 
        "be ","have", "has", "had", "do", "does", "did", 
        "will", "would", "shall", "should", "may", "might", 
        "must", "can", "could"
    }; // All the helping verbs 

%}

%%
[a-zA-Z]+ {     // Regex to identify all the english words
    printf("%s: ", yytext);
    // checking the words agains helping verbs
    if(isVerbs(yytext)){
        printf("is a helping verb\n");
    }
    else{
        printf("is NOT a helping verb\n");
    }
}
. ;             // skipping all the remaining chatacters/spaces
\n return 1;    // Terminating at the endline.

%%

/*
* isVerbs 
* Detects the given word againt the helping verbs
*/
int isVerbs(char* word){
    
    // converting the word to lower case to 
    // efficiently match againt helping verbs
    int k = 0;
    while(word[k] != '\0'){
        word[k] = tolower(word[k]);
        k++;
    }

    // checking against all the verbs
    for(int i = 0; i < n; ++i){
        if(strcmp(word, verbs[i]) == 0) return 1;
    }
    return 0;
}

int yywrap() {return 1;}

// main function is needed because we do not need a parser
// for this Question.
int main(){
    yylex();
    return 0;
}