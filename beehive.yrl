Nonterminals list elements element.
Terminals atom '(' ')'.
Rootsymbol list.
list -> '(' ')'.
list -> '(' elements ')'.
elements -> element.
elements -> element elements.
element -> atom.
element -> list. 



Nonterminals 
block
function funtions function_body
module modules module_body
import imports
list tuple map binary string
if_expr case_expr
lambda.


Terminals
int float char atom word string

'mod' 'fn' 
'import'
'{' '}' '[' ']' '(' ')' '~|' '|~' '~~|' '|~~'
'or' 'and' 'not' 
'!' '@' '#' '$' '%' '^' '&'
'->' '|_|' '\_/'
'+' '*' '-' '/' '//'.

Rootsymbol
block.

Endsymbol 
'$end'.

block -> imports modules

imports -> import imports
imports -> '$empty'

import -> 'import' name

modules -> module modules
modules -> module 

module -> 'mod' word '~~|' module_body '|~~'

module_body -> functions

functions -> funtion functions
functions -> function

function -> 'fn' '~|' function_body '|~'

