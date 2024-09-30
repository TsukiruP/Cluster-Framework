/// player_animation_default()
//

switch (state_current)
{
    // Idle:
    case player_state_idle:
        if (animation_current != "stand" && animation_current != "wait" && animation_current != "ready" && animation_current != "land" &&
            animation_current != "look_end" && animation_current != "crouch_end" &&
            animation_current != "look" && animation_current != "omochao" && animation_current != "omochao_end")
        {
            player_set_animation("stand");
        }
        break;

    // Turn:
    case player_state_turn:
        if (animation_current != "turn" && animation_current != "turn_brake")
        {
            player_set_animation("turn");
        }
        break;

    // Run:
    case player_state_run:
        if (animation_current != "push")
        {
            // Walk:
            if (abs(x_speed) < 1.50)
            {
                if (animation_current != "run_0") player_set_animation("run_0");
            }

            // Walk fast:
            else if (abs(x_speed) < 3.00)
            {
                if (animation_current != "run_1") player_set_animation("run_1");
            }

            // Jog:
            else if (abs(x_speed) < 4.50)
            {
                if (animation_current != "run_2") player_set_animation("run_2");
            }

            // Jog fast:
            else if (abs(x_speed) < 6.00)
            {
                if (animation_current != "run_3") player_set_animation("run_3");
            }

            // Run:
            else
            {
                if (animation_current != "run_4") player_set_animation("run_4");
            }
        }
        break;

    // Air:
    case player_state_air:
        if ((animation_current != "turn" && animation_current != "turn_brake" && animation_current != "spin" && animation_current != "brake" && animation_current != "spring_flight" && animation_current != "spring_fall") ||
            (animation_current == "spring_flight" && y_speed >= 0) || spring_alarm > 0)
        {
            // Flight:
            if (y_speed < 0 || (spring_angle != ANGLE_DOWN && spring_alarm > 0))
            {
                player_set_animation("spring_flight");
            }

            // Fall:
            else
            {
                player_set_animation("spring_fall");
            }
        }
        break;

    // Jump:
    case player_state_jump:
        switch (jump_uncurl)
        {
            // Blockade uncurl:
            case 2:
                if (y_speed >= 0 && animation_current != "spring_fall")
                {
                    player_set_animation("spring_fall");
                    animation_skip = true;
                }
                break;

            // No uncurl:
            default:
                if (animation_current != "spin" && animation_current != "insta")
                {
                    player_set_animation("spin");
                }
        }
        break;

    // Look:
    case player_state_look:
        if (animation_current != "look")
        {
            player_set_animation("look");
        }
        break;

    // Crouch:
    case player_state_crouch:
        if (animation_current != "crouch")
        {
            player_set_animation("crouch");
        }
        break;

    // Spin Dash:
    case player_state_spin_dash:
        if (animation_current != "spin_dash" && animation_current != "spin_charge")
        {
            player_set_animation("spin_dash");
        }
        break;

    // Roll:
    case player_state_roll:
        if (animation_current != "spin")
        {
            player_set_animation("spin");
        }
        break;

    // Brake:
    case player_state_brake:
        if (x_speed >= 6.00)
        {
            if (animation_current != "brake_fast")
            {
                player_set_animation("brake_fast");
            }
        }
        else
        {
            if (animation_current != "brake")
            {
                player_set_animation("brake");
            }
        }
        break;

    // Hurt:
    case player_state_hurt:
        if (animation_current != "hurt")
        {
            player_set_animation("hurt");
        }
        break;

    // Death:
    case player_state_death:
        if (animation_current != "death")
        {
            player_set_animation("death");
        }
        break;

    // Bound:
    case player_state_bound:
        if (animation_current != "spin")
        {
            player_set_animation("spin");
        }
        break;

    // Hammer:
    case player_state_hammer:
        if (animation_current != "hammer")
        {
            player_set_animation("hammer");
        }
        break;

    // Skid:
    case sonic_state_skid:
        if (animation_current != "somersault" && animation_current != "skid" && animation_current != "skid_end")
        {
            player_set_animation("somersault");
        }
        break;
}
