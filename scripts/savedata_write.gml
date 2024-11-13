/// savedata_write(id)
// Writes the savedata to file.

with (mgr_game)
{
    var savedata_buffer;

    // Create buffer:
    savedata_buffer = buffer_create();
    buffer_write_hex(savedata_buffer, ds_map_write(savedata_map));

    // Save buffer:
    buffer_save(savedata_buffer, savedata_directory + "save" + string(argument0) + ".sav");
    buffer_destroy(savedata_buffer);
}
