/// sonic_state_skid(phase)
/* Sliiiide to the left, sliiiide to the right. Criss cross!
Based on the move from Advancee 2.
The few states that apply both the ground and air movement.
First the Sonic's speed is set to 3 and their animation is set to somersault.
When the somersault ends, it either continues into the slide or enters the jump state.
Sliding lasts 32 frames, and then similar to above occurs: either Sonic gets up or enters the jump state. */

switch (argument0)
{
    case STATE_START:
        player_set_animation("somersault");
        audio_play_sfx("snd_somersault", true);
        if (!peel_out) x_speed = 3 * image_xscale;
        break;

    case STATE_STEP:
        if (!on_ground)
        {
            if (!player_movement_air()) return false;
            if (player_routine_land()) return true;
            
            if (y_allow) y_speed += gravity_force;
        }

        else
        {
            // Friction:
            if (!peel_out)
            {
                if (animation_current == "skid") x_speed -= min(abs(x_speed), 0.125) * sign(x_speed);
                else x_speed -= min(abs(x_speed), acceleration) * sign(x_speed);
            }

            if (!player_movement_ground()) return false;

            if (abs(x_speed) < slide_threshold && relative_angle >= 90 && relative_angle <= 270) return player_set_state(player_state_air);

            if (x_speed != 0 && sign(x_speed) != image_xscale) return player_set_state(player_state_run);

            if (animation_finished)
            {
                switch (animation_current)
                {
                    case "somersault":
                        player_set_animation("skid");
                        audio_play_sfx("snd_air_dash", true);
                        if (!peel_out) x_speed = 4 * image_xscale;
                        break;

                    case "skid_end":
                        return player_set_state(player_state_idle);
                }
            }
        }

        if (!on_ground)
        {
            if (ground_id != noone) player_reset_air();

            if (animation_finished)
            {
                animation_skip = true;
                player_set_animation("spin");
                return player_set_state(player_state_jump, false);
            }
        }

        if (animation_current == "skid")
        {
            if (on_ground) player_brake_dust();

            // Time out:
            if (animation_time >= 32)
            {
                if (on_ground)
                {
                    if (!peel_out) player_set_animation("skid_end");
                    else return player_set_state(player_state_run);
                }
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

    case STATE_FINISH:
        break;
}
