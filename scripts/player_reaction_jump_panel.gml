/// player_reaction_jump_panel(obj, hitbox, side)
/* Really stupid commitment to game accuracy. */

var reaction_handle, hitbox, side;

reaction_handle = argument0;
hitbox = argument1;
side = argument2;


if ((hitbox & HIT_SOLID) && side == ANGLE_DOWN)
{
    image_xscale = reaction_handle.image_xscale;
    x_speed = reaction_handle.force * image_xscale;
    input_lock_alarm = 16;
    if (ground_id != reaction_handle) player_set_ground(reaction_handle);

    if (hitbox & HIT_COLLISION)
    {
        y_speed = -6;
        player_set_state(player_state_ramp, true);
        audio_play_sfx("snd_booster");
    }
}
