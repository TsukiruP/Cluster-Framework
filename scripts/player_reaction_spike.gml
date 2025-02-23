/// player_reaction_spike(inst, hitbox, side)
/// @desc 
/// @param {object} inst
/// @param {int} hitbox
/// @param {number} side
/// @returns {void}

var _inst; _inst = argument0;
var _hitbox; _hitbox = argument1;
var _side; _side = argument2;

if ((_hitbox & HIT_COLLISION) && _side == _inst.angle) player_set_damage(_inst);