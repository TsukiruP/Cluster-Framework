/// player_reset_input();
// Sets all the inputs to false.

for (i = INP_LEFT; i <= INP_ALT; i += 1) {
    for (j = CHECK_HELD; j <= CHECK_RELEASED; j += 1) {
        input_player[i, j] = false;
    }
}
