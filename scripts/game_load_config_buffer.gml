/// game_load_config_buffer()
/* Returns a ds map of the loaded config. */

with (ctrl_game)
{
    var config_temp, config_temp;

    config_buffer = buffer_create();
    config_temp = ds_map_create();

    buffer_load(config_buffer, config_directory + "config.cfg");
    ds_map_read(config_temp, buffer_read_hex(config_buffer, buffer_get_size(config_buffer)));
    buffer_destroy(config_buffer);
    return config_temp;
}
