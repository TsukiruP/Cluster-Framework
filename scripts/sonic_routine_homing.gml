/// sonic_routine_homing()
// The bounce up that occurs from doing a homing attack.

if (state_current == sonic_state_homing)
{
    //
    var homing_input;

    homing_input = INP_JUMP;

    if (global.skill_sonic[SONIC_HOMING_STYLE] >= HOMING_UNLEASHED)
    {
        homing_input = INP_AUX;
    }

    // Set speed:
    if ((global.skill_sonic[SONIC_HOMING_MOVE] == HOMING_DEFAULT && input_player[homing_input, CHECK_HELD] == false) ||
        (global.skill_sonic[SONIC_HOMING_MOVE] == HOMING_INVERSE && input_player[homing_input, CHECK_HELD] == true) ||
        global.skill_sonic[SONIC_HOMING_MOVE] == HOMING_STOP)
    {
        x_speed = 0;
    }

    y_speed = -jump_force;

    // Set state:
    player_set_state(player_state_jump, false);

    // Set animation:
    animation_skip = true;
    player_set_animation("spin");
}
