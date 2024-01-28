/// player_animation_target()
// Sets the animation target and then calls the animation core script.

// Action animations:
switch (action_state) {
    // Default:
    case ACTION_DEFAULT:
        // Classic default:
        if (character_data == CHAR_CLASSIC) {
            if (ground == true) {
                // Stand:
                if (g_speed == 0 && animation_target != "stand" && animation_target != "wait_leader" && animation_target != "wait_partner") player_set_animation("stand");

                if (g_speed <> 0) {
                    // Jog:
                    if (abs(g_speed) < 6.00 && animation_target != "jog") player_set_animation("jog");

                    // Run:
                    if (abs(g_speed) >= 6.00 && animation_target != "run") player_set_animation("run");
                }
            }
        }

        // Tag default:
        else if (tag_animations == true) {
            if (ground == true) {
                // Stand:
                if (g_speed == 0 && animation_target != "stand" && animation_target != "turn" &&
                    animation_target != "look_end" && animation_target != "crouch_end") player_set_animation("stand");

                if (g_speed <> 0) {
                    // Walk:
                    if (abs(g_speed) < 3.75 && animation_target != "walk") player_set_animation("walk");

                    // Walk fast:
                    if (abs(g_speed) >= 3.75 && abs(g_speed) < 4.50 && animation_target != "walk_fast") player_set_animation("walk_fast");

                    // Jog:
                    if (abs(g_speed) >=  4.50 && animation_target != "jog") player_set_animation("jog");
                }
            } else {
                // Fall:
                if (animation_target != "turn" && animation_target != "skid" && animation_target != "spring_flight" && animation_target != "spring_fall") player_set_animation("spring_fall");
            }
        }

        // Normal default:
        else {
            if (ground == true) {
                if (g_speed == 0) {
                    if (balance_direction == 0) {
                        // Stand:
                        if (animation_target != "stand" && animation_target != "turn" && animation_target != "wait_leader" && animation_target != "wait_partner" &&
                            animation_target != "land" && animation_target != "ready" && animation_target != "look_end" && animation_target != "crouch_end") player_set_animation("stand");
                    } else {
                        // Balance:
                        if (animation_direction == balance_direction) {
                            if (animation_target != "balance_front") player_set_animation("balance_front");
                        } else {
                            if (animation_target != "balance_back") player_set_animation("balance_back");
                        }
                    }
                }

                if (g_speed <> 0) {
                    // Walk:
                    if (abs(g_speed) < 1.50 && animation_target != "walk") player_set_animation("walk");

                    // Walk fast:
                    if (abs(g_speed) >= 1.50 && abs(g_speed) < 3.00 && animation_target != "walk_fast") player_set_animation("walk_fast");

                    // Jog:
                    if (abs(g_speed) >= 3.00 && abs(g_speed) < 4.50 && animation_target != "jog") player_set_animation("jog");

                    // Jog fast:
                    if (abs(g_speed) >= 4.50 && abs(g_speed) < 6.00 && animation_target != "jog_fast") player_set_animation("jog_fast");

                    // Run:
                    if (abs(g_speed) >= 6.00 && animation_target != "run" && animation_target != "dash") player_set_animation("run");
                }
            } else {
                // Fall:
                if (animation_target != "turn" && animation_target != "spin_flight" && animation_target != "spin_fall" && animation_current != "skid" && animation_current != "skid_fast" &&
                    animation_current != "skid_turn" && animation_target != "spring_flight" && animation_target != "spring_fall" && animation_target != "fly_cancel") player_set_animation("spring_fall");
            }
        }
        break;

    // Jump:
    case ACTION_JUMP:
        // Classic jump:
        if (character_data == CHAR_CLASSIC) {
            if (animation_target != "roll") player_set_animation("roll");
        }

        // Tag jump:
        else if (tag_animations == true) {
            if (y_speed <= 0 && animation_target != "spring_flight" && animation_target != "spring_fall") player_set_animation("spring_flight");
            if (y_speed > 0 && animation_target != "spring_fall") player_set_animation("spring_fall");
        }

        // Normal jump:
        else {
            if (tag_action == TAG_LEAP) {
                if (y_speed <= 0 && animation_target != "leap_flight" && animation_target != "leap_fall" && animation_target != "spring_fall") player_set_animation("leap_flight");
                if (y_speed > 0 && animation_target != "leap_fall" && animation_target != "spring_fall") player_set_animation("leap_fall");
            } else {
                if ((animation_target != "roll" && animation_target != "spin_flight" && animation_target != "spin_fall") || animation_current == "drop_dash") player_set_animation("spin_flight");
            }
        }
        break;

    // Look:
    case ACTION_LOOK:
        if (animation_target != "look") player_set_animation("look");
        break;

    // Crouch:
    case ACTION_CROUCH:
        if (animation_target != "crouch") player_set_animation("crouch");
        break;

    // Spin Dash:
    case ACTION_SPIN_DASH:
        // Classic Spin Dash:
        if (character_data == CHAR_CLASSIC) {
            if (animation_target != "spin_dash") player_set_animation("spin_dash");
        } else {
            if (animation_target != "spin_charge" && animation_target != "spin_dash") player_set_animation("spin_dash");
        }
        break;

    // Roll:
    case ACTION_ROLL:
        if (animation_target != "roll") player_set_animation("roll");
        break;

    // Skid:
    case ACTION_SKID:
        // Classic/tag skid:
        if (character_data == CHAR_CLASSIC || tag_animations == true) {
            if (animation_target != "skid") player_set_animation("skid");
        }

        // Normal skid:
        else {
            if (animation_target != "skid" && animation_target != "skid_fast" && animation_target != "skid_turn") player_set_animation("skid");
        }
        break;

    // Balance:
    case ACTION_BALANCE:
        if (character_data == CHAR_CLASSIC) {
            if (abs(balance_direction) == 2) {
                if (animation_target != "balance_front") player_set_animation("balance_front");
            } else {
                if (animation_target != "balance_back") player_set_animation("balance_back");
            }
        } else {
            if (animation_direction == balance_direction) {
                if (animation_target != "balance_front") player_set_animation("balance_front");
            } else {
                if (animation_target != "balance_back") player_set_animation("balance_back");
            }
        }
        break;

    // Push:
    case ACTION_PUSH:
        if (animation_target != "push") player_set_animation("push");
        break;

    // Spring:
    case ACTION_SPRING:
        // Classic spring:
        if (character_data == CHAR_CLASSIC) {
            if ((y_speed < 0 || spring_alarm > 0) && animation_target != "spring") player_set_animation("spring");
            if (((y_speed >= 0 && spring_angle == gravity_angle + ANGLE_UP) || (spring_alarm == 0 && spring_angle != gravity_angle + ANGLE_UP)) && animation_target != "jog") player_set_animation("jog");
        }

        // Tag/normal spring:
        else {
            if ((y_speed < 0 || spring_alarm > 0) && animation_target != "spring_flight") player_set_animation("spring_flight");
            if (((y_speed >= 0 && spring_angle == gravity_angle + ANGLE_UP) || (spring_alarm == 0 && spring_angle != gravity_angle + ANGLE_UP)) && animation_target != "spring_fall") player_set_animation("spring_fall");
        }
        break;

    // Breathe:
    case ACTION_BREATHE:
        if (animation_target != "breathe") player_set_animation("breathe");
        break;

    // Hurt:
    case ACTION_HURT:
        if (animation_target != "hurt") player_set_animation("hurt");
        break;

    // Death:
    case ACTION_DEATH:
        if (character_data == CHAR_CLASSIC && drowned == true) {
            if (animation_target != "drown") player_set_animation("drown");
        } else {
            if (animation_target != "death") player_set_animation("death");
        }
        break;

    // Fly:
    case ACTION_FLY:
        if (flight_timer == flight_duration) {
            if (animation_target != "fly_drop") player_set_animation("fly_drop");
        } else {
            if (animation_target != "fly" && animation_target != "fly_drop" && animation_target != "fly_turn") player_set_animation("fly");
        }
        break;
}



// Missing animations:
if (character_data == CHAR_MILES) {
    if (animation_target == "super_spin") player_set_animation("spin_dash");
}

// Wait:
if (ground == true && input_lock == false && animation_target == "stand") {
    if (animation_alarm > 0) animation_alarm -= 1;
    else {
        if (player_exists(1) != noone) {
            if (player_exists(1) == self.id) player_set_animation("wait_partner");
            else player_set_animation("wait_leader");
        } else {
            player_set_animation(choose("wait_leader", "wait_partner"));
        }
    }
} else {
    if (animation_alarm != 360) animation_alarm = 360;
}

// Animation variants:
switch (animation_target) {
    case "stand":
    case "walk":
    case "walk_fast":
    case "jog":
        if (tag_animations == true) animation_variant = 1;
        else animation_variant = 0;
        break;

    default:
        animation_variant = 0;
}

// Animation core:
player_animation_core();

// Movement speed:
if (animation_current == "walk" || animation_current == "walk_fast" || animation_current == "jog" || animation_current == "jog_fast" || animation_current == "run") {
    timeline_speed = clamp(abs(g_speed * 16 * 3) / 64, 0.5, 8)
}
