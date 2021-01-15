%token IDENTIFIER NEWLINE COMMENT INTEGER_LITERAL BOOLEAN_LITERAL STRING_LITERAL LP RP LCBRACE RCBRACE READ_ACCELERALION TAKE_OFF LAND BREAK COLON ADDITION_OP SUBTRACTION_OP MULTIPLICATION_OP DIVISION_OP ASSIGNMENT_OP EQUALITY_OP INEQUALITY_OP GREATER_THAN_OP LESS_THAN_OP GREATER_EQUAL_THAN_OP LESS_EQUAL_THAN_OP COMMA LOGICAL_OR_OP LOGICAL_AND_OP UNARY_NOT WHILE REPEAT TIMES FUNCTION_DEFINITION IF ELSE  RETURN READ_ALTITUDE READ_INCLINATION READ_TEMPERATURE READ_TIMER READ_ACCELERATION TURN_CAMERA_ON TURN_CAMERA_OFF TAKE_PICTURE CONNECT_TO_DRONE EXIT INPUT PRINT
%left ADDITION_OP SUBTRACTION_OP MULTIPLICATION_OP DIVISION_OP EQUALITY_OP INEQUALITY_OP GREATER_THAN_OP LESS_THAN_OP GREATER_EQUAL_THAN_OP LESS_EQUAL_THAN_OP LOGICAL_OR_OP LOGICAL_AND_OP
%right UNARY_NOT
%%
program : statement_list ;

identifier_list :  IDENTIFIER ;
				| IDENTIFIER COMMA identifier_list ;

statement_list: NEWLINE {lineNumber++;} ;
                | statement NEWLINE {lineNumber++;} ;
                | statement {lineNumber++;} ;
                | NEWLINE {lineNumber++;} statement_list ;
                | statement NEWLINE {lineNumber++;} statement_list ;

statement : assignment_statement ;
			| expression ;
			| structured_block_declaration ;
			| return_statement ;
			| break_statement ;

structured_block_declaration : while_loop ;
							| repeat_loop ;
							| conditional_statement ;
							| function_declaration ;

assignment_statement :  identifier_list ASSIGNMENT_OP expression_list ;

expression : logical_or_expression ;

expression_list : expression;
				| expression COMMA expression_list ;
				
logical_or_expression : logical_and_expression ;
						| logical_or_expression LOGICAL_OR_OP  logical_and_expression ;

logical_and_expression : logical_equality_expression ;
						| logical_and_expression LOGICAL_AND_OP logical_equality_expression ;

logical_equality_expression: logical_ltgt_expression ;
							| logical_equality_expression EQUALITY_OP  logical_ltgt_expression ;
							| logical_equality_expression INEQUALITY_OP  logical_ltgt_expression ;

logical_ltgt_expression : unary_not;
						| logical_ltgt_expression LESS_THAN_OP unary_not ;
						| logical_ltgt_expression LESS_EQUAL_THAN_OP unary_not ;
						| logical_ltgt_expression GREATER_THAN_OP unary_not ;
						| logical_ltgt_expression GREATER_EQUAL_THAN_OP unary_not ;

unary_not: UNARY_NOT unary_not ;
		| addition ;

addition: multiplication ;
		| addition ADDITION_OP multiplication ;
		| addition SUBTRACTION_OP multiplication ;

multiplication : unary_op ;
				| multiplication MULTIPLICATION_OP unary_op ;
				| multiplication DIVISION_OP unary_op ;
unary_op: group ;
		| SUBTRACTION_OP unary_op ;
		| ADDITION_OP unary_op ; 

group : primary ;
		| LP expression RP ;

primary : INTEGER_LITERAL  ;
		| BOOLEAN_LITERAL ;
		| STRING_LITERAL ;
		| IDENTIFIER  ;
		| function_call ;

while_loop : WHILE expression COLON LCBRACE  statement_list RCBRACE ;

repeat_loop : REPEAT expression TIMES COLON LCBRACE  statement_list RCBRACE ;

conditional_statement : IF expression COLON LCBRACE  statement_list RCBRACE ;
					| IF expression COLON LCBRACE statement_list RCBRACE ELSE COLON LCBRACE  statement_list  RCBRACE;

function_declaration : FUNCTION_DEFINITION IDENTIFIER LP  identifier_list RP LCBRACE  statement_list  RCBRACE ;
					| FUNCTION_DEFINITION IDENTIFIER LP RP LCBRACE statement_list RCBRACE ;

return_statement : RETURN expression_list | RETURN ;

break_statement : BREAK ;

function_call : IDENTIFIER LP RP ;
				| IDENTIFIER LP expression_list RP ;
				| built_in_function_with_variable ;

built_in_function_with_variable : PRINT LP expression RP ;
								| built_in_function LP RP ;

built_in_function : READ_INCLINATION ;
				| READ_ALTITUDE ;
				| READ_TEMPERATURE ;
				| READ_TIMER ;
				| READ_ACCELERATION ;
				| TURN_CAMERA_ON ;
				| TURN_CAMERA_OFF ;
				| TAKE_PICTURE ;
				| CONNECT_TO_DRONE ;
				| INPUT ;
				| EXIT ;
				| TAKE_OFF ;
				| LAND ;

%% 
#include "lex.yy.c" 
int lineNumber = 1;
int yywrap() { return 1; }
int yyerror(char *s) { printf("Syntax error on line %d!\n", lineNumber); } 
int main() {
	int result = yyparse();
	if (result == 0) {
		printf("Input program is valid.\n");
	}
 	return result;
}
