/// stage_add_player(inst)
/// @desc Adds a player instance to the player list.
/// @param {object} inst
/// @returns {void}

var _inst; _inst = argument0;

with (ctrl_stage) ds_list_add(player_list, _inst);