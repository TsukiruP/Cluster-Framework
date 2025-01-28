/// player_reaction_dash_ramp(obj, interaction, side)
/* Really stupid commitment to game accuracy. */

var reaction_handle, interaction, side;

reaction_handle = argument0;
interaction = argument1;
side = argument2;

if (interaction & INTERACT_SOLID && side == ANGLE_DOWN)
{
    if (on_ground)
    {
        image_xscale = reaction_handle.image_xscale;
        x_speed = min(abs(x_speed) + acceleration, max_speed) * image_xscale;
        input_lock_alarm = 16;

        if (interaction & INTERACT_HIT)
        {
            x_speed += 3 * image_xscale;
            y_speed = -6;
            player_set_state(player_state_ramp, true);
            audio_play_sfx("snd_booster");
        }
    }
}
