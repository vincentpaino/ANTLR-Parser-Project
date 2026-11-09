grammar SimplePython;

program
	: statement* EOF
	;

statement
	: ID '=' expr ';'
	;