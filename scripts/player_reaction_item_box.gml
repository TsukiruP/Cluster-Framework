/// player_reaction_item_box(obj, hitbox)
/// @desc Get equipped with.... ring?!
/// @param {object} obj
/// @param {int} hitbox
/// @returns {void}

var _obj; _obj = argument0;
var _hitbox; _hitbox = argument1;

if ((_hitbox & HIT_INTERACT) || (_hitbox & HIT_ATTACK))
{
    if (!input_cpu || (input_cpu && input_cpu_gamepad_alarm > 0))
    {
        sonic_routine_homing();
        player_get_item(_obj, _obj.item_index);
        audio_play_sfx("snd_destroy", true);

        with (_obj)
        {
            effect_create(x, y, sequence_explosion_small, -depth);
            instance_destroy();
        }
    }
}
