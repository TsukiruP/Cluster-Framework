/// player_animation_fix()
/* Sets the current animation to avoid loading an animation that doesn't exist. */

switch (character_id)
{
    // Classic:
    case CHAR_CLASSIC:
        // Stand:
        if (animation_current == "land" || animation_current == "look_end" || animation_current == "crouch_end")
        {
            player_set_animation("stand");
        }

        // Spin Dash:
        if (animation_current == "spin_charge")
        {
            player_set_animation("spin_dash", 0);
        }

        // Brake:
        if (animation_current == "brake_fast")
        {
            player_set_animation("brake");
        }
        break;
}
