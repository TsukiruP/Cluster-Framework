/// player_reaction_item_box(obj, hitbox)
/* Get equipped with.... ring?! */

var reaction_handle, hitbox;

reaction_handle = argument0;
hitbox = argument1;

if ((hitbox & HIT_COLLISION) || (hitbox & HIT_ATTACK))
{
    if (!input_cpu || (input_cpu && input_cpu_gamepad_alarm > 0))
    {
        sonic_routine_homing();
        player_get_item(reaction_handle, reaction_handle.item_id);
        audio_play_sfx("snd_destroy", true);

        with (reaction_handle)
        {
            effect_create(x, y, sequence_explosion_small, -depth);
            instance_destroy();
        }
    }
}
