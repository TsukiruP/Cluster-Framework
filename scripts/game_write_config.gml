/// game_write_config()
/* Writes the config map to file. */

with (mgr_game)
{
    var config_buffer;

    config_buffer = buffer_create();
    buffer_write_hex(config_buffer, ds_map_write(config_map));

    buffer_save(config_buffer, config_directory + "config.cfg");
    buffer_destroy(config_buffer);
}
