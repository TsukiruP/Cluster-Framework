/// game_save_write_character()
/* Writes the character list to the save map. */

with (ctrl_game) game_set_save("character_id", ds_list_write(character_list));
