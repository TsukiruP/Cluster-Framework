/// player_routine_land()
//

if (on_ground == true)
{
    if (x_speed == 0)
    {
        // Set animation:
        player_set_animation("land");

        player_set_state(player_state_idle);
    }
    else
    {
        player_set_state(player_state_run);
    }
    return true;
}

// No landing:
return false;
