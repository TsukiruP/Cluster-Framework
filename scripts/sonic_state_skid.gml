/// sonic_state_skid(phase)
/* Sliiiide to the left, sliiiide to the right. Criss cross!
Based on the move from Advancee 2.
The few states that apply both the ground and air movement.
First the Sonic's speed is set to 3 and their animation is set to somersault.
When the somersault ends, it either continues into the slide or enters the jump state.
Sliding lasts 32 frames, and then similar to above occurs: either Sonic gets up or enters the jump state. */

switch (argument0)
{
    // Start:
    case STATE_START:
        // Set speed:
        x_speed = 3 * image_xscale;

        // Set animation:
        player_set_animation("somersault");
        
        // Play sfx:
        sfx_play("snd_somersault", true);
        break;

    // Step:
    case STATE_STEP:
        // Air movement:
        if (on_ground == false)
        {
            if (!player_movement_air())
            {
                exit;
            }

            // Land:
            if (player_routine_land())
            {
                return true;
            }

            // Gravity:
            if (y_allow == true)
            {
                y_speed += gravity_force;
            }
        }

        // Ground movement:
        else
        {
            // Friction:
            if (animation_current == "skid")
            {
                x_speed -= min(abs(x_speed), 0.125) * sign(x_speed);
            }
            else
            {
                x_speed -= min(abs(x_speed), acceleration) * sign(x_speed);
            }

            // Movement:
            if (!player_movement_ground())
            {
                exit;
            }

            // Slide off:
            if (abs(x_speed) < slide_threshold && relative_angle >= 45 && relative_angle <= 315)
            {
                // Fall:
                if (relative_angle >= 90 && relative_angle <= 270)
                {
                    return player_set_state(player_state_air);
                }
            }

            // Cancel:
            if (x_speed != 0 && sign(x_speed) != image_xscale)
            {
                return player_set_state(player_state_run);
            }

            // Finish animation:
            if (animation_finished == true)
            {
                switch (animation_current)
                {
                    // Skid:
                    case "somersault":
                        x_speed = 4 * image_xscale;
                        
                        // Set animation:
                        player_set_animation("skid");
                        
                        // Play sfx:
                        sfx_play("snd_air_dash", true);
                        break;

                    // Idle:
                    case "skid_end":
                        return player_set_state(player_state_idle);
                }
            }
        }

        // Fall:
        if (on_ground == false)
        {
            // Reset air:
            if (ground_id != noone)
            {
                player_reset_air();
            }

            // Jump:
            if (animation_finished == true)
            {
                animation_skip = true;
                player_set_animation("spin");

                return player_set_state(player_state_jump, false);
            }
        }

        // Skid behavior:
        if (animation_current == "skid")
        {
            // Dust:
            if (on_ground == true)
            {
                // Dust:
                player_brake_dust();
            }

            // Time out:
            if (animation_timer >= 32)
            {
                // Get up:
                if (on_ground == true)
                {
                    player_set_animation("skid_end");
                }

                // Jump:
                else
                {
                    player_reset_air();
                    animation_skip = true;
                    player_set_animation("spin");

                    return player_set_state(player_state_jump, false);
                }
            }
        }
        break;

    // Finish:
    case STATE_FINISH:
        break;
}
