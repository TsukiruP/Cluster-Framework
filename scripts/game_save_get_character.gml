/// game_save_get_character(player)
/// @desc Returns the character of the player.
/// @param {int} player
/// @returns {int}

var _player; _player = argument0;

with (ctrl_game) return ds_list_find_value(character_list, _player);