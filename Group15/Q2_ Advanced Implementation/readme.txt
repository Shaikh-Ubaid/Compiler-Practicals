Lex file = lex.l
Yacc file = gram.y

How to run? => 
yacc -d gram.y
lex lex.l
gcc lex.yy.c y.tab.c  
./a.out

You can simply run a.out and pass the input string in terminal.

This implementation is a superset of the Q2 which supports unary '+', '-' operators.
Some expressions which can be trivially accepted are as follows:

5-+3
Result: 2

5+-3
Result: 2

5*-3
Result: -15

(-1)-2
Result: -3

5++3
Result: 8

5--3
Result: 8




