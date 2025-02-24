/// stage_delete_player(player)
/// @desc Deletes a player from the player list.
/// @param {int} index
/// @returns {void}

var _index; _index = argument0;

with (ctrl_stage) ds_list_delete(player_list, _index);