/// player_reset_input()
/// @desc Resets the player's input.
/// @returns {void}

for ({var i; i = INP_UP}; i <= INP_ALT; i += 1)
{
    for ({var j; j = CHECK_HELD}; j <= CHECK_RELEASED; j += 1)
    {
        player_set_input(i, j, false);
    }
}
