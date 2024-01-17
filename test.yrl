Nonterminals
opt_ws block module modules module_body
function functions function_signature.

Terminals
capitalized_word lowercase_word
ws
mod '~~|' '|~~'
fn '~|' '|~' '(' ')'.

Rootsymbol
block.

opt_ws -> ws.
opt_ws -> '$empty'.

block -> opt_ws modules opt_ws.

module -> 'mod' ws capitalized_word ws '~~|' opt_ws functions opt_ws '|~~'.

modules -> module.
modules -> modules ws module.

functions -> function.
functions -> functions ws function.

function -> 'fn' ws function_signature ws '~|' opt_ws '|~'.

% function_signature -> lowercase_word '(' opt_ws comma_separated_terms opt_ws ')'.
function_signature -> lowercase_word '(' opt_ws ')'.