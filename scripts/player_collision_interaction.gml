/// player_collision_interaction()
/* Returns whether the player's current state should be aborted or not after performing a reaction. */

var n, inst;

for (n = ds_list_size(interaction_list); n > -1; n -= 1)
{
    inst = ds_list_find_value(interaction_list, n);
    if (player_react(inst)) return true;
}

return false;
