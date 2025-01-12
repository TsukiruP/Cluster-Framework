/// stage_delete_player(id)
/* Deletes a stage player. */

with (ctrl_stage)
{
    ds_list_delete(player_list, argument0);
}
