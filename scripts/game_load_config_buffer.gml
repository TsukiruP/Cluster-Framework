/// game_load_config_buffer()
/// @desc Returns a config map from a file.
/// @returns {ds_map}

with (ctrl_game)
{
    var config_buffer; config_buffer = buffer_create();
    var config_temp; config_temp = ds_map_create();

    buffer_load(config_buffer, config_directory + "config.cfg");
    ds_map_read_safe(config_temp, buffer_read_hex(config_buffer, buffer_get_size(config_buffer)));
    buffer_destroy(config_buffer);
    return config_temp;
}
