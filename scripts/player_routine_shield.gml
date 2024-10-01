/// player_routine_shield()
// Or barriers, for the nerds.

// Disable shield:
status_shield_allow = false;

// Animation variables:
animation_skip = true;

// Shield behavior:
switch (status_shield)
{
    // Bubble:
    case SHIELD_BUBBLE:
        // Set speed:
        x_speed = 0;
        y_speed = 8;

        // Bound:
        bound_state = 1;

        // Play sound:
        sound_play_single("snd_shield_bubble_bound");

        // Shield:
        if (instance_exists(shield_handle))
        {
            with (shield_handle)
            {
                event_user(0);
            }
        }
        break;

    // Fire:
    case SHIELD_FIRE:
        // Set speed:
        x_speed = 8 * image_xscale;
        y_speed = 0;

        // Camera lag:
        if (input_cpu == false)
        {
            ctrl_camera.camera_lag_alarm = 16;
        }

        // Play sound:
        sound_play_single("snd_shield_fire_dash");

        // Shield:
        if (instance_exists(shield_handle))
        {
            with (shield_handle)
            {
                event_user(0);
            }
        }
        break;

    // Lightning:
    case SHIELD_LIGHTNING:
        // Set speed:
        y_speed = -5.5;

        // Play sound:
        sound_play_single("snd_shield_lightning_jump");

        // Sparks:
        for (i = 0; i < 4; i += 1)
        {
            var spark_handle;

            spark_handle = instance_create(floor(x), floor(y), par_effect);
            spark_handle.e_speed = 2;

            with (spark_handle)
            {
                ctl_initialize(ctl_shield_lightning_spark);
            }

            switch (i)
            {
                case 0:
                    spark_handle.angle = ANGLE_LEFT_UP;
                    break;

                case 1:
                    spark_handle.angle = ANGLE_RIGHT_UP;
                    break;

                case 2:
                    spark_handle.angle = ANGLE_LEFT_DOWN;
                    break;

                case 3:
                    spark_handle.angle = ANGLE_RIGHT_DOWN;
                    break;
            }
        }
        break;
}

// Return:
if (status_shield == SHIELD_BUBBLE)
{
    // Set state:
    player_set_state(player_state_bound);

    // Jump aux:
    jump_aux = input_player[INP_AUX, CHECK_PRESSED];

    return true;
}
else
{
    // Set animation:
    player_set_animation("spin");

    return player_set_state(player_state_jump, false);
}
