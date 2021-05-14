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
    #include<stdio.h> /* for using printf, fopen and fclose */
    /* 
        is_inside_multiline_comment acts as a flag variable, it indicates if
        we are currently inside a multiline comment or not 
    */
    int is_inside_multiline_comment = 0, is_inside_string = 0;

    int nscanf = 0; // total no of scanf.
    int nprintf = 0; // total no of printf.
    
%}

%%

"/*"    {
            if(!is_inside_multiline_comment){ /* check if we are not already inside a multiline comment */
                /* if we were not inside a multiline comment already, 
                set flag = 1, indicating we are now inside the multiline comment */
                is_inside_multiline_comment = 1; 
                printf("Comment: /*");
            } 
        }

"*/"    {
            if(is_inside_multiline_comment){ /* check if are already inside a multiline comment */
                /* if we are inside a multiline comment already, 
                set flag = 0, indicating we are no more inside the multiline comment */
                is_inside_multiline_comment = 0; 
                printf("*/\n");
            } 
        }

"//".*  {
            if(!is_inside_multiline_comment) /* check if we are not inside a multiline comment */
            {
                /* if we are not inside a multiline comment, then we have found a single line comment */
                printf("Comment: %s\n", yytext);
            } 
        }

\"       {
            if(!is_inside_string){ /* check if we are not already inside a string */
                /* if we were not inside a string
                set flag = 1, indicating we are now inside a string */
                is_inside_string = 1; 
                printf("String: \"");
            }
            else{
                /* if we were inside a string
                set flag = 0, indicating we are now not inside a string */
                is_inside_string = 0; 
                printf("\"\n");
            } 
        } 

"\\\""  {
            if(is_inside_multiline_comment | is_inside_string){ 
                ECHO;
            } 
        } 

.|\n    {
            if(is_inside_multiline_comment | is_inside_string){ /* check if we are inside a multiline comment or a string*/
                ECHO; /* if we are inside a multiline comment  or a string, then print the current character */
            }
        }

"printf"    {
                if(!is_inside_multiline_comment && !is_inside_string){
                    printf("printf found!\n");
                    nprintf++;
                }
                else{
                    ECHO;
                }
                
            }

"scanf"     {
                if(!is_inside_multiline_comment && !is_inside_string){
                    printf("scanf found!\n");
                    nscanf++;
                }
                else{
                    ECHO;
                }
            }


%%


int yywrap() {return 1;}

/* main function is needed since we are not using a parser for this Question. */
int main(){
    yylex();

    printf("\nNo of scanf found: %d\n",nscanf);
    printf("No of printf found: %d\n",nprintf);
    
    return 0;
}