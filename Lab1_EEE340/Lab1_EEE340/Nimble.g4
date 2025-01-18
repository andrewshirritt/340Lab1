grammar Nimble ;

//do spaces for everything

//not sure if the fxncall statement is done yet.

program : fxndef ' '* 
          mainblock ' '* ;

mainblock : ' '* var* ' '* statement*;

statement : assignment | print | while | if | return | fxncall ;

expr : literal | unary | binexp | parexp | fxncall | ID ;

paramdecl : ID ' '* ':' ' '* TYPENAME ' '* ;

fxndef : 'func' ' '* ID ' '* '(' ' '* fxnsequence* ' '* ID* ' '* ':' ' '* TYPENAME ')' ' '* ('->' ' '* TYPENAME ' '* '{'
        var* ' '* 
        statement* ' '* 
        '}') ;

//end of new stuff

var : 'var' ' '* ID ' '* ':' ' '* TYPENAME ' '* '=' ' '* expr ;

return : 'return' ' '* expr?;

if : 'if' ' '* expr ' '* '{' (expr | statement | var)* ' '* '}' ' '* else?;

else : 'else' ' '* '{' (expr | statement | var)* ' '* '}' ;

assignment : ID ' '* '=' ' '* expr ;

print : 'print' ' '* expr ;

while : 'while' ' '* expr ' '* '{' ' '* (expr | statement | var)* ' '* '}';

unary : ('-' | '!') expr ;

binexp : binary expr ;

binary : OPEQ | OPPM | OPMD ;

literal : INT | BOOL | STRING ;

parexp : '(' expr ')' ;

fxncall : ID ' '* '(' ' '* mlsequence* ' '* ID* ' '* ':' ' '* literal ' '* ')' ;

mlsequence : ID ':' literal ',' ;

fxnsequence : ID ':' TYPENAME ',' ;










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


