/// game_read_config()
/* Reads the config file and applies it. */

with (ctrl_game)
{
    if (game_config_exists())
    {
        var config_temp, config_key;

        config_temp = game_load_config_buffer();
        config_key = ds_map_find_first(config_map);

        for (i = 0; i < ds_map_size(config_map); i += 1)
        {
            if (ds_map_exists(config_temp, config_key))
            {
                ds_map_replace(config_map, config_key, ds_map_find_value(config_temp, config_key));
            }

            config_key = ds_map_find_next(config_map, config_key);
        }

        ds_map_destroy(config_temp);
    }
}
