/// player_reaction_dash_panel(obj, hitbox)
/* Like an onion. */

var reaction_handle, hitbox;

reaction_handle = argument0;
hitbox = argument1;

if (hitbox & HIT_COLLISION)
{
    if (booster_current != reaction_handle || input_lock_alarm == 0)
    {
        if (gravity_direction != reaction_handle.gravity_direction)
        {
            mask_rotation = reaction_handle.gravity_direction;
            player_set_state(player_state_run);
        }

        image_xscale = reaction_handle.image_xscale;
        x_speed = reaction_handle.force * image_xscale;
        input_lock_alarm = 16;
        booster_current = reaction_handle;

        with (reaction_handle)
        {
            if (sfx_alarm == 0)
            {
                sfx_alarm = 8;
                audio_play_sfx("snd_booster", true);
            }
        }
    }
}
