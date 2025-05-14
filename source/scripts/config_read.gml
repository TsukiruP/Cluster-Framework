/// config_read()
/// @desc Reads the config map from a file.
/// @returns {void}

with (ctrl_config)
{
    if (config_exists())
    {
        var config_temp; config_temp = config_load_buffer();
        var config_key; config_key = ds_map_find_first(config_map);

        for ({var i; i = 0}; i < ds_map_size(config_map); i += 1)
        {
            if (ds_map_exists(config_temp, config_key)) ds_map_replace(config_map, config_key, ds_map_find_value(config_temp, config_key));
            config_key = ds_map_find_next(config_map, config_key);
        }

        ds_map_destroy(config_temp);
        config_read_key();
        config_read_gamepad();
    }
}
