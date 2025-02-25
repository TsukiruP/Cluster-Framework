/// player_reaction_waterfall(obj, hitbox)
/// @desc Really stupid commitment to game accuracy.
/// @param {object} obj
/// @param {int} hitbox
/// @returns {void}

var _obj; _obj = argument0;
var _hitbox; _hitbox = argument1;

if (_hitbox & HIT_COLLISION) waterfall_draw = true;
