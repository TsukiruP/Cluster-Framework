/// player_reaction_spring(obj, collision)
/* Bounce Pad! Wait, no... */

var reaction_handle, collision;

reaction_handle = argument0;
collision = argument1;

if (collision & COLL_INTERACT)
{
    var is_dash_ring;

    is_dash_ring = (reaction_handle.object_index == obj_dash_ring);

    if (spring_alarm == 0 || spring_current != reaction_handle)
    {
        player_reset_spring();
        spring_current = reaction_handle;
        spring_force = spring_current.force;
        spring_angle = spring_current.angle;
        spring_alarm = spring_force + 15;

        x_speed = spring_force * dcos(spring_angle);
        y_speed = spring_force * -dsin(spring_angle);

        if (!(on_ground == true && (spring_angle == ANGLE_LEFT || spring_angle == ANGLE_RIGHT)) || is_dash_ring == true)
        {
            player_set_state(player_state_spring, true);
            y = reaction_handle.y;
        }
        else
        {
            input_lock_alarm = 16;
        }

        x = reaction_handle.x;

        if (dcos(spring_angle) != 0)
        {
            image_xscale = sign(dcos(spring_angle));
        }

        if (is_dash_ring == true)
        {
            if (reaction_handle.rainbow_score == true)
            {
                stage_add_score(1000);

                with (reaction_handle)
                {
                    rainbow_score = false;
                }
            }
        }

        if (reaction_handle.sfx_alarm == 0)
        {
            reaction_handle.sfx_alarm = 8;

            switch (reaction_handle.object_index)
            {
                case obj_dash_ring:
                    break;

                default:
                    audio_play_sfx("snd_spring", true);
            }
        }

        with (reaction_handle)
        {
            activated = true;
        }
    }
}
