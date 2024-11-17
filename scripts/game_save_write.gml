/// game_save_write(id)
// Writes the save map to file.

with (mgr_game)
{
    var save_buffer;

    // Initialize:
    save_buffer = buffer_create();

    // Buffer:
    buffer_write_hex(save_buffer, ds_map_write(save_map));
    buffer_save(save_buffer, save_directory + "save" + string(argument0) + ".sav");
    buffer_destroy(save_buffer);
}
