/// player_get_physics()
// Sets the player's physics values according to the current physics state.

// Horizontal variables:
top_speed = 6;
acceleration = 0.046875;
deceleration = 0.5

// Vertical variables:
if (state_current == player_state_hurt)
{
    gravity_force = 0.1875;
}
else
{
    gravity_force = gravity_force_temp;
}

jump_force = 6.5 + ((character_id == CHAR_KNUCKLES) * 0.5);
jump_release = -4;

// Roll variables:
roll_deceleration = 0.125;
roll_friction = 0.0234375;
roll_deceleration_up = 0.078125;
roll_deceleration_down = 0.3125;

// Underwater multiplier:
if (physics_id == PHYS_WATER)
{
    // Horizontal variables:
    top_speed *= 0.5;
    acceleration *= 0.5;
    deceleration *= 0.5;
    roll_friction *= 0.5;

    // Vertical variables:
    if (state_current == player_state_hurt)
    {
        gravity_force = 0.09375;
    }
    else
    {
        gravity_force = 0.0625;
    }

    jump_force -= 3;
    jump_release *= 0.5;
}
else
{
    // Speed up multiplier:
    if (status_speed == SPEED_UP)
    {
        top_speed *= 2;
        acceleration *= 2;
        roll_friction *= 2;
    }

    // Speed down multiplier:
    else if (status_speed == SPEED_SLOW)
    {
        top_speed *= 0.75;
    }
}
