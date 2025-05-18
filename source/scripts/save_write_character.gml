/// save_write_character()
/// @desc Writes the character list to the save map.
/// @returns {void}

with (ctrl_save) save_set("character_index", ds_list_write(character_list));
