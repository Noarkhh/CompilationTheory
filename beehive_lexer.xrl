Definitions.

Rules.

or : {token, {'or', TokenLine}}.
and : {token, {'and', TokenLine}}.
not : {token, {'not', TokenLine}}.

true : {token, {bool, TokenLine, 'true'}}.
false : {token, {bool, TokenLine, 'false'}}.

mod : {token, {'mod', TokenLine}}.
fn : {token, {'fn', TokenLine}}.
pfn : {token, {'pfn', TokenLine}}.

[+-]?[0-9]+ : {token, {int, TokenLine, list_to_integer(TokenChars)}}.
[+-]?([0-9]*[.])?[0-9]+ : {token, {float, TokenLine, list_to_float(TokenChars)}}.
;[a-zA-Z0-9_]+; : {token, {atom, TokenLine, list_to_atom(TokenChars)}}.
'[a-zA-Z0-9_]+' : {token, {string, TokenLine, TokenChars}}.

[A-Z_]+ : {token, {uppercase_word, TokenLine, TokenChars}}.
[a-z_][a-zA-Z_]* : {token, {lowercase_word, TokenLine, TokenChars}}.
[A-Z][a-zA-Z_]+ : {token, {capitalized_word, TokenLine, TokenChars}}.

\) : {token, {')', TokenLine}}.
\( : {token, {'(', TokenLine}}.
\} : {token, {'}', TokenLine}}.
#\{ : {token, {'#{', TokenLine}}.
\] : {token, {']', TokenLine}}.
\[ : {token, {'[', TokenLine}}.
\|~ : {token, {'|~', TokenLine}}.
~\| : {token, {'~|', TokenLine}}.
\|~~ : {token, {'|~~', TokenLine}}.
~~\| : {token, {'~~|', TokenLine}}.

! : {token, {'!', TokenLine}}.
@ : {token, {'@', TokenLine}}.
# : {token, {'#', TokenLine}}.
\$ : {token, {'$', TokenLine}}.
\% : {token, {'%', TokenLine}}.
\^ : {token, {'^', TokenLine}}.
& : {token, {'&', TokenLine}}.

-> : {token, {'->', TokenLine}}.
\|_\| : {token, {'|_|', TokenLine}}.

\+ : {token, {'+', TokenLine}}.
- : {token, {'-', TokenLine}}.
\* : {token, {'*', TokenLine}}.
/ : {token, {'/', TokenLine}}.

, : {token, {',', TokenLine}}.
\. : {token, {'.', TokenLine}}.
\: : {token, {':', TokenLine}}.
\:> : {token, {':>', TokenLine}}.

<=> : {token, {'<=>', TokenLine}}.

[\s\n\t\r]+ : {token, {ws, TokenLine}}.

Erlang code.

