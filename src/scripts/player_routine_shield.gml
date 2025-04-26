/// player_routine_shield()
/// @desc Performs shield actions.
/// @returns {bool}

status_shield_allow = false;

switch (status_shield)
{
    case SHIELD_FIRE:
        x_speed = 8 * image_xscale;
        y_speed = 0;
        audio_play_sfx("snd_shield_fire_dash", true);
        if (!input_cpu) camera_set_lag(16);
        with (shield_inst) event_user(0);
        break;

    case SHIELD_LIGHTNING:
        y_speed = -5.5;
        audio_play_sfx("snd_shield_lightning_jump", true);

        // Sparks:
        for ({var i; i = ANGLE_RIGHT_UP}; i <= ANGLE_RIGHT_DOWN; i += ANGLE_UP)
        {
            var spark_inst; spark_inst = effect_create(x, y, seq_shield_lightning_spark);

            with (spark_inst)
            {
                x_speed = dcos(i) * 2;
                y_speed = -dsin(i) * 2;
            }
        }
        break;
}

if (status_shield == SHIELD_BUBBLE)
{
    player_set_state(player_state_bound);
    jump_aux = player_get_input(INP_AUX, CHECK_PRESSED);
    return true;
}

player_set_animation("spin_flight");
return player_set_state(player_state_jump, false);
