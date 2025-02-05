/// player_reaction_dash_panel(obj, hitbox)
/* Like an onion. */

var reaction_id, hitbox;

reaction_id = argument0;
hitbox = argument1;

if (hitbox & HIT_COLLISION)
{
    if (booster_current != reaction_id || input_lock_alarm == 0)
    {
        if (gravity_direction != reaction_id.angle)
        {
            mask_rotation = reaction_id.angle;
            player_set_state(player_state_run);
        }

        //image_xscale = reaction_id.image_xscale;
        image_xscale = pick(reaction_id.variant, reaction_id.image_xscale, reaction_id.image_yscale);
        x_speed = reaction_id.force * image_xscale;
        input_lock_alarm = 16;
        booster_current = reaction_id;

        with (reaction_id)
        {
            if (sfx_alarm == 0)
            {
                sfx_alarm = 8;
                audio_play_sfx("snd_booster", true);
            }
        }
    }
}
