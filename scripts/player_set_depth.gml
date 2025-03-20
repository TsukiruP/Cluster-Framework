/// player_set_depth(depth)
/// @desc Sets the player's depth.
/// @param {int} depth
/// @returns {void}

var _depth; _depth = argument0;

if (state_current != player_state_death)
{
    if (depth != _depth) depth = _depth;
}
