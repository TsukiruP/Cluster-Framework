/// player_routine_land()
/* Shorthand so that the player can use their landing animation. */

if (on_ground == true)
{
    if (x_speed == 0)
    {
        player_set_animation("land");
        return player_set_state(player_state_idle);
    }

    return player_set_state(player_state_run);
}

return false;
