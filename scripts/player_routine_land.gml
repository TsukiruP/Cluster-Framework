/// player_routine_land()
/// @desc Performs an idle or run when landing.
/// @returns {bool}

if (on_ground)
{
    if (x_speed == 0)
    {
        player_set_animation("land");
        return player_set_state(player_state_idle);
    }

    return player_set_state(player_state_run);
}

return false;