/// stage_get_player(player)
/// @desc Returns an instance corresponding to the player index.
/// @param {int} index
/// @returns {object}

with (ctrl_stage)
{
    var player_inst; player_inst = ds_list_find_value(player_list, argument0);

    if (player_inst != 0) return player_inst;
    else return noone;
}