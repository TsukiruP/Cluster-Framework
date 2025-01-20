/// player_animation_fix()
/* Sets the current animation to avoid loading an animation that doesn't exist. */

switch (character_id)
{
    // Classic:
    case CHAR_CLASSIC:
        // Stand:
        if (animation_current == "land" || animation_current == "omochao" || animation_current == "omochao_end" || animation_current == "look_end" || animation_current == "crouch_end")
        {
            player_set_animation("stand");
        }

        // Spin Dash:
        if (animation_current == "spin_charge" || (state_current == sonic_state_drop_dash && drop_dash_alarm == 0 && animation_current == "spin"))
        {
            player_set_animation("spin_dash", 0);
        }
        
        // Spin:
        if (state_current == player_state_jump && animation_current == "spin_dash") player_set_animation("spin");
        
        // Brake:
        if (animation_current == "brake_fast") player_set_animation("brake");
        break;
}
