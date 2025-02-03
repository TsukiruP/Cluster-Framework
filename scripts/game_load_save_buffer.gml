/// game_load_save_buffer(index)
/* Returns a ds map of the loaded save. */

with (ctrl_game)
{
    var save_buffer, save_temp;

    save_buffer = buffer_create();
    save_temp = ds_map_create();

    buffer_load(save_buffer, save_directory + "save" + string(argument0) + ".sav");
    if (save_encryption != "") buffer_rc4(save_buffer, save_encryption);
    ds_map_read(save_temp, buffer_read_hex(save_buffer, buffer_get_size(save_buffer)));
    buffer_destroy(save_buffer);
    return save_temp;
}
