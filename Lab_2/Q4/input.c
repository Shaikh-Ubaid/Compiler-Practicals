/* comment 1 with a '/' inside it */ 

#include <stdio.h> // for using printf and scanf */
/* a 
comment
occupying separate
lines
*/
int main(){
    // hello how are you? (a single line comment)
    int a, b; /* declaring two variables for storing user input */
    printf("Enter two numbers for addition: "); /* prompt user for input */
    // /* a  /* complex */ comment */
    scanf("%d %d", &a, &b); /* read the user input */
    printf("The result of addition is: %d\n", a + b); /* compute and print the result */
    return 0;
    /* another test comment
    * hi 
    * hi 
    */
}



