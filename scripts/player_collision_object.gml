/// player_collision_object()
/* Checks if any interactable objects are colliding with the player's bounding box, triggering their reactions if so.
Returns whether the player's current state should be aborted or not. */

var n, inst;

for (n = ds_list_size(interaction_list); n > -1; n -= 1)
{
    inst = ds_list_find_value(interaction_list, n);
    if (player_react(inst)) return true;
}

return false;
