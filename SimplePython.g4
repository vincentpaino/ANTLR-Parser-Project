grammar SimplePython;

program
	: statement* EOF
	;

statement
	: assignment
	;

assignment
	: ID EQUAL expression
	| ID PLUSEQUAL expression
	| ID DIVEQUAL expression
	| ID MULTEQUAL expression
	| ID MINUSEQUAL expression

ID
	: [a-zA-Z_][a-zA-Z_0-9]*
	;

INT
	: [0-9]+
	;

WS
	: [ \t\r\n]+ -> skip
	;