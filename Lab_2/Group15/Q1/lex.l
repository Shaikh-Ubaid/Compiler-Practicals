 /* 
   Group ID 15
   Adarsh 180001001
   Jeevan 180001039
   Ubaid  180001050

   Question 1:
   Write a LEX code that replaces a character [a-zA-Z] with another
   character. Initially use any random number between 1 to 5 e.g. 2. Now, whenever you come across
   the first alphabet in your input, that character should be replaced with another character that is 2
   places away from it in alphabetical order e.g. If the first character is ‘m’ then it should be replaced
   with ‘o’. The second character should be replaced with the character 3 places away from it, the
   third character should be replaced with the character 4 places away from it and so on. Use one
   input file and one output file. Once the count crosses 25 it should start from 1.

   Command to run:
   lex lex.l && gcc lex.yy.c && ./a.out < input.txt > output.txt

 */


%{
   #include <stdio.h> /* for using printf() */
   #include <stdlib.h> /* for using rand() */
   #include <time.h> /* for usign time(0) */
   int pos_of_char;
%}

%%
 
 /* Regex for identifying characters */
[a-z] {  
            //printf("Initial Char: %c, Pos_Of_Char = %d, Transformed Char = %c\n", yytext[0], pos_of_char, ('a'+(yytext[0]-'a'+pos_of_char)%26)); 
            printf("%c",('a'+(yytext[0]-'a'+pos_of_char)%26)); 
            pos_of_char++;
         } ;
[A-Z] {  
            //printf("Initial Char: %c, Pos_Of_Char = %d, Transformed Char = %c\n", yytext[0], pos_of_char, ('A'+(yytext[0]-'A'+pos_of_char)%26)); 
            printf("%c",('A'+(yytext[0]-'A'+pos_of_char)%26)); 
            pos_of_char++;
         } ;
.  {printf(yytext);} ;/* skip any symbol */
\n ; /* skip new lines */

%%

int yywrap(){return 1;}

int main(){
   srand(time(0)); /* seed the rand() function */
   pos_of_char = rand()%5 + 1; /* initialize pos_of_char with a random value between 1 to 5 */ 
   yylex();
}