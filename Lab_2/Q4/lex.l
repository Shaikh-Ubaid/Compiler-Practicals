 /* Group ID 15
    Adarsh 180001001
    Jeevan 180001039
    Ubaid  180001050

    Question 4:  
    Write a LEX program to count the number of comments in a given C
    program file.
    
    Command to Run:
    lex lex.l && gcc lex.yy.c && ./a.out input.c
 */

%{
    #include<stdio.h> /* for using printf, fopen and fclose */
    #include<stdlib.h> /* for using exit */
    /* 
        declaring variables for holding count values 
        is_inside_multiline_comment acts as a flag variable, it indicates if
        we are currently inside a multiline comment or not 
    */
    int single_line_comment_cnt, multiline_comment_cnt, totat_cnt, is_inside_multiline_comment;
%}

%%

"/*"    {
            if(!is_inside_multiline_comment){ /* check if we are not already inside a multiline comment */
                /* if we were not inside a multiline comment already, 
                set flag = 1, indicating we are now inside the multiline comment */
                is_inside_multiline_comment = 1; 
                printf("Multiline Comment:\n/*");
            } 
        }

"*/"    {
            if(is_inside_multiline_comment){ /* check if are already inside a multiline comment */
                /* if we are inside a multiline comment already, 
                set flag = 0, indicating we are no more inside the multiline comment */
                is_inside_multiline_comment = 0; 
                multiline_comment_cnt++; /* increment the count of multiline comment */
                printf("*/\n");
            } 
        }

"//".*  {
            if(!is_inside_multiline_comment) /* check if we are not inside a multiline comment */
            {
                /* if we are not inside a multiline comment, then we have found a single line comment */
                single_line_comment_cnt++; /* increment the count of single line comment */
                printf("Single Line Comment:\n%s\n", yytext);
            } 
        }

.|\n    {
            if(is_inside_multiline_comment){ /* check if we are inside a multiline comment */
                ECHO; /* if we are inside a multiline comment, then print the current character */
            }
        }
%%

int yywrap(){
    return 1;
}

int main(int argc, char* argv[]){
    if(argc < 2) { /* performing a simple error checking based on number of arguments passed to the program */
        fprintf(stderr, "Incorrect Arguments, Usage: ./a.out INPUT_C_PROGRAM_FILE\n");
        exit(1); /* exit */
    }

    /* initializing the count variables and the flag variable */
    single_line_comment_cnt = 0;
    multiline_comment_cnt = 0;
    is_inside_multiline_comment = 0;

    yyin = fopen(argv[1],"r"); /* open the given file in read mode */
    yylex();
    fclose(yyin); /* close the given file after use */

    /* printing the results */
    printf("\n");
    printf("Count of Single Line Comments = %d\n", single_line_comment_cnt);
    printf("Count of Multi Line Comments = %d\n", multiline_comment_cnt);
    printf("Total Number of Comments = %d\n", single_line_comment_cnt + multiline_comment_cnt);
    return 0;
}