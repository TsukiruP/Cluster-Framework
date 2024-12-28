/// game_config_write()
// Writes the config map to file.

with (mgr_game)
{
    var config_buffer;

    // Initialize:
    config_buffer = buffer_create();

    // Buffer:
    buffer_write_hex(config_buffer, ds_map_write(config_map));
}
