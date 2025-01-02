/// player_routine_shield()
// Or barriers, for the nerds.

// Disable shield:
status_shield_allow = false;

// Shield behavior:
switch (status_shield)
{
    // Fire:
    case SHIELD_FIRE:
        // Set speed:
        x_speed = 8 * image_xscale;
        y_speed = 0;

        // Camera lag:
        if (input_cpu == false)
        {
            camera_set_lag(16);
        }

        // Play sound:
        audio_sfx_play("snd_shield_fire_dash", true);

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
        var i;

        // Set speed:
        y_speed = -5.5;

        // Play sound:
        audio_sfx_play("snd_shield_lightning_jump", true);

        // Sparks:
        for (i = 0; i < 4; i += 1)
        {
            var spark_handle;

            spark_handle = effect_create(ctl_shield_lightning_spark, x, y);
            spark_handle.x_speed = 2;
            spark_handle.y_speed = 2;
            spark_handle.angle = pick(i, ANGLE_LEFT_UP, ANGLE_RIGHT_UP, ANGLE_LEFT_DOWN, ANGLE_RIGHT_DOWN);
        }
        break;
}

// Return:
if (status_shield == SHIELD_BUBBLE)
{
    // Set state:
    player_set_state(player_state_bound);

    // Jump aux:
    jump_aux = player_get_input(INP_AUX, CHECK_PRESSED);
    return true;
}

// Set animation:
player_set_animation("spin");
return player_set_state(player_state_jump, false);
