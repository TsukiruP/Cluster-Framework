/// sonic_state_skid(phase)
/// @desc Sliiiide to the left, sliiiide to the right. Criss cross!
/// @param {int} phase
/// @returns {bool}

var _phase; _phase = argument0;

switch (_phase)
{
    case STATE_START:
        player_set_animation("somersault");
        audio_play_sfx("snd_somersault", true);
        if (!peel_out && !boost_mode) x_speed = 3 * image_xscale;
        break;

    case STATE_STEP:
        var skid_super; skid_super = (peel_out || boost_mode);

        if (!on_ground)
        {
            if (!player_movement_air()) return false;
            if (player_routine_land()) return true;

            player_gravity_force();
        }
        else
        {
            // Friction:
            if (!skid_super)
            {
                if (animation_current == "skid") x_speed -= min(abs(x_speed), 0.125) * sign(x_speed);
                else x_speed -= min(abs(x_speed), acceleration) * sign(x_speed);
            }

            if (!player_movement_ground()) return false;

            if (abs(x_speed) < slide_threshold && relative_angle >= 90 && relative_angle <= 270) return player_set_state(player_state_air);

            if (x_speed != 0 && sign(x_speed) != image_xscale) return player_set_state(player_state_run);

            if (animation_trigger)
            {
                switch (animation_current)
                {
                    case "somersault":
                        player_set_animation("skid");
                        audio_play_sfx("snd_air_dash", true);
                        if (!skid_super) x_speed = 4 * image_xscale;
                        break;

                    case "skid_end":
                        return player_set_state(player_state_idle);
                }
            }
        }

        if (!on_ground)
        {
            if (ground_inst != noone) player_reset_air();

            if (animation_trigger)
            {
                animation_skip = true;
                player_set_animation("spin_flight");
                return player_set_state(player_state_jump, false);
            }
        }

        if (animation_current == "skid")
        {
            if (on_ground) player_brake_create();

            // Time out:
            if (animation_time >= 32)
            {
                if (on_ground)
                {
                    if (!skid_super) player_set_animation("skid_end");
                    else return player_set_state(player_state_run);
                }
                else
                {
                    player_reset_air();
                    animation_skip = true;
                    player_set_animation("spin_flight");
                    return player_set_state(player_state_jump, false);
                }
            }
        }
        break;

    case STATE_FINISH:
        break;
}
