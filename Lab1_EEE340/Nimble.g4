grammar Nimble ;

//do spaces for everything

return : 'return' ' '* expr?;

if : 'if' ' '* expr ' '* '{' (expr | statement | var)* ' '* '}' ' '* else?;

else : 'else' ' '* '{' (expr | statement | var)* ' '* '}' ;

statement : assignment | print | while ;

assignment : ID ' '* '=' ' '* expr ;

print : ' '* expr ;

while : 'while' ' '* expr ' '* '{' ' '* (expr | statement | var)* ' '* '}';

unary : ('-' | '!') expr ;

binexp : binary expr ;

binary : OPEQ | OPPM | OPMD ;

expr : literal | unary | binexp | parexp | fxncall | ID ;

literal : INT | BOOL | STRING ;

parexp : '(' expr ')' ;

fxncall : ID ' '* '(' ' '* mlsequence* ' '* ID ' '* ':' ' '* literal ' '* ')' ;

mlsequence : ID ':' literal ',' ;

var : 'var' ' '* ID ' '* ':' ' '* TYPENAME ' '* '=' ' '* expr ;









//ALL OPERATIONS ARE LEFT-ASSOCIATIVE.
//DONT FORGET THE KEYWORDS IN THE EXPRESSIONS
OPNEG : [-]|[!] ;
OPMD : [*]|[/] ;
OPPM : [+]|[-] ;
OPEQ : ('==')|[<]|[<=] ;

TYPENAME : ('int')|('bool')|('string') ;
INT : [0-9][0-9]* ;
BOOL : ('true')|('false') ;
STRING : ["](((' '..'[')  |  (']'..'~'))  |  ('\\a')  |  ('\\b')  |  ('\\f')  |  ('\\n')  |  ('\\r')  |  ('\\t')
               |  ('\\v')  |  ('\\\\')  |  ('\\\'')  |  ('\\"')  |  ('\\?'))*["] ;

ID : [A-Za-z_][A-Za-z_0-9]* ;
COMMENT : '//' ~[\r\n]* -> skip ;
WS : [ \t\r\n]+ -> skip ;


