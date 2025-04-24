/// player_invin_spark_create()
/// @desc Creates invincibility sparkles every few frames.
/// @returns {void}

if (config_get("advance_flicker") && status_invin == INVIN_BUFF)
{
    if (time_sync(status_invin_alarm, 2, 4) == 0) effect_create(x + random_range(-x_radius, x_radius), y + random_range(-y_radius, y_radius), seq_shield_invin_spark);
}
