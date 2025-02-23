/// stage_find_player()
/// @desc Returns the index storing the calling player.
/// @returns {int}

with (ctrl_stage) return ds_list_find_index(player_list, other.id);