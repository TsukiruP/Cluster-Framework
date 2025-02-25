/// player_reaction_switch(obj, hitbox, side)
/// @desc Wow wow wow (Fourze!) Wow wow wow (Ikou ze!)
/// @param {object} obj
/// @param {int} hitbox
/// @param {number} side
/// @returns {void}

var _obj; _obj = argument0;
var _hitbox; _hitbox = argument1;
var _side; _side = argument2;

if ((_hitbox & HIT_ATTACK) || ((_hitbox & HIT_SOLID) && _side == _obj.angle))
{
    if (!input_cpu)
    {
        with (_obj) target_time = game_get_time() + duration;
    }
}
