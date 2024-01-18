Definitions.

Rules.

or : {token, {'or', TokenLine, TokenChars}}.
and : {token, {'and', TokenLine, TokenChars}}.
not : {token, {'not', TokenLine, TokenChars}}.

true : {token, {bool, TokenLine, TokenChars}}.
false : {token, {bool, TokenLine, TokenChars}}.

mod : {token, {'mod', TokenLine, TokenChars}}.
fn : {token, {'fn', TokenLine, TokenChars}}.
pfn : {token, {'pfn', TokenLine, TokenChars}}.

if : {token, {'if', TokenLine, TokenChars}}.
then : {token, {'then', TokenLine, TokenChars}}.
else : {token, {'else', TokenLine, TokenChars}}.
match : {token, {'match', TokenLine, TokenChars}}.
to : {token, {'to', TokenLine, TokenChars}}.

[+-]?[0-9]+ : {token, {int, TokenLine, TokenChars}}.
[+-]?([0-9]*[.])?[0-9]+ : {token, {float, TokenLine, TokenChars}}.
;[a-zA-Z0-9_]+; : {token, {atom, TokenLine, TokenChars}}.
'[a-zA-Z0-9_]+' : {token, {string, TokenLine, TokenChars}}.

[a-z_][a-zA-Z_]* : {token, {lowercase_word, TokenLine, TokenChars}}.
[A-Z][a-zA-Z_]+ : {token, {capitalized_word, TokenLine, TokenChars}}.

\) : {token, {')', TokenLine, TokenChars}}.
\( : {token, {'(', TokenLine, TokenChars}}.
\} : {token, {'}', TokenLine, TokenChars}}.
#\{ : {token, {'#{', TokenLine, TokenChars}}.
\] : {token, {']', TokenLine, TokenChars}}.
\[ : {token, {'[', TokenLine, TokenChars}}.
\|~ : {token, {'|~', TokenLine, TokenChars}}.
~\| : {token, {'~|', TokenLine, TokenChars}}.
\|~~ : {token, {'|~~', TokenLine, TokenChars}}.
~~\| : {token, {'~~|', TokenLine, TokenChars}}.
\| : {token, {'|', TokenLine, TokenChars}}.

! : {token, {'!', TokenLine, TokenChars}}.
@ : {token, {'@', TokenLine, TokenChars}}.
# : {token, {'#', TokenLine, TokenChars}}.
\$ : {token, {'$', TokenLine, TokenChars}}.
\% : {token, {'%', TokenLine, TokenChars}}.
\^ : {token, {'^', TokenLine, TokenChars}}.
& : {token, {'&', TokenLine, TokenChars}}.

-> : {token, {'->', TokenLine, TokenChars}}.
\|_\| : {token, {'|_|', TokenLine, TokenChars}}.

\+ : {token, {'+', TokenLine, TokenChars}}.
- : {token, {'-', TokenLine, TokenChars}}.
\* : {token, {'*', TokenLine, TokenChars}}.
/ : {token, {'/', TokenLine, TokenChars}}.

, : {token, {',', TokenLine, TokenChars}}.
\. : {token, {'.', TokenLine, TokenChars}}.
\: : {token, {':', TokenLine, TokenChars}}.
\:> : {token, {':>', TokenLine, TokenChars}}.

<=> : {token, {'<=>', TokenLine, TokenChars}}.
=> : {token, {'=>', TokenLine, TokenChars}}.

== : {token, {'==', TokenLine, TokenChars}}.
!= : {token, {'!=', TokenLine, TokenChars}}.
>= : {token, {'>=', TokenLine, TokenChars}}.
<= : {token, {'<=', TokenLine, TokenChars}}.
> : {token, {'>', TokenLine, TokenChars}}.
< : {token, {'<', TokenLine, TokenChars}}.

[\s\n\t\r]+ : {token, {ws, TokenLine, TokenChars}}.

Erlang code.

