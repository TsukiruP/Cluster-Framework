/// player_animation_fix()
/// @desc Workaround for missing animations.
/// @returns {void}

switch (character_index)
{
    case CHAR_CLASSIC:
        if (animation_current == "land" || animation_current == "omochao" || animation_current == "omochao_end" || animation_current == "look_end" ||
            animation_current == "crouch_end") player_set_animation("stand");
        if (animation_current == "spin_charge" || (state_current == sonic_state_drop_dash && drop_dash_alarm == 0 && animation_current == "roll")) player_set_animation("spin_dash", 0);
        if (animation_current == "brake_fast") player_set_animation("brake");
        if (drown && animation_current == "death") player_set_animation("drown");
        break;

    default:
        if (tag_leader)
        {
            if (animation_current == "standby" || animation_current == "land") player_set_animation("stand");
            if (animation_current == "turn_brake") player_set_animation("turn");
            if (animation_current == "brake_fast") player_set_animation("brake");
            if (animation_current == "breath" || animation_current == "air_dash") player_set_animation("spring_fall");
        }
}
