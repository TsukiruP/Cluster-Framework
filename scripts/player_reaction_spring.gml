/// player_reaction_spring(obj, collision)
// Bounce Pad! Wait, no...

var reaction_handle, collision;

reaction_handle = argument0;
collision = argument1;

// Activate spring:
if (collision & COLL_HURT_RADIUS)
{
    var is_dash_ring;

    // Dash ring:
    is_dash_ring = (reaction_handle.object_index == obj_dash_ring);

    // React:
    if (spring_alarm == 0 || spring_current != reaction_handle)
    {
        // Reset:
        player_reset_spring();

        // Set spring:
        spring_current = reaction_handle;
        spring_force = spring_current.force;
        spring_angle = spring_current.angle;
        spring_alarm = spring_force + 15;

        // Set speed:
        x_speed = spring_force * dcos(spring_angle);
        y_speed = spring_force * -dsin(spring_angle);

        // Set state:
        if (!(on_ground == true && (spring_angle == ANGLE_LEFT || spring_angle == ANGLE_RIGHT)) || is_dash_ring == true)
        {
            // Set state:
            player_reset_air();
            player_reset_skill();
            player_animation_air();
            player_set_state(player_state_air, false);
            y = reaction_handle.y;
        }
        else
        {
            input_lock_alarm = 16;
        }

        x = reaction_handle.x;

        // Set direction:
        if (dcos(spring_angle) != 0)
        {
            image_xscale = sign(dcos(spring_angle));
        }

        // Score:
        if (is_dash_ring == true)
        {
            if (reaction_handle.rainbow_score == true)
            {
                global.game_score += 1000;

                with (reaction_handle)
                {
                    rainbow_score = false;
                }
            }
        }

        // Activate:
        with (reaction_handle)
        {
            activated = true;
        }

        // Play sound:
        if (reaction_handle.sfx_alarm == 0)
        {
            switch (reaction_handle.object_index)
            {
                // Dash ring:
                case obj_dash_ring:
                    break;

                    // Spring:
                default:
                    sound_play_single("snd_spring");
            }

            // SFX alarm:
            reaction_handle.sfx_alarm = 8;
        }
    }
}
