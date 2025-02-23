/// player_reaction_rail(inst, hitbox, side)
/// @desc Playing SA2 is habit forming, don't turn off!
/// @param {object} inst
/// @param {int} hitbox
/// @param {number} side
/// @returns {void}

var _inst; _inst = argument0;
var _hitbox; _hitbox = argument1;
var _side; _side = argument2;

if ((_hitbox & HIT_SOLID) && _side == ANGLE_UP)
{
    player_set_state(player_state_rail);
    if (_inst != ground_inst) player_set_ground(_inst);
}