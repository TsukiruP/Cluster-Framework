/// player_reaction_item_box(obj, collision)
/* Get equipped with.... ring?! */

var reaction_handle, collision;

reaction_handle = argument0;
collision = argument1;

if ((collision & COLL_INTERACT) || (collision & COLL_HIT))
{
    if (!input_cpu || (input_cpu && input_cpu_gamepad_alarm > 0))
    {
        sonic_routine_homing();
        player_get_item(reaction_handle, reaction_handle.item_id);
        audio_play_sfx("snd_destroy", true);

        with (reaction_handle)
        {
            player_handle = other.id;
            effect_create(sequence_explosion_small, x, y, -depth);
            instance_destroy();
        }
    }
}
