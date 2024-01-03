Definitions.
Rules.

[+-]?[0-9]+ : {token, {int, TokenLine, list_to_integer(TokenChars)}}.

\) : {token, {')', TokenLine}}.
\( : {token, {'(', TokenLine}}.
\} : {token, {'}', TokenLine}}.
\{ : {token, {'{', TokenLine}}.
\] : {token, {']', TokenLine}}.
\[ : {token, {'[', TokenLine}}.
\|~ : {token, {'|~', TokenLine}}.
~\| : {token, {'~|', TokenLine}}.

or : {token, {'or', TokenLine}}.
and : {token, {'and', TokenLine}}.
not : {token, {'not', TokenLine}}.

! : {token, {'!', TokenLine}}.
@ : {token, {'@', TokenLine}}.
# : {token, {'#', TokenLine}}.
\$ : {token, {'$', TokenLine}}.
\% : {token, {'%', TokenLine}}.
\^ : {token, {'^', TokenLine}}.
& : {token, {'&', TokenLine}}.

-> : {token, {'->', TokenLine}}.
|_| : {token, {'|_|', TokenLine}}.

\+ : {token, {'+', TokenLine}}.
- : {token, {'-', TokenLine}}.
\* : {token, {'*', TokenLine}}.
/ : {token, {'/', TokenLine}}.

[a-zA-Z]+ : {token, {atom, TokenLine, TokenChars}}.

Erlang code.

