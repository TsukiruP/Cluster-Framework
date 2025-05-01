/// player_set_physics()
/// @desc Sets the player's physics.
/// @returns {void}

top_speed = 6;
acceleration = 0.046875;
deceleration = 0.5

gravity_force = gravity_force_temp;
if (state_current == player_state_hurt) gravity_force = 0.1875;

jump_force = 6.5 + ((character_index == CHAR_KNUX) * 0.5);
jump_release = -4;

roll_deceleration = 0.125;
roll_friction = 0.0234375;
roll_deceleration_up = 0.078125;
roll_deceleration_down = 0.3125;

if (underwater)
{
    top_speed *= 0.5;
    acceleration *= 0.5;
    deceleration *= 0.5;

    roll_friction *= 0.5;

    gravity_force = 0.0625;
    if (state_current == player_state_hurt) gravity_force = 0.09375;

    jump_force -= 3;
    jump_release *= 0.5;
}
else
{
    if (status_speed == SPEED_UP)
    {
        top_speed *= 2;
        acceleration *= 2;

        roll_friction *= 2;
    }
    else if (status_speed == SPEED_SLOW) top_speed *= 0.75;
}
