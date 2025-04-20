/// player_routine_jump()
/// @desc Performs a jump.
/// @returns {bool}

if (player_get_input(INP_JUMP, CHECK_PRESSED))
{
    audio_play_sfx("snd_jump", true);
    return player_set_state(player_state_jump);
}

return false;
