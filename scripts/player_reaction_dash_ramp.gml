/// player_reaction_dash_ramp(obj, collision)
/* Really stupid commitment to game accuracy. */

var reaction_handle, collision;

reaction_handle = argument0;
collision = argument1;

if (collision & COLL_FLOOR & COLL_INTERACT)
{
    if (on_ground)
    {
        image_xscale = reaction_handle.image_xscale;
        x_speed = max(abs(x_speed), top_speed) * image_xscale;
        input_lock_alarm = 16;

        if (collision & COLL_HURT)
        {
            y_speed = -6;
            player_set_state(player_state_ramp, true);
            audio_play_sfx("snd_booster");
        }
    }
}
