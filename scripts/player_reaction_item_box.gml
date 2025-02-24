/// player_reaction_item_box(inst, hitbox)
/// @desc Get equipped with.... ring?!
/// @param {object} inst
/// @param {int} hitbox
/// @returns {void}

var _inst; _inst = argument0;
var _hitbox; _hitbox = argument1;

if ((_hitbox & HIT_COLLISION) || (_hitbox & HIT_ATTACK))
{
    if (!input_cpu || (input_cpu && input_cpu_gamepad_alarm > 0))
    {
        sonic_routine_homing();
        player_get_item(_inst, _inst.item_index);
        audio_play_sfx("snd_destroy", true);

        with (_inst)
        {
            effect_create(x, y, sequence_explosion_small, -depth);
            instance_destroy();
        }
    }
}