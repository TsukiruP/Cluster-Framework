/// player_reaction_bubble(obj, hitbox)
/* Glub, glub. */

var reaction_inst, hitbox;

reaction_inst = argument0;
hitbox = argument1;

if (hitbox & HIT_COLLISION)
{
    if (!on_ground && reaction_inst.size == 2)
    {
        player_set_animation("breathe");
        player_set_state(player_state_air);
        x_speed = 0;
        y_speed = 0;
        air_remaining = 30;
        air_alarm = 60;
        audio_play_sfx("snd_bubble");
        if (!input_cpu) audio_stop_drown();

        with (reaction_inst)
        {
            instance_destroy();
        }
    }
}
