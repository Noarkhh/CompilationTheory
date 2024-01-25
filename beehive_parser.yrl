Nonterminals
block opt_ws
function functions function_signature
module modules
statements statement
matching
term literal
list tuple map
comma_separated_terms key_value_pair comma_separated_key_value_pairs
variable
if_expr match_expr
match_pair match_pairs
infix_operation infix_operator
unary_operation.


Terminals
lowercase_word capitalized_word
ws

int float atom string bool
match to
if then else

mod fn
'#{' '}' '[' ']' '(' ')' '~|' '|~' '~~|' '|~~' '|'
'or' 'and' 'not'
'+' '*' '-' '/'
'<=>' '=>'
'<=' '>=' '==' '>' '<' '!='
',' '.' ':>' ':'.

Rootsymbol
block.

Endsymbol
'$end'.

Left 100 '+'.
Left 200 '-'.
Left 200 '*'.
Left 300 '/'.
Nonassoc 400 '=='.
Nonassoc 500 '!='.
Nonassoc 600 '>='.
Nonassoc 700 '<='.
Nonassoc 800 '>'.
Nonassoc 900 '<'.
Right 1000 'and'.
Right 1100 'or'.
Unary 1200 'not'.


opt_ws -> '$empty' : "".
opt_ws -> ws : '$1'.

comma_separated_terms -> comma_separated_terms opt_ws ',' opt_ws term : '$1' ++ ", " ++ '$5'.
comma_separated_terms -> term : '$1'.

key_value_pair -> term opt_ws ':>' opt_ws term : '$1' ++ " => " ++ '$5'.

comma_separated_key_value_pairs -> comma_separated_key_value_pairs opt_ws ',' opt_ws key_value_pair : '$1' ++ ", " ++ '$5'.
comma_separated_key_value_pairs -> key_value_pair : '$1'.

term -> tuple : '$1'.
term -> list : '$1'.
term -> map : '$1'.
term -> literal : '$1'.
term -> function_signature : '$1'.
term -> if_expr : '$1'.
term -> match_expr : '$1'.
term -> variable : '$1'.
term -> infix_operation : '$1'.
term -> unary_operation : '$1'.

literal -> string : extract_string('$1').
literal -> int : extract('$1').
literal -> float : extract('$1').
literal -> bool : extract('$1').
literal -> atom : extract_atom('$1').

tuple -> '(' opt_ws comma_separated_terms opt_ws ')' : "{" ++ '$3' ++ "}".
tuple -> '(' opt_ws ')' : "{}".

list -> '[' opt_ws comma_separated_terms opt_ws ']' : "[" ++ '$3' ++ "]".
list -> '[' opt_ws ']' : "[]".

map -> '#{' opt_ws comma_separated_key_value_pairs opt_ws '}' : "%{" ++ '$3' ++ "}".
map -> '#{' opt_ws '}' : "%{}".

infix_operation -> term ws infix_operator ws term : '$1' ++ " " ++ '$3' ++ " " ++ '$5'.

unary_operation -> 'not' ws term : "not " ++ '$3'.
unary_operation -> '-' term : "-" ++ '$2'.

infix_operator -> '+' : extract('$1').
infix_operator -> '*' : extract('$1').
infix_operator -> '-' : extract('$1').
infix_operator -> '/' : extract('$1').
infix_operator -> '==' : extract('$1').
infix_operator -> '!=' : extract('$1').
infix_operator -> '>=' : extract('$1').
infix_operator -> '<=' : extract('$1').
infix_operator -> '>' : extract('$1').
infix_operator -> '<' : extract('$1').
infix_operator -> 'and' : extract('$1').
infix_operator -> 'or' : extract('$1').

variable -> lowercase_word : extract('$1').

if_expr -> 'if' ws term ws 'then' ws term ws 'else' ws term : "if " ++ '$3' ++ " do\n" ++ '$7' ++ "\nelse\n" ++ '$9' ++ "\nend".

match_expr -> 'match' ws term ws 'to' ws match_pairs : "case " ++ '$3' ++ " do\n" ++ '$7' ++ "\nend".

match_pairs -> match_pair : '$1'.
match_pairs -> match_pairs ws match_pair : '$1' ++ "\n" ++ '$3'.

match_pair -> term ws '=>' ws term '.': '$1' ++ " -> " ++ '$5'.

block -> opt_ws modules opt_ws : '$2'.

modules -> module : '$1'.
modules -> modules ws module : '$1' ++ "\n\n" ++ '$3'.

module -> 'mod' ws capitalized_word ws '~~|' ws functions ws '|~~' : "defmodule " ++ extract('$3') ++ " do\n" ++ '$7' ++ "\nend".

functions -> function : '$1'.
functions -> functions ws function : '$1' ++ "\n\n" ++ '$3'.

function -> 'fn' ws function_signature ws '~|' ws statements ws '|~' : "def " ++ extract('$3') ++ " do\n" ++ '$7' ++ "\nend".

function_signature -> lowercase_word '(' comma_separated_terms ')' : extract('$1') ++ "(" ++ '$3' ++ ")".
function_signature -> lowercase_word '(' ')' : extract('$1') ++ "()".

function_signature -> capitalized_word ':' function_signature : extract('$1') ++ "." ++ '$3'.

statements -> statement : '$1'.
statements -> statements ws statement : '$1' ++ "\n" ++ '$3'.

statement -> matching '.' : '$1'.
statement -> term '.' : '$1'.

matching -> term ws '<=>' ws term : '$1' ++ " = " ++ '$5'.

Erlang code.

extract_atom({_, _, [$; | String]}) -> ":" ++ lists:droplast(String).

extract_string({_, _, [$' | String]}) -> "\"" ++ lists:droplast(String) ++ "\"".

extract({_, _, String}) -> String;
extract(String) -> String.
