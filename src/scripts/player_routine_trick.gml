/// player_routine_trick()
/// @desc Performs a trick action.
/// @returns {bool}

if (game_save_get("trick") && character_index != CHAR_CLASSIC && player_get_input(INP_TAG, CHECK_PRESSED))
{
    x_speed = 0;
    y_speed = 0;
    stage_add_score(100);

    if (player_get_input(INP_UP, CHECK_HELD)) trick_index = TRICK_UP;
    else if (player_get_input(INP_DOWN, CHECK_HELD)) trick_index = TRICK_DOWN;
    else if (sign(image_xscale) == input_x_direction && input_x_direction != 0) trick_index = TRICK_FRONT;
    else trick_index = TRICK_BACK;

    if (trick_index == TRICK_DOWN && (character_index == CHAR_SONIC || character_index == CHAR_AMY)) return player_set_state(player_state_trick_bound);

    return player_set_state(player_state_trick);
}

return false;
