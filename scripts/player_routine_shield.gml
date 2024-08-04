/// player_routine_shield()
//

// Disable shield:
status_shield_allow = false;

// Set action:
player_set_action(player_action_jump);

switch (status_shield) {
    // Fire:
    case SHIELD_FIRE:
        // Set speed:
        x_speed = 8 * image_xscale;
        y_speed = 0;

        // Set timeline:
        if (status_invin != INVIN_BUFF && instance_exists(shield_handle)) {
            with (shield_handle) {
                image_xscale = other.image_xscale;
                timeline_set(ctl_shield_fire_dash);
            }
        }

        // Camera lag:
        ctrl_camera.camera_lag_alarm = 16;

        // Play sound:
        sound_play_single("snd_shield_fire_dash");
        break;

    // Lightning:
    case SHIELD_LIGHTNING:
        // Set speed:
        y_speed = -5.5;

        // Jump special:
        jump_special = true;

        // Sparks:
        for (i = 0; i < 4; i += 1) {
            var spark_handle;

            spark_handle         = instance_create(floor(x), floor(y), eff_basic);
            spark_handle.e_speed = 2;

            with (spark_handle) {
                ctl_initialize(ctl_shield_lightning_spark);
            }

            switch (i) {
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

        // Play sound:
        sound_play_single("snd_shield_lightning_jump");
        break;

    // Bubble;
        case SHIELD_BUBBLE:
            // Set speed:
            x_speed = 0;
            y_speed = 8;

            return player_set_action(player_action_bound);
            break;
}
