grammar Nimble ;

uni : ('-' | '!') expr ;

binexp : binary expr ;

binary : OPEQ | OPPM | OPMD ;

expr : liter | ID ;

liter : INT | BOOL | STRING ;

parexp : '(' expr ')' ;

fxncall : ID ' '* '(' ' '* mlsequence* ' '* ID ' '* ':' ' '* liter ' '* ')' ;

mlsequence : ID ':' liter ',' ;

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

ID : [A-Za-z_][A-Za-z_0-9]+ ;
COMMENT : '//' ~[\r\n]* -> skip ;
WS : [ \t\r\n]+ -> skip ;


