/// save_write(save)
/// @desc Writes a save map to a file.
/// @param {int} save
/// @returns {void}

var _save; _save = argument0;

with (ctrl_save)
{
    var save_buffer; save_buffer = buffer_create();

    save_write_character();
    save_write_skill(CHAR_SONIC);
    if (!directory_exists(save_directory)) directory_create(save_directory);
    buffer_write_hex(save_buffer, ds_map_write(save_map));
    if (save_encryption != "") buffer_rc4(save_buffer, save_encryption);
    buffer_save(save_buffer, save_directory + "save" + string(_save) + ".sav");
    buffer_destroy(save_buffer);
}
