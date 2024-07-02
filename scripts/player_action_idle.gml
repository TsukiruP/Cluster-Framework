/// player_action_idle(phase)
// Standing here, I realize...

switch (argument0) {
    // Start:
    case ACTION_START:
        break;

    // Step:
    case ACTION_STEP:
        // Collision steps:
        player_collision_steps();

        // Changed:
        if (action_changed == true) {
            return false;
        }

        // Air:
        if (ground == false || (ground_angle >= 90 && ground_angle <= 270)) {
            return player_set_action(player_action_air);
        }

        // Turn:
        if (global.gameplay_turn == true && character_data != CHAR_CLASSIC && image_xscale == -input_x_direction) {
            return player_set_action(player_action_turn);
        }

        // Lock:
        if (mode != 0) {
            input_lock_alarm = 30;
            return player_set_action(player_action_run);
        }

        // Run:
        if (g_speed != 0 || input_x_direction != 0) {
            return player_set_action(player_action_run);
        }

        // Slope friction:
        if (ground_angle < 135 || ground_angle > 225) {
            if (abs(g_speed) > 0.125 || input_lock_alarm != 0) g_speed -= dsin(ground_angle) * 0.125;
        }

        // Jump:
        if (ground == true && touching_ceiling == false && input_player[INP_JUMP, CHECK_PRESSED] == true) {
            sound_play_single("snd_jump");
            return player_set_action(player_action_jump);
        }

        // Look & crouch:
        switch (input_y_direction) {
            // Look:
            case -1:
                return player_set_action(player_action_look);
                break;

            // Crouch:
            case 1:
                return player_set_action(player_action_crouch);
                break;
        }
        // Note: There's a check here also for balancing.
        
        // Wait:
        /*
        if (animation_alarm > 0) {
            animation_alarm -= 1;

            if (animation_current != "wait" && animation_alarm == 0) {
                player_set_animation("wait");
            }
        }
        */
        break;

    // Finish:
    case ACTION_FINISH:
        break;
}
