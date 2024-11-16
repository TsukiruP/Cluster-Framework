/// sonic_state_stomp(phase)
//

switch (argument0)
{
    // Start:
    case STATE_START:
        // Set speed:
        x_speed = 0;
        y_speed = 0;

        // Set animation:
        player_set_animation("stomp");

        // Play sfx:
        sfx_play("snd_stomp", true);
        break;

    // Step:
    case STATE_STEP:
        // Air movement:
        if (on_ground == false)
        {
            var stomp_allow;

            // Stomp allow:
            stomp_allow = (image_index >= 5)

            if (stomp_allow == true)
            {
                // Set speed:
                if (image_index == 5)
                {
                    x_speed = 10 * image_xscale;
                    y_speed = 10;
                }

                // Movement:
                if (!player_movement_air())
                {
                    exit;
                }

                // Land:
                if (on_ground == true)
                {
                    var sine, csine;

                    // Set speed:
                    x_speed = 0;

                    // Set animation:
                    player_set_animation("stomp_land");

                    // Stop sfx:
                    sfx_stop("snd_stomp");

                    // Play sfx:
                    sfx_play("snd_stomp_land", true);

                    // Create shockwave:
                    sine = dsin(mask_rotation);
                    csine = dcos(mask_rotation);

                    with(effect_create(ctl_shockwave, x + sine * y_radius, y + csine * y_radius))
                    {
                        image_angle = angle_wrap(other.mask_rotation - 90);
                        image_alpha = 0.5;
                    }
                }

                // Gravity:
                if (y_allow == true)
                {
                    y_speed += gravity_force;
                }
            }
        }

        // Ground movement:
        else
        {
            // Movement:
            if (!player_movement_ground())
            {
                exit;
            }

            // Fall:
            if (on_ground == false)
            {
                return player_set_state(player_state_air);
            }

            // Super Peel Out:
            if (save_get("sonic_peel") == true && input_player[INP_UP, CHECK_HELD] == true && input_player[INP_JUMP, CHECK_PRESSED] == true)
            {
                return player_set_state(sonic_state_peel_out);
            }

            // Spin Dash:
            if (input_player[INP_DOWN, CHECK_HELD] == true && input_player[INP_JUMP, CHECK_PRESSED] == true)
            {
                return player_set_state(player_state_spin_dash);
            }

            // Idle:
            if (animation_finished == true)
            {
                return player_set_state(player_state_idle);
            }
        }
        break;

    // Finish:
    case STATE_FINISH:
        // Stop sfx:
        sfx_stop("snd_stomp");
        break;
}
