Group Project Assignment - 2
 
Group ID : 15
 
Group members:
Adarsh Baghel 180001001
Jeevan Reddy 180001039
Shaikh Ubaid 180001050
################################################################
 
 
Lex file = lex.l
Yacc file = gram.y
 
How to run? => 
yacc -d gram.y
lex lex.l
gcc lex.yy.c y.tab.c  
./a.out
 
You can simply run a.out and pass the input string in the terminal.
 
Question 1: Write a LEX (and YACC) program to identify following helping verbs: {am, is, are, was were, being, been, be ,have, has, had, do, does, did, will, would, shall, should, may, might, must, can, could} in a sentence. 
For Example- Input (from terminal): you are a nice person
Output: you: is not a helping verb
are: is a helping verb
a:  is not a helping verb
nice:  is not a helping verb
person:  is not a helping verb
 
Sol:
In lexical analyser, we scan the input and check whether the current longest valid string is present in the array we already created.
The array contains all the helping verbs as lower case strings. The way we check for the input string in an array is by converting the input string to lowercase and then iterate the array, compare each string with the lowercase input, return 1 if it matches else continue, at the end return 0 which means the input string is not a helping verb.
 
Question 2: Write a LEX (and YACC) program that can take c program file as an input and can check if there are balance parenthesis ( () and {} ) or not? 
For Example- Input: hello world C program file (or any C program file)
Output: Parentheses are balanced
Or Parenthesis are not balanced
 
Sol:
In lexical analysis, we scan the input and check if the current match is ‘(‘, ‘)’, ‘{‘, ‘}’ else the current match is ignored.
And then in YACC we have three productions:
E -> ‘(‘ E ‘)’ E | ‘{‘ E ‘}’ E | epsilon
 
If the input does not follow this grammar, then it prints syntax error and says that Parenthesis are NOT Balanced.
 
 


( )
{ }
( ) ( )
( ) { }
{ } ( )
{ } { }
( ( ) )
( { } )
{ ( ) }
{ { } }
( ) ( ) ( )
( ) ( ) { }
( ) { } ( )
( ) { } { }
{ } ( ) ( )
{ } ( ) { }
{ } { } ( )
{ } { } { }
( ( ) ) ( )
( ( ) ) { }
( { } ) ( )
( { } ) { }
{ ( ) } ( )
{ ( ) } { }
{ { } } ( )
{ { } } { }
( ) ( ( ) )
( ) ( { } )
( ) { ( ) }
