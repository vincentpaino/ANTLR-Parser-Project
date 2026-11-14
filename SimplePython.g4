grammar SimplePython;

program : statement* EOF ;

statement : assignment ;

assignment
	: ID EQUAL expression
	| ID PLUSEQUAL expression
	| ID DIVEQUAL expression
	| ID MULTEQUAL expression
	| ID MINUSEQUAL expression
	;

// Note: MULT, DIV, MOD have higher operator precedence than PLUS, MINUS in a left-recursive parser
expression
	: expression (MULT | DIV | MOD) expression
	| expression (PLUS | MINUS) expression
	| MINUS expression
	| LPAR expression RPAR
	| LBRACK (expression (COMMA expression)*)? RBRACK
	| INT
	| FLOAT
	| STRING
	| BOOL
	| ID
	;

// Lexer rules defined below (this is a combined grammar)

// Defined operators
EQUAL : '=' ;
PLUSEQUAL : '+=' ;
DIVEQUAL : '/=' ;
MULTEQUAL : '*=' ;
MINUSEQUAL : '-=' ;
PLUS : '+' ;
MINUS : '-' ;
MULT : '*' ;
DIV : '/' ;
MOD : '%' ;
LBRACK : '[' ;
RBRACK : ']' ;
COMMA : ',' ;
LPAR : '(' ;
RPAR : ')' ;

// Defined id, types, and whitespace
BOOL : 'True' | 'False' ;
ID : [a-zA-Z_][a-zA-Z_0-9]* ;
INT : [0-9]+ ;
FLOAT : [0-9]+ '.' [0-9]+ ;

STRING : '"' ~["\r\n]* '"'
       | '\'' ~['\r\n]* '\''
       ;

WS : [ \t\r\n]+ -> skip ;
