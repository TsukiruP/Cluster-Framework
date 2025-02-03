/// stage_get_player(index)
/* Returns a stage player. */

with (ctrl_stage)
{
    var player_id;

    player_id = ds_list_find_value(player_list, argument0);
    if (player_id != 0) return player_id;
    return noone;
}
