/// player_reaction_switch(inst, hitbox, side)
/// @desc Wow wow wow (Fourze!) Wow wow wow (Ikou ze!)
/// @param {object} inst
/// @param {int} hitbox
/// @param {number} side
/// @returns {void}

var _inst; _inst = argument0;
var _hitbox; _hitbox = argument1;
var _side; _side = argument2;

if ((_hitbox & HIT_ATTACK) || ((_hitbox & HIT_SOLID) && _side == _inst.angle))
{
    if (!input_cpu)
    {
        with (_inst) target_time = game_get_time() + duration;
    }
}