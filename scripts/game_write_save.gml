/// game_write_save(id)
/* Writes the save map to file. */

with (ctrl_game)
{
    var save_buffer;

    save_buffer = buffer_create();

    game_save_write_character();
    game_save_write_skill(CHAR_SONIC);
    if (!directory_exists(save_directory)) directory_create(save_directory);

    buffer_write_hex(save_buffer, ds_map_write(save_map));
    if (save_encryption != "") buffer_rc4(save_buffer, save_encryption);
    buffer_save(save_buffer, save_directory + "save" + string(argument0) + ".sav");
    buffer_destroy(save_buffer);
}
