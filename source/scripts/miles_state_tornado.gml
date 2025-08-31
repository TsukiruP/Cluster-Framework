/// miles_state_tornado(phase)
/// @desc Float. Drill. Tornado. Spinning Dance.
/// @param {int} phase
/// @returns {bool}

var _phase; _phase = argument0;

switch (_phase)
{
    case STATE_START:
        player_set_animation("windup");
        break;

    case STATE_STEP:
        if (on_ground)
        {
            var tornado_speed; tornado_speed = top_speed / 2;

            if (input_x_direction != 0)
            {
                if (x_speed != 0 && sign(x_speed) != input_x_direction)
                {
                    x_speed += deceleration * input_x_direction;
                    if (sign(x_speed) == input_x_direction) x_speed = deceleration * input_x_direction;
                }
                else
                {
                    if (abs(x_speed) < tornado_speed)
                    {
                        x_speed += acceleration * input_x_direction;
                        if (abs(x_speed) > tornado_speed) x_speed = (tornado_speed) * input_x_direction
                    }
                }
            }
            else if (input_lock_alarm == 0) x_speed -= min(abs(x_speed), acceleration) * sign(x_speed);

            if (abs(x_speed) > tornado_speed && !boost_mode) x_speed -= min(abs(x_speed), acceleration) * sign(x_speed);

            if (!player_movement_ground()) return false;

            if (!on_ground)
            {
                player_reset_air_speed();
                return true;
            }

            if (relative_angle >= 45 && relative_angle <= 315) return player_set_state(player_state_run);
            if (animation_time >= 180) return player_set_state(miles_state_dizzy);

            if (animation_trigger)
            {
                switch (animation_current)
                {
                    case "tornado":
                        if (!player_get_input(INP_AUX, CHECK_HELD)) return player_set_animation("tornado_end");
                        break;

                    case "tornado_end":
                        return player_set_state(player_state_idle);
                        break;
                }
            }
        }
        else
        {
            if (input_x_direction != 0)
            {
                image_xscale = input_x_direction;

                if (abs(x_speed) < top_speed || sign(x_speed) != input_x_direction)
                {
                    x_speed += (acceleration * 2) * input_x_direction;
                    if (abs(x_speed) > top_speed && sign(x_speed) == input_x_direction) x_speed = top_speed * input_x_direction;
                }
            }

            if (!player_movement_air()) return false;
            if (player_routine_land()) return true;

            player_gravity_force();
        }

        if (animation_current == "tornado")
        {
            if (!sound_isplaying("snd_tornado"))
            {
                audio_stop_sfx(tornado_sfx);
                tornado_sfx = audio_loop_sfx("snd_tornado", true);
            }
        }
        else audio_stop_sfx(tornado_sfx);
        break;

    case STATE_FINISH:
        audio_stop_sfx(tornado_sfx);
        break;
}
