/// sonic_state_skid(phase)
// Sliiiide to the left, sliiiide to the right. Criss cross!

switch (argument0) {
    // Start:
    case STATE_START:
        // Set speed:
        x_speed = 3 * image_xscale;
        break;

    // Step:
    case STATE_STEP:
        // Friction:
        x_speed -= min(abs(x_speed), roll_friction) * sign(x_speed);

        // Movement:
        if (!player_movement_ground()) {
            exit;
        }

        // Fall:
        if (on_ground == false) {
            return player_set_state(player_state_air);
        }

        // Slide off:
        if (abs(x_speed) < slide_threshold && relative_angle >= 45 && relative_angle <= 315) {
            // Fall:
            if (relative_angle >= 90 && relative_angle <= 270) {
                return player_set_state(player_state_air);
            }
        }

        // Change to slide:
        if (animation_current == "somersault" && animation_finished == true) {
            x_speed = 4 * image_xscale;
            player_set_animation("skid");
        }
        break;

    // Finish:
    case STATE_FINISH:
        break;
}
