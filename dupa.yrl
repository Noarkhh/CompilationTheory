Nonterminals list elements element.
Terminals atom '(' ')'.
Rootsymbol list.

list -> '(' ')' : "<<!>>".
list -> '(' elements ')' : "|" ++ '$2' ++ "|".
elements -> element : '$1'.
elements -> element elements : '$1' ++ '$2'.
element -> atom : extract_string('$1').
element -> list : '$1'.

Erlang code.

extract_string({_, _, String}) -> String.