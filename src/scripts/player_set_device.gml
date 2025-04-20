/// player_set_device();
/// @desc Sets the player's input source.
/// @returns {void}

var player_device; player_device = pick(player_index > 0, DEV_USER, DEV_GAMEPAD0 + player_index);

for ({var i; i = INP_UP}; i <= INP_ALT; i += 1)
{
    for ({var j; j = CHECK_HELD}; j <= CHECK_RELEASED; j += 1)
    {
        player_set_input(i, j, input_get_check(i, j, player_device));
    }
}
