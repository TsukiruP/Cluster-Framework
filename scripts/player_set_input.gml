/// player_set_input(id);
// Sets the player's input array.

var i, j;

switch (argument0)
{
    // Player 1:
    case 0:
        for (i = INP_UP; i <= INP_ALT; i += 1)
        {
            for (j = CHECK_PRESSED; j <= CHECK_HELD; j += 1)
            {
                input_player[i, j] = input_get_check(i, j);
            }
        }
        break;

    // Player 2:
    case 1:
        for (i = INP_UP; i <= INP_ALT; i += 1)
        {
            for (j = CHECK_PRESSED; j <= CHECK_HELD; j += 1)
            {
                input_player[i, j] = input_get_check(i, j, DEV_GAMEPAD0 + player_id);
            }
        }
        break;

    // Reset:
    default:
        for (i = INP_UP; i <= INP_ALT; i += 1)
        {
            for (j = CHECK_PRESSED; j <= CHECK_HELD; j += 1)
            {
                input_player[i, j] = false;
            }
        }
}
