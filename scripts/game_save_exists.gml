/// game_save_exists(id)
// Returns whether the save file exists.

with (mgr_game)
{
    var save_id;

    // Initialize:
    save_id = argument0;

    // Return:
    return file_exists(save_directory + "save" + string(save_id) + ".sav");
}
