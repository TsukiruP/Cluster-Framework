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
    x_speed = max(abs(x_speed), _obj.force) * image_xscale;
    input_lock_alarm = 16;

    if (_hitbox & HIT_RADII)
    {
        y_speed = -6;
        player_set_state(player_state_ramp, true);

        with (_obj)
        {
            if (sfx_alarm == 0)
            {
                sfx_alarm = 8;
                audio_play_sfx("snd_dash_panel", true);
            }
        }
    }
}
