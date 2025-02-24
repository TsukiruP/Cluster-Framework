/// player_reaction_jump_panel(inst, hitbox, side)
/// @desc
/// @param {object} inst
/// @param {int} hitbox
/// @param {number} side
/// @returns {void}

var _inst; _inst = argument0;
var _hitbox; _hitbox = argument1;
var _side; _side = argument2;

if ((_hitbox & HIT_SOLID) && _side == ANGLE_UP)
{
    image_xscale = _inst.image_xscale;
    x_speed = _inst.force * image_xscale;
    input_lock_alarm = 16;
    if (ground_inst != _inst) player_set_ground(_inst);

    if (_hitbox & HIT_COLLISION)
    {
        y_speed = -6;
        player_set_state(player_state_ramp, true);
        audio_play_sfx("snd_dash_panel");
    }
}