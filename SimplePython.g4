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

EQUAL : '=' ;
PLUSEQUAL : '+=' ;
DIVEQUAL : '/=' ;
MULTEQUAL : '*=' ;
MINUSEQUAL : '-=' ;
PLUS : '+' ;
MINUS : '-' ;

ID : [a-zA-Z_][a-zA-Z_0-9]* ;
INT : [0-9]+ ;
WS : [ \t\r\n]+ -> skip ;