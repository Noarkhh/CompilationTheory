Definitions.
Rules.

\) : {token, {')', TokenLine}}.
\( : {token, {'(', TokenLine}}.
[a-zA-Z]+ : {token, {atom, TokenLine, TokenChars}}.

Erlang code.