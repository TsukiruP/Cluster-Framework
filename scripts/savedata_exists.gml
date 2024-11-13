/// savedata_exists(id)
// Returns whether the savedata file exists.

with (mgr_game)
{
    return file_exists(savedata_directory + "save" + string(argument0) + ".sav");
}
