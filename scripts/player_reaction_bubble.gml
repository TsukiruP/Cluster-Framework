/// player_reaction_bubble(obj, collision)
/* Glub, glub. */

var reaction_handle, collision;

reaction_handle = argument0;
collision = argument1;

if (collision & COLL_INTERACT)
{
    if (!on_ground && reaction_handle.size == 2)
    {
        player_set_animation("breathe");
        player_set_state(player_state_air);
        x_speed = 0;
        y_speed = 0;
        air_remaining = 30;
        air_alarm = 60;
        audio_play_sfx("snd_breathe");
        if (!input_cpu) audio_stop_drown();

        with (reaction_handle)
        {
            instance_destroy();
        }
    }
}
