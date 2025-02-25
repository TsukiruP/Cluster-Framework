/// stage_add_player(obj)
/// @desc Adds a player instance to the player list.
/// @param {object} obj
/// @returns {void}

var _obj; _obj = argument0;

with (ctrl_stage) ds_list_add(player_list, _obj);
