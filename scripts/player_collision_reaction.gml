/// player_collision_reaction()
/// @desc Returns whether the player's current state should be aborted or not after performing a reaction.
/// @returns {bool}

var inst;

for ({var n; n = ds_list_size(reaction_list) - 1}; n > -1; n -= 1)
{
    inst = ds_list_find_value(reaction_list, n);
    if (player_react(inst)) return true;
}

return false;