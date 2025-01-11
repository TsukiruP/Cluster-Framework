/// player_set_device(id);
/* Sets the player's input array. */

var i, j;

switch (argument0)
{
    // Player 1:
    case 0:
        for (i = INP_UP; i <= INP_ALT; i += 1)
        {
            for (j = CHECK_PRESSED; j <= CHECK_HELD; j += 1)
            {
                player_set_input(i, j, input_get_check(i, j));
            }
        }
        break;
}
