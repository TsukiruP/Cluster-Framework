/// save_write(id)
// Writes the save to file.

with (mgr_game)
{
    var save_buffer;

    // Create buffer:
    save_buffer = buffer_create();
    buffer_write_hex(save_buffer, ds_map_write(save_map));

    // Save buffer:
    buffer_save(save_buffer, save_directory + "save" + string(argument0) + ".sav");
    buffer_destroy(save_buffer);
}
