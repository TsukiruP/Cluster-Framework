/// game_save_exists(index)
/* Returns whether a save file exists. */

with (ctrl_game)
{
    var save_exists;

    save_exists = false;

    if (file_exists(save_directory + "save" + string(argument0) + ".sav"))
    {
        var save_temp;

        save_temp = game_load_save_buffer(argument0);
        if (ds_map_get(save_temp, "game") == GAME_NAME && ds_map_get(save_temp, "version") == GAME_VERSION) save_exists = true;
        ds_map_destroy(save_temp);
    }

    return save_exists;
}
