/// player_reaction_jump_panel(obj, hitbox, side)
/// @desc
/// @param {object} obj
/// @param {int} hitbox
/// @param {number} side
/// @returns {void}

var _obj; _obj = argument0;
var _hitbox; _hitbox = argument1;
var _side; _side = argument2;

if ((_hitbox & HIT_SOLID) && _side == ANGLE_UP)
{
    image_xscale = _obj.image_xscale;
    x_speed = _obj.force * image_xscale;
    input_lock_alarm = 16;
    if (ground_inst != _obj) player_set_ground(_obj);

    if (_hitbox & HIT_INTERACT)
    {
        y_speed = -6;
        player_set_state(player_state_ramp, true);
        audio_play_sfx("snd_dash_panel");
    }
}
