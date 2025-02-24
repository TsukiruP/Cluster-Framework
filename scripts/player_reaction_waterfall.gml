/// player_reaction_waterfall(inst, hitbox)
/// @desc Really stupid commitment to game accuracy.
/// @param {object} inst
/// @param {int} hitbox
/// @returns {void}

var _inst; _inst = argument0;
var _hitbox; _hitbox = argument1;

if (_hitbox & HIT_COLLISION) waterfall_draw = true;
