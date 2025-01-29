/// player_reaction_jump_panel(obj, interaction, side)
/* Really stupid commitment to game accuracy. */

var reaction_handle, interaction, side;

reaction_handle = argument0;
interaction = argument1;
side = argument2;


if ((interaction & INTERACT_SOLID) && side == ANGLE_DOWN)
{
    image_xscale = reaction_handle.image_xscale;
    x_speed = reaction_handle.force * image_xscale;
    input_lock_alarm = 16;
    if (ground_id != reaction_handle) player_set_ground(reaction_handle);

    if (interaction & INTERACT_MUTUAL)
    {
        y_speed = -6;
        player_set_state(player_state_ramp, true);
        audio_play_sfx("snd_booster");
    }
}
