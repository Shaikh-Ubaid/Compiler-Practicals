/*  
    Group ID 15
    
    Adarsh 180001001
    Jeevan 180001039
    Ubaid  180001050

    -------------------------------------------------------------

    Question 2:  
    Write a LEX program to count the number of printf and scanf statements in given C subroutine.

    --------------------------------------

    How to run?
    lex lex.l && gcc lex.yy.c && ./a.out < test.c

    Input: 
    A C program with 2 scanf's and 1 printf.


    output:
    No of scanf found: 2
    No of printf found: 1

 */

%{
    #include<ctype.h>  /* Needed for using tolower function */
    int isWord(char*); // Function declatation for checking

    int nscanf = 0; // total no of scanf.
    int nprintf = 0; // total no of printf.
    
%}

%%
[a-zA-Z]+ {     // Regex to identify all the english words
    isWord(yytext);
    }
\n ;
. ;             // skipping all the remaining chatacters/spaces

%%

/*
* isWord
* Detects the given word againt the helping printf and scanf
*/
int isWord(char* word){
    
    // strcmp returns 0 when str1 is equal to str2
    if(strcmp(word, "scanf") == 0) nscanf++;
    if(strcmp(word, "printf") == 0) nprintf++;

    return 0;
}

int yywrap() {return 1;}

// main function is needed because we do not need a parser
// for this Question.
int main(){
    yylex();

    printf("\nNo of scanf found: %d\n",nscanf);
    printf("No of printf found: %d\n",nprintf);
    
    return 0;
}