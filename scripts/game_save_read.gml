/// game_save_read(id)
// Reads a save file and applies it to the save map.

with (mgr_game)
{
    if (game_save_exists(argument0))
    {
        var save_buffer, save_temp;

        // Initialize:
        save_buffer = buffer_create();
        save_temp = ds_map_create();

        // Buffer:
        buffer_load(save_buffer, save_directory + "save" + string(argument0) + ".sav");

        if (save_encryption != "")
        {
            buffer_rc4(save_buffer, save_encryption);
        }

        ds_map_read(save_temp, buffer_read_hex(save_buffer, buffer_get_size(save_buffer)));
        buffer_destroy(save_buffer);
        ds_map_copy(save_map, save_temp);
        ds_map_destroy(save_temp);
    }
}
