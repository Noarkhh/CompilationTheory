Nonterminals
block opt_ws
function functions function_body function_signature
function_call
module modules module_body
statements statement
match expression
term literal
list tuple map
empty_list empty_tuple empty_map
comma_separated_terms key_value_pair comma_separated_key_value_pairs
variable
if_expr case_expr
lambda.


Terminals
lowercase_word uppercase_word capitalized_word
ws

int float atom string bool

mod fn
'#{' '}' '[' ']' '(' ')' '~|' '|~' '~~|' '|~~'
or and not
'!' '@' '#' '$' '%' '^' '&'
'->' '|_|'
'+' '*' '-' '/' '//'
'<=>'
',' '.' ':>'.

Rootsymbol
block.

Endsymbol
'$end'.

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
term -> variable : '$1'.

literal -> string : extract_string('$1').
literal -> int : extract_string('$1').
literal -> float : extract_string('$1').
literal -> bool : extract_string('$1').
literal -> atom : extract_string('$1').

tuple -> '(' opt_ws comma_separated_terms opt_ws ')' : "{" ++ '$3' ++ "}".
tuple -> '(' opt_ws ')' : "{}".

list -> '[' opt_ws comma_separated_terms opt_ws ']' : "[" ++ '$3' ++ "]".
list -> '[' opt_ws ']' : "[]".

map -> '#{' opt_ws comma_separated_key_value_pairs opt_ws '}' : "%{" ++ '$3' ++ "}".
map -> '#{' opt_ws '}' : "%{}".

variable -> lowercase_word : extract_string('$1').

block -> opt_ws modules opt_ws : '$2'.

modules -> module : '$1'.
modules -> modules ws module : '$1' ++ "\n\n" ++ '$3'.

module -> 'mod' ws capitalized_word ws '~~|' opt_ws functions opt_ws '|~~' : "defmodule " ++ extract_string('$3') ++ " do\n" ++ '$7' ++ "\nend".

functions -> function : '$1'.
functions -> functions ws function : '$1' ++ "\n\n" ++ '$3'.

function -> 'fn' ws function_signature ws '~|' opt_ws statements opt_ws '|~' : "def " ++ extract_string('$3') ++ " do\n" ++ '$7' ++ "\nend".
function -> 'fn' ws function_signature ws '~|' opt_ws '|~' : "def " ++ extract_string('$3') ++ " do\nend".

function_signature -> lowercase_word '(' opt_ws comma_separated_terms opt_ws ')' : extract_string('$1') ++ "(" ++ '$3' ++ ")".
function_signature -> lowercase_word '(' opt_ws ')' : extract_string('$1') ++ "()".

statements -> statement : '$1'.
statements -> statement ws statements : '$1' ++ '$3'.

statement -> match opt_ws '.' ws : '$1' ++ "\n".
statement -> term opt_ws '.' ws : '$1' ++ "\n".

match -> term ws '<=>' ws term : '$1' ++ " = " ++ '$5'.

Erlang code.

extract_string({_, _, String}) -> wString;
extract_string(String) -> String.
