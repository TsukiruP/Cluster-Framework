/// player_react(obj, [hitbox], [side])
/// @desc Returns whether the player's current state should be aborted or not after performing a reaction.
/// @param {object} obj
/// @param {int} [hitbox]
/// @param {number} [side]
/// @returns {bool}

var _obj; _obj = argument[0];
var _hitbox; if (argument_count > 1) _hitbox = argument[1]; else _hitbox = 0;
var _side; if (argument_count > 2) _side = argument[2]; else _side = angle_wrap(round(point_direction(_obj.x, _obj.y, x, y) / ANGLE_UP) * ANGLE_UP);;

_hitbox |= player_get_hitbox(_obj);

var reaction_index; reaction_index = _obj.reaction_index;

if (script_exists(reaction_index))
{
    var x_speed_temp; x_speed_temp = x_speed;
    var y_speed_temp; y_speed_temp = y_speed;

    if (object_is_ancestor(_obj.object_index, par_solid))
    {
        if (!_obj.reaction_solid || (_obj.reaction_solid && (_hitbox & HIT_SOLID)))
        {
            script_execute(reaction_index, _obj, _hitbox, _side);
        }
    }
    else
    {
        if (_obj.reaction_mask) _hitbox |= HIT_MASK;
        script_execute(reaction_index, _obj, _hitbox);
    }

    if (ds_list_find_index(solid_list, _obj) != -1)
    {
        if (x_speed_temp != x_speed || y_speed_temp != y_speed || !_obj.collision || !instance_exists(_obj)) return true;
    }

    return state_changed;
}

return false;
