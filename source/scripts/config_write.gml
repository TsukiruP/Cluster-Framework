/// config_write()
/// @desc Saves the config map to a file.
/// @returns {void}

with (ctrl_config)
{
    var config_buffer; config_buffer = buffer_create();

    config_write_key();
    config_write_gamepad();
    if (!directory_exists(config_directory)) directory_create(config_directory);
    buffer_write_hex(config_buffer, ds_map_write(config_map));
    buffer_save(config_buffer, config_directory + "config.cfg");
    buffer_destroy(config_buffer);
}
