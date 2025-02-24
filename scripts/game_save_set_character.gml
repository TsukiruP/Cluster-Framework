/// game_save_set_character(player, character)
/// @desc Sets the character of a player.
/// @param {int} player
/// @param {int} character
/// @returns {void}

var _player; _player = argument0;
var _character; _character = argument1;

with (ctrl_game) ds_list_replace(character_list, _player, _character);