/// player_routine_shield()
/* Barriers, if you care about that sort of thing. */

status_shield_allow = false;

switch (status_shield)
{
    case SHIELD_FIRE:
        x_speed = 8 * image_xscale;
        y_speed = 0;
        audio_play_sfx("snd_shield_fire_dash", true);
        if (!input_cpu) camera_set_lag(16);
        with (shield_id) event_user(0);
        break;

    case SHIELD_LIGHTNING:
        var i;

        y_speed = -5.5;
        audio_play_sfx("snd_shield_lightning_jump", true);

        // Sparks:
        for (i = 0; i < 4; i += 1)
        {
            var spark_id;

            spark_id = effect_create(x, y, sequence_shield_lightning_spark);
            spark_id.x_speed = 2;
            spark_id.y_speed = 2;
            spark_id.angle = pick(i, ANGLE_LEFT_UP, ANGLE_RIGHT_UP, ANGLE_LEFT_DOWN, ANGLE_RIGHT_DOWN);
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
