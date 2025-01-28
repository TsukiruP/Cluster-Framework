/// player_reaction_spring(obj, interaction)
/* Bounce Pad! Wait, no... */

var reaction_handle, interaction;

reaction_handle = argument0;
interaction = argument1;

if (interaction & INTERACT_MUTUAL)
{
    if (spring_current != reaction_handle || spring_alarm == 0)
    {
        var is_dash_ring;

        is_dash_ring = (reaction_handle.object_index == obj_dash_ring);

        player_reset_spring();
        spring_current = reaction_handle;
        spring_force = spring_current.force;
        spring_angle = spring_current.angle;
        spring_alarm = spring_force + 15;

        x_speed = spring_force * dcos(spring_angle);
        y_speed = spring_force * -dsin(spring_angle);

        if (!(on_ground && (spring_angle == ANGLE_LEFT || spring_angle == ANGLE_RIGHT)) || is_dash_ring)
        {
            y = reaction_handle.y;
            player_set_state(player_state_spring, true);
        }
        else input_lock_alarm = 16;

        x = reaction_handle.x;
        if (dcos(spring_angle) != 0) image_xscale = sign(dcos(spring_angle));

        with (reaction_handle)
        {
            activated = true;

            if (is_dash_ring)
            {
                if (rainbow_score)
                {
                    rainbow_score = false;
                    stage_add_score(1000);
                }
            }

            if (sfx_alarm == 0)
            {
                sfx_alarm = 8;

                switch (object_index)
                {
                    case obj_dash_ring:
                        audio_play_sfx(pick(rainbow_ring, "snd_dash_ring", "snd_rainbow_ring"), true);
                        break;

                    default:
                        audio_play_sfx("snd_spring", true);
                }
            }
        }
    }
}
