/// player_reaction_spike(obj, collision, side)
// Press the jump button to jump!

var reaction_handle, collision;

reaction_handle = argument0;
collision = argument1;
side = argument2;

// Activate hint:
if (collision & COLL_INTERACT)
{
    if (side == reaction_handle.angle)
    {
        player_set_damage(reaction_handle);
    }
}
