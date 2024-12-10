/// game_save_exists(id)
// Returns whether a save file exists.

with (mgr_game)
{
    var save_exists;

    // Initialize:
    save_exists = false;

    if (file_exists(save_directory + "save" + string(argument0) + ".sav"))
    {
        var save_temp;

        // Initalize:
        save_temp = game_save_buffer_load(argument0);

        // Check game and version:
        if (ds_map_get(save_temp, "game") == GAME_NAME && ds_map_get(save_temp, "version") == GAME_VERSION)
        {
            save_exists = true;
        }

        ds_map_destroy(save_temp);
    }

    return save_exists;
}
