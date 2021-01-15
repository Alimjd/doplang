%option main
identifier  [A-Za-z][_A-Za-z0-9]*
newline \n
integer-literal [+-]?[0-9]+
boolean-literal (true)|(false)
comment \/\/.*\n
string-literal \".*\"
%%
\(  printf("LP ");
\) printf("RP ");
\{  printf("LCBRACE ");
\}  printf("RCBRACE ");
\:  printf("COLON ");
\+  printf("ADDITION_OP ");
\-  printf("SUBTRACTION_OP ");
\*  printf("MULTIPLICATION_OP ");
\/  printf("DIVISION_OP ");
\=  printf("ASSIGNMENT_OP ");
\=\=  printf("EQUALITY_OP ");
\!\=  printf("INEQUALITY_OP ");
\>  printf("GREATER_THAN_OP ");
\<  printf("LESS_THAN_OP ");
\>\=  printf("GREATER_EQUAL_THAN_OP ");
\<\=  printf("LESS_EQUAL_THAN_OP ");
\, printf("COMMA ");
or  printf("LOGICAL_OR_OP ");
and printf("LOGICAL_AND_OP ");
not printf("UNARY_NOT ");
while printf("WHILE ");
repeat  printf("REPEAT ");
times printf("TIMES ");
func  printf("FUNCTION_DEFINITION ");
if  printf("IF ");
else  printf("ELSE ");
return  printf("RETURN ");
doplang\.read_altidute printf("READ_ALTITUDE ");
doplang\.read_inclination  printf("READ_INCLINATION ");  
doplang\.read_temperature  printf("READ_TEMPERATURE "); 
doplang\.read_timer  printf("READ_TIMER "); 
doplang\.read_acceleration printf("READ_ACCELERATION "); 
doplang\.turn_camera_on  printf("TURN_CAMERA_ON ");
doplang\.turn_camera_off printf("TURN_CAMERA_OFF ");
doplang\.take_picture printf("TAKE_PICTURE ");
doplang\.connect_to_drone  printf("CONNECT_TO_DRONE ");
doplang\.exit printf("EXIT ");
doplang\.input printf("INPUT ");
doplang\.print printf("PRINT ");
doplang\.land  printf("LAND ");
doplang\.take_off  printf("TAKE_OFF ");
{newline} printf("NEWLINE ");
{comment} printf("");
{boolean-literal} printf("BOOLEAN_LITERAL ");
{integer-literal} printf("INTEGER_LITERAL ");
{identifier}  printf("IDENTIFIER ");
{string-literal}  printf("STRING_LITERAL ");
%%