 /* Group ID 15
    Adarsh 180001001
    Jeevan 180001039
    Ubaid  180001050

    Question 3:  
    Write a LEX code to take input from text file and count the number of
    characters.
    
    Command to Run:
    lex lex.l && gcc lex.yy.c && ./a.out
 */

%{
    int cnt; /* declaring count variable here */
%}

%%
 
\n  ; /* skip newline character */
" " ; /* skip spaces */
.   {   /* character found, print it and increment count */
        printf("character: %s\n", yytext); 
        cnt++;
    } 
%%

int yywrap() {return 1;}

int main(){
    cnt = 0; /* initialize count to 0 */
    yyin = fopen("input.txt","r"); /* open the input file in read mode */
    yylex();
    fclose(yyin); /* close the file after use */
    printf("The count of characters is: %d\n", cnt); /* printing the result */
    return 0;
}