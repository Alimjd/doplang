identifier  [A-Za-z][_A-Za-z0-9]*
newline \n
integer-literal [0-9]+
boolean-literal (true)|(false)
comment \/\/.*\n
string-literal \".*\"
%%
\(  { return LP;}
\) { return RP;}
\{  { return LCBRACE;}
\}  { return RCBRACE;}
\:  { return COLON;}
\+  { return ADDITION_OP;}
\-  { return SUBTRACTION_OP;}
\*  { return MULTIPLICATION_OP;}
\/  { return DIVISION_OP;}
\=  { return ASSIGNMENT_OP;}
\=\=  { return EQUALITY_OP;}
\!\=  { return INEQUALITY_OP;}
\>  { return GREATER_THAN_OP;}
\<  { return LESS_THAN_OP;}
\>\=  { return GREATER_EQUAL_THAN_OP;}
\<\=  { return LESS_EQUAL_THAN_OP;}
\, { return COMMA;}
or  { return LOGICAL_OR_OP;}
and { return LOGICAL_AND_OP;}
not { return UNARY_NOT;}
while { return WHILE;}
repeat  { return REPEAT;}
times { return TIMES;}
func  { return FUNCTION_DEFINITION;}
if  { return IF;}
else  { return ELSE;}
return  { return RETURN;}
doplang\.read_altitude { return READ_ALTITUDE;}
doplang\.read_inclination  { return READ_INCLINATION;}  
doplang\.read_temperature  { return READ_TEMPERATURE;} 
doplang\.read_timer  { return READ_TIMER;} 
doplang\.read_acceleration { return READ_ACCELERATION;} 
doplang\.turn_camera_on  { return TURN_CAMERA_ON;}
doplang\.turn_camera_off { return TURN_CAMERA_OFF;}
doplang\.take_picture { return TAKE_PICTURE;}
doplang\.connect_to_drone  { return CONNECT_TO_DRONE;}
doplang\.exit { return EXIT;}
doplang\.input { return INPUT;}
doplang\.print { return PRINT;}
doplang\.land  { return LAND;}
doplang\.take_off  { return TAKE_OFF;}
[\t ] ;
{newline} { return NEWLINE;}
{comment} { return NEWLINE;};
{boolean-literal} { return BOOLEAN_LITERAL;}
{integer-literal} { return INTEGER_LITERAL;}
{identifier}  { return IDENTIFIER;}
{string-literal}  { return STRING_LITERAL;}
. ;
%%