/// player_state_hammer()
// Gigant hammer.

switch (argument0)
{
    // Start:
    case STATE_START:
        // Set speed:
        x_speed = 0;
        break;

    // Step:
    case STATE_STEP:
        // Movement:
        if (!player_movement_ground())
        {
            exit;
        }

        // Fall:
        if (on_ground == false)
        {
            return player_set_state(player_state_air);
        }

        // Idle:
        if (animation_finished == true)
        {
            return player_set_state(player_state_idle);
        }

        // Jump:
        if (player_collision_ceiling(y_radius + 5) == noone && input_player[INP_JUMP, CHECK_PRESSED] == true)
        {
            // Play sound:
            sound_play_single("snd_jump");

            return player_set_state(player_state_jump);
        }
        break;

    // Finish:
    case STATE_FINISH:
        break;
}
