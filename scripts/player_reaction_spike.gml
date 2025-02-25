/// player_reaction_spike(obj, hitbox, side)
/// @desc
/// @param {object} obj
/// @param {int} hitbox
/// @param {number} side
/// @returns {void}

var _obj; _obj = argument0;
var _hitbox; _hitbox = argument1;
var _side; _side = argument2;

if ((_hitbox & HIT_INTERACT) && _side == _obj.angle) player_set_damage(_obj);
