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

opt_ws -> '$empty'.
opt_ws -> ws.

comma_separated_terms -> comma_separated_terms opt_ws ',' opt_ws term.
comma_separated_terms -> term.

key_value_pair -> term opt_ws ':>' opt_ws term.

comma_separated_key_value_pairs -> comma_separated_key_value_pairs opt_ws ',' opt_ws key_value_pair.
comma_separated_key_value_pairs -> key_value_pair.

term -> tuple.
term -> list.
term -> map.
term -> literal.
term -> function_call.
term -> variable.

literal -> string.
literal -> int.
literal -> float.
literal -> bool.
literal -> atom.
% literal -> lambda.

tuple -> '(' opt_ws comma_separated_terms opt_ws ')'.
tuple -> '(' opt_ws ')'.

list -> '[' opt_ws comma_separated_terms opt_ws ']'.
list -> '[' opt_ws ']'.

map -> '#{' opt_ws comma_separated_key_value_pairs opt_ws '}'.
map -> '#{' opt_ws '}'.

variable -> lowercase_word.

block -> opt_ws modules opt_ws.

% block -> ws 'mod' ws capitalized_word ws '~~|' ws functions ws '|~~' ws.

modules -> module.
modules -> modules ws module.

module -> 'mod' ws capitalized_word ws '~~|' opt_ws module_body opt_ws '|~~'.
% module -> 'mod' ws capitalized_word ws '~|' ws '|~'.

module_body -> functions.

functions -> function.
functions -> functions ws function.

function -> 'fn' ws function_signature ws '~|' opt_ws function_body opt_ws '|~'.

function_signature -> lowercase_word '(' opt_ws comma_separated_terms opt_ws ')'.
function_signature -> lowercase_word '(' opt_ws ')'.

function_call -> lowercase_word '(' opt_ws comma_separated_terms opt_ws ')'.
function_call -> lowercase_word '(' opt_ws ')'.

function_body -> statements.

statements -> '$empty'.
statements -> statement ws statements.

statement -> match '.'.
statement -> term '.'.

match -> term '<=>' term.
