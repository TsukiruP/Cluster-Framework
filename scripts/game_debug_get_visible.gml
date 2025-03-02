/// game_debug_get_visible()
/// @desc Returns whether debug mode is on and the debug controller is visible.
/// @returns {bool}

with (ctrl_debug)
{
    return (visible && game_get_debug());
}
