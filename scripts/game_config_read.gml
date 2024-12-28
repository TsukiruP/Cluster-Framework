/// game_config_read()
// Reads the config file and applies it.

with (mgr_game)
{
    if (game_config_exists())
    {
        var config_temp;

        // Initialize:
        config_temp = game_config_buffer_load();

        ds_map_copy(config_map, config_temp);
        ds_map_destroy(config_temp);
    }
}
