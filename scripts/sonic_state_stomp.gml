/// sonic_state_stomp(phase)
/* A Smashing good time. */

switch (argument0)
{
    case STATE_START:
        x_speed = 0;
        y_speed = 0;
        player_set_animation("stomp");
        audio_play_sfx("snd_stomp", true);
        break;

    case STATE_STEP:
        if (on_ground == false)
        {
            var stomp_allow;

            stomp_allow = (image_index >= 5)

            if (stomp_allow == true)
            {
                if (image_index == 5)
                {
                    x_speed = 10 * image_xscale;
                    y_speed = 10;
                }

                if (!player_movement_air())
                {
                    return false;
                }

                if (on_ground == true)
                {
                    var sine, csine;

                    x_speed = 0;
                    player_set_animation("stomp_land");
                    audio_play_sfx("snd_stomp_land", true);
                    audio_stop_sfx("snd_stomp");

                    sine = dsin(mask_rotation);
                    csine = dcos(mask_rotation);

                    with(effect_create(ctl_shockwave, x + sine * y_radius, y + csine * y_radius))
                    {
                        image_angle = angle_wrap(other.mask_rotation - 90);
                        image_alpha = 0.5;
                    }
                }

                if (y_allow == true)
                {
                    y_speed += gravity_force;
                }
            }
        }

        else
        {
            if (!player_movement_ground())
            {
                return false;
            }

            if (on_ground == false)
            {
                return player_set_state(player_state_air);
            }

            if (player_get_input(INP_DOWN, CHECK_HELD) && player_get_input(INP_JUMP, CHECK_PRESSED))
            {
                return player_set_state(player_state_spin_dash);
            }

            if (game_get_save("sonic_peel") == true && player_get_input(INP_UP, CHECK_HELD) && player_get_input(INP_JUMP, CHECK_PRESSED))
            {
                return player_set_state(sonic_state_peel_out);
            }

            if (animation_finished == true)
            {
                return player_set_state(player_state_idle);
            }
        }
        break;

    case STATE_FINISH:
        audio_stop_sfx("snd_stomp");
        break;
}
