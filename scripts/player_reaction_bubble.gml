/// player_reaction_bubble(inst, hitbox)
/// @desc Glub, glub.
/// @param {object} inst
/// @param {int} hitbox
/// @returns {void}

var _inst; _inst = argument0;
var _hitbox; _hitbox = argument1;

if (_hitbox & HIT_COLLISION)
{
    if (!on_ground && _inst.size == 2)
    {
        player_set_animation("breathe");
        player_set_state(player_state_air);
        x_speed = 0;
        y_speed = 0;
        air_remaining = 30;
        air_alarm = 60;
        audio_play_sfx("snd_bubble");
        if (!input_cpu) audio_stop_drown();

        with (_inst)
        {
            instance_destroy();
        }
    }
}
