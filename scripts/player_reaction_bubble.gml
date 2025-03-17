/// player_reaction_bubble(obj, hitbox)
/// @desc Glub, glub.
/// @param {object} obj
/// @param {int} hitbox
/// @returns {void}

var _obj; _obj = argument0;
var _hitbox; _hitbox = argument1;

if (_hitbox & HIT_INTERACT)
{
    if (!on_ground && status_shield != SHIELD_BUBBLE && _obj.size == 2)
    {
        player_set_animation("breathe");
        player_set_state(player_state_air);
        x_speed = 0;
        y_speed = 0;
        player_reset_breath();
        audio_play_sfx("snd_bubble");
        if (!input_cpu) audio_stop_drown();
        instance_destroy_id(_obj);
    }
}
