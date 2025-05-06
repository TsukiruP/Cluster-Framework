/// player_reset_tag([leader])
/// @desc Resets the player's tag action.
/// @param {bool} [leader]
/// @returns {void}

var _leader; if (argument_count > 0) _leader = argument[0]; else _leader = false;

if (_leader)
{
    tag_leader_state = STATE_START;
    tag_leader_time = 0;
}
else
{
    tag_state = 0;
    tag_arc_time = 0;
    tag_arc_x_offset = 0;
    tag_arc_y_offset = 0;
}
