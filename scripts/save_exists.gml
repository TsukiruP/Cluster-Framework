/// save_exists(id)
// Returns whether the save data exists.

with (mgr_game)
{
    return file_exists(save_directory + "save" + string(argument0) + ".sav");
}
