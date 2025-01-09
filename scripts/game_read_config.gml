/// game_read_config()
/* Reads the config file and applies it. */

with (mgr_game)
{
    if (game_config_exists())
    {
        var config_temp;

        // Initialize:
        config_temp = game_load_config_buffer();

        ds_map_copy(config_map, config_temp);
        ds_map_destroy(config_temp);
    }
}
