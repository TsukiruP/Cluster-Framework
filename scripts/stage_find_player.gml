/// stage_find_player()
/* Returns the position of the object in the player list */

with (ctrl_stage) return ds_list_find_index(player_list, other.id);
