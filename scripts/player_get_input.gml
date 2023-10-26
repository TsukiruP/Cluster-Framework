/// player_get_input(id)
// Returns the inputs based on the given id.

var player_id;

if(argument_count >= 1) player_id = argument[0];
else player_id = -1;

switch(player_id) {
    // Player 1:
    case 0:
        for(i = INP_LEFT; i <= INP_SUPER; i += 1) {
            for(j = CHECK_HELD; j <= CHECK_RELEASED; j += 1) {
                player_input[i, j] = user_get_input(i, j);
            }
        }
        break;

    // Player 2:
    case 1:
        for(i = INP_LEFT; i <= INP_SUPER; i += 1) {
            for(j = CHECK_HELD; j <= CHECK_RELEASED; j += 1) {
                player_input[i, j] = user_get_input(i, j, DEV_JOYSTICK1);
            }
        }
        break;

    // Blank:
    default:
        for(i = INP_LEFT; i <= INP_SUPER; i += 1) {
            for(j = CHECK_HELD; j <= CHECK_RELEASED; j += 1) {
                player_input[i, j] = false;
            }
        }
}
