/// stage_get_player(index)
/* Returns a stage player. */

with (ctrl_stage)
{
    var player_handle;

    player_handle = ds_list_find_value(player_list, argument0);
    if (player_handle != 0) return player_handle;
    return noone;
}
