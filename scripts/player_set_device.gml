/// player_set_device(id);
/* Sets the player's input array. */

var i, j, player_device;

player_device = pick(player_id > 0, DEV_USER, DEV_GAMEPAD0 + player_id);

for (i = INP_UP; i <= INP_ALT; i += 1)
{
    for (j = CHECK_PRESSED; j <= CHECK_HELD; j += 1)
    {
        player_set_input(i, j, input_get_check(i, j, player_device));
    }
}
