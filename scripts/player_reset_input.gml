/// player_reset_input()
/* Resets player input. */

for (i = INP_UP; i <= INP_ALT; i += 1)
{
    for (j = CHECK_PRESSED; j <= CHECK_HELD; j += 1)
    {
        player_set_input(i, j, false);
    }
}
