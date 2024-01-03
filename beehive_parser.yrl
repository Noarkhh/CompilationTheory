Nonterminals list elements element.
Terminals atom '(' ')'.
Rootsymbol list.
% list -> '(' ')' : '<!>'.
% list -> '(' elements ')' : '$1'.
% elements -> element : '$1'.
% elements -> element elements : {'$1', '$2'}.
% element -> atom : '$1'.
% element -> list : '$1'.

list -> '(' ')' : "<<!>>".
list -> '(' elements ')' : "|" ++ '$2' ++ "|".
elements -> element : '$1'.
elements -> element elements : '$1' ++ '$2'.
element -> atom : extract_string('$1').
element -> list : '$1'.

Erlang code.

extract_string({_, _, String}) -> String.

% Nonterminals
% block
% function funtions function_body
% module modules module_body
% import imports
% list tuple map binary string
% if_expr case_expr
% lambda.
%
%
% Terminals
% int float char atom word string
%
% 'mod' 'fn'
% 'import'
% '{' '}' '[' ']' '(' ')' '~|' '|~' '~~|' '|~~'
% 'or' 'and' 'not'
% '!' '@' '#' '$' '%' '^' '&'
% '->' '|_|'
% '+' '*' '-' '/' '//'.
%
% Rootsymbol
% block.
%
% Endsymbol
% '$end'.
%
% block -> imports modules
%
% imports -> import imports
% imports -> '$empty'
%
% import -> 'import' name
%
% modules -> module modules
% modules -> module
%
% module -> 'mod' word '~|' module_body '|~'
%
% module_body -> functions
%
% functions -> funtion functions
% functions -> function
%
% function -> 'fn' word '~|' function_body '|~'
%
% function_body ->
