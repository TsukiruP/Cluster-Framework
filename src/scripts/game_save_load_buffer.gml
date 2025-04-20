/// game_save_load_buffer(save)
/// @desc Returns a save map from a file.
/// @param {int} save
/// @returns {ds_map}

var _save; _save = argument0;

with (ctrl_game)
{
    var save_buffer; save_buffer = buffer_create();
    var save_temp; save_temp = ds_map_create();

    buffer_load(save_buffer, save_directory + "save" + string(_save) + ".sav");
    if (save_encryption != "") buffer_rc4(save_buffer, save_encryption);
    ds_map_read(save_temp, buffer_read_hex(save_buffer, buffer_get_size(save_buffer)));
    buffer_destroy(save_buffer);
    return save_temp;
}
