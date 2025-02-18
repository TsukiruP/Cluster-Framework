/// stage_add_player(instance)
/// @desc Adds a player instance to the player list.
/// @param {object} instance
/// @returns {void}

var _instance; _instance = argument0;

with (ctrl_stage) ds_list_add(player_list, _instance);
