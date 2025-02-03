/// game_save_get_character(id)
/* Returns a character id. */

with (ctrl_game) return ds_list_find_value(character_list, argument0);
