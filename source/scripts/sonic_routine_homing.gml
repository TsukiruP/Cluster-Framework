/// sonic_routine_homing([reset])
/// @desc Performs a jump after landing a homing attack.
/// @param {bool} [reset]
/// @returns {void}

var _reset; if (argument_count > 0) _reset = argument[0]; else _reset = true;;

if (state_current == sonic_state_homing)
{
    if (_reset)
    {
        x_speed = 0;
        y_speed = -jump_force;
    }
    
    animation_skip = true;
    player_set_state(player_state_jump, false);
    player_reset_skill(true);
}
