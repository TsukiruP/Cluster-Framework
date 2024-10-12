/// player_effect_queue()
// Creates an effect that needs to be timed with an aciton/animation.

switch (effect_queue) {
    // Spin Dash:
    case EFF_SPIN_DASH:
        with (instance_create(x, y, eff_spin_dash)) {
            player_handle = other.id;
        }
        break;

    // Insta-shield:
    case EFF_INSTA:
        if (character_id == CHAR_SONIC) {
            with (instance_create(x, y, eff_player)) {
                ctl_initialize(ctl_shield_insta);

                depth         = other.depth;
                image_xscale  = other.image_xscale;
                image_angle   = gravity_angle(other);
                player_handle = other.id;
            }
        }
        break;

    // Elemental shield:
    case EFF_ELEMENT:
        switch (status_shield) {
            // Fire dash:
            case SHIELD_FIRE:
                // Camera lag:
                ctrl_camera.camera_lag_alarm = 16;

                // Set timeline:
                if (instance_exists(shield_handle)) {
                    with (shield_handle) {
                        event_user(0);
                    }
                }
                break;

            // Lightning jump:
            case SHIELD_LIGHTNING:
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

            // Bubble bound:
            case SHIELD_BUBBLE:
                // Set timeline:
                if (instance_exists(shield_handle)) {
                    with (shield_handle) {
                        event_user(0);
                    }
                }
                break;
        }
        break;

    // Splash:
    case EFF_SPLASH:
        effect_create(ctl_splash_3, x, obj_water_surface.y, depth, image_xscale);
        break;
}

// Reset queue:
effect_queue = -1;
