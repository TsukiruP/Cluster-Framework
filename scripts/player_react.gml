/// player_react(inst, [hitbox], [side])
/// @desc Returns whether the player's current state should be aborted or not after performing a reaction.
/// @param {object} inst
/// @param {int} [hitbox]
/// @param {number} [side]
/// @returns {bool}

var _inst; _inst = argument[0];
var _hitbox; if (argument_count > 1) _hitbox = argument[1]; else _hitbox = 0;
var _side; if (argument_count > 2) _side = argument[2]; else _side = angle_wrap(round(point_direction(_inst.x, _inst.y, x, y) / ANGLE_UP) * ANGLE_UP);;

_hitbox |= player_get_hitbox(_inst);

var reaction_index; reaction_index = _inst.reaction_index;

if (script_exists(reaction_index))
{
    var x_speed_temp; x_speed_temp = x_speed;
    var y_speed_temp; y_speed_temp = y_speed;

    if (object_is_ancestor(_inst.object_index, par_solid))
    {
        if (!_inst.reaction_mask || (_inst.reaction_mask && (_hitbox & HIT_SOLID)))
        {
            script_execute(reaction_index, _inst, _hitbox, _side);
        }
    }
    else script_execute(reaction_index, _inst, _hitbox);

    if (ds_list_find_index(solid_list, _inst) != -1)
    {
        if (x_speed_temp != x_speed || y_speed_temp != y_speed || !_inst.collision || !instance_exists(_inst)) return true;
    }

    return state_changed;
}

return false;