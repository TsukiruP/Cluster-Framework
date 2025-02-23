/// player_reaction_dash_panel(obj, hitbox)
/* Like an onion. */

var reaction_inst, hitbox;

reaction_inst = argument0;
hitbox = argument1;

if (hitbox & HIT_COLLISION)
{
    if (booster_current != reaction_inst || input_lock_alarm == 0)
    {
        if (gravity_direction != reaction_inst.angle)
        {
            mask_rotation = reaction_inst.angle;
            player_set_state(player_state_run);
        }

        //image_xscale = reaction_inst.image_xscale;
        image_xscale = pick(reaction_inst.variant, reaction_inst.image_xscale, reaction_inst.image_yscale);
        x_speed = reaction_inst.force * image_xscale;
        input_lock_alarm = 16;
        booster_current = reaction_inst;

        with (reaction_inst)
        {
            if (sfx_alarm == 0)
            {
                sfx_alarm = 8;
                audio_play_sfx("snd_dash_panel", true);
            }
        }
    }
}
