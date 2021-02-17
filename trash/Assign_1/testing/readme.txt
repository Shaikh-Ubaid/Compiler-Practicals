Group Project Assignment - 1

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

You can simply run a.out and pass the input string in terminal.

Question 1:  
    You need to check if given arithmetic expression is valid or invalid. 
    For Example- Input:  x+y = z
    Output: Invalid Arithmetic Expression

    Input: x= y+3
    Output: Valid Arithmetic Expression
Sol:

In lexical analyser, we scan the input and return tokens to parser.
We'll make sure there's no illegal character. 
And then in Yacc we have two productions one is for equation and another is for expression.
For expression we'll just check whether its legal(Ex. to make sure no consecutive + signs,etc.). 
In equation we'll check whether theres only one identifier in LHS of equal to and the exprtession in the RHS is legal.
If the input obeys all the rules we'll print valid else invalid.

Some examples:
For Valid:
Learning + to + learn
X123 = ( 8 + B25 )
speed = distance / time
Ke = 1/2* mass*speed*speed
abc + (e_f_g_h * p11) - 456 +ab90 * (45)
yp = (y - dy/dz + zp * dy/dz) / ((zp - z) / (Q * dz) + 1.5412)
Xdash = Qdx + t * (x - Qdx)

For Invalid:
abc ++ e_f_g_h
a + b = X123
(a & b * 2)



Question 2:  
    You need to build a simple Calculator using LEX and YACC. 
    For Example- Input: 2+2*3
    Output: 8

    Input can be given from terminal or any other interface. 
Sol:

In lexical analyser, we scan the input and return tokens to parser. 
We'll make sure there's no illegal character(Anything other than real numbers and arthimetic operators are illegal). 
In Yacc we'll evaluate the results depending upon the operators and print at the end. 
Our parser supports the operators '+', '-', '*', '/', '%' and '()'.

Some examples:

1/2+1/2
Result: 1.000000

1/2+(2*1/2)
Result: 1.500000


((3*10.000)/2.0)
Result: 15.000000

(((((2)))))
Result: 2.000000

1/0
Result: inf

3*100/6+7-8
Result: 49.000000