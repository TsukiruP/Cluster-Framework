/// config_read()
/// @desc Reads the config map from a file.
/// @returns {void}

with (ctrl_config)
{
    if (config_exists())
    {
        var config_temp; config_temp = config_load_buffer();
        var config_key; config_key = ds_map_find_first(config_map);

        ds_map_match(config_map, config_temp);
        ds_map_destroy(config_temp);
        config_read_key();
        config_read_gamepad();
    }
}
