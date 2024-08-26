/// player_routine_shield()
// Or barriers, for the nerds.

// Set status:
status_shield_allow = false;

// Shield behavior:
switch (status_shield) {
    // Fire:
    case SHIELD_FIRE:
        // Set speed:
        x_speed = 8 * image_xscale;
        y_speed = 0;

        // Set timeline:
        if (instance_exists(shield_handle)) {
            with (shield_handle) {
                event_user(0);
            }
        }

        // Camera lag:
        ctrl_camera.camera_lag_alarm = 16;
        break;

    // Lightning:
    case SHIELD_LIGHTNING:
        // Set speed:
        y_speed = -5.5;

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
        break;

    // Bubble:
    case SHIELD_BUBBLE:
        // Set speed:
        x_speed = 0;
        y_speed = 8;

        // Bound:
        bound_state = 1;

        // Set timeline:
        if (instance_exists(shield_handle)) {
            with (shield_handle) {
                event_user(0);
            }
        }
        break;
}
