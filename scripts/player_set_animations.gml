/// Update Animations

// Action animations:
switch(action_state) {
    // Default:
    case ACTION_DEFAULT:
        // Classic default:
        if(character_data == CHAR_CLASSIC) {
            if(ground == true) {
                // Stand:
                if(g_speed == 0 && animation_target != "stand" && animation_target != "wait_leader" && animation_target != "wait_partner") animation_target = "stand";

                if(g_speed <> 0) {
                    // Jog:
                    if(abs(g_speed) < 6.00 && animation_target != "jog") animation_target = "jog";

                    // Run:
                    if(abs(g_speed) >= 6.00 && animation_target != "run") animation_target = "run";
                }
            }
        }

        // Tag default:
        else if(tag_animations == true) {
            if(ground == true) {
                // Stand:
                if(g_speed == 0 && animation_target != "stand" && animation_target != "turn" &&
                    animation_target != "look" && animation_target != "crouch") animation_target = "stand";

                if(g_speed <> 0) {
                    // Walk:
                    if(abs(g_speed) < 3.75 && animation_target != "walk") animation_target = "walk";

                    // Walk fast:
                    if(abs(g_speed) >= 3.75 && abs(g_speed) < 4.50 && animation_target != "walk_fast") animation_target = "walk_fast";

                    // Jog:
                    if(abs(g_speed) >=  4.50 && animation_target != "jog") animation_target = "jog";
                }
            } else {
                // Fall:
                if(animation_target != "turn" && animation_target != "skid" && animation_target != "spring_flight" && animation_target != "spring_fall") animation_target = "spring_fall";
            }
        }

        // Normal default:
        else {
            if(ground == true) {
                // Stand:
                if(g_speed == 0 && animation_target != "stand" && animation_target != "turn" && animation_target != "wait_leader" && animation_target != "wait_partner" &&
                    animation_target != "land" && animation_target != "ready" && animation_target != "look" && animation_target != "crouch") animation_target = "stand";

                if(g_speed <> 0) {
                    // Walk:
                    if(abs(g_speed) < 1.50 && animation_target != "walk") animation_target = "walk";

                    // Walk fast:
                    if(abs(g_speed) >= 1.50 && abs(g_speed) < 3.00 && animation_target != "walk_fast") animation_target = "walk_fast";

                    // Jog:
                    if(abs(g_speed) >= 3.00 && abs(g_speed) < 4.50 && animation_target != "jog") animation_target = "jog";

                    // Jog fast:
                    if(abs(g_speed) >= 4.50 && abs(g_speed) < 6.00 && animation_target != "jog_fast") animation_target = "jog_fast";

                    // Run:
                    if(abs(g_speed) >= 6.00 && animation_target != "run" && animation_target != "dash") animation_target = "run";
                }
            } else {
                // Fall:
                if(animation_target != "turn" && animation_target != "spin_flight" && animation_target != "spin_fall" && animation_current != "skid" && animation_current != "skid_fast" &&
                    animation_current != "skid_turn" && animation_target != "spring_flight" && animation_target != "spring_fall" && animation_target != "fly_cancel") animation_target = "spring_fall";
            }
        }
        break;

    // Jump:
    case ACTION_JUMP:
        // Classic jump:
        if(character_data == CHAR_CLASSIC) {
            if(animation_target != "roll") animation_target = "roll";
        }

        // Tag jump:
        else if(tag_animations == true) {
            if(y_speed <= 0 && animation_target != "spring_flight" && animation_target != "spring_fall") animation_target = "spring_flight";
            if(y_speed > 0 && animation_target != "spring_fall") animation_target = "spring_fall";
        }

        // Normal jump:
        else {
            if(tag_action == TAG_LEAP) {
                if(y_speed <= 0 && animation_target != "leap_flight" && animation_target != "leap_fall" && animation_target != "spring_fall") animation_target = "leap_flight";
                if(y_speed > 0 && animation_target != "leap_fall" && animation_target != "spring_fall") animation_target = "leap_fall";
            } else {
                if((animation_target != "roll" && animation_target != "spin_flight" && animation_target != "spin_fall") || animation_current == "drop_dash") animation_target = "spin_flight";
            }
        }
        break;

    // Look:
    case ACTION_LOOK:
        if(animation_target != "look") animation_target = "look";
        break;

    // Crouch:
    case ACTION_CROUCH:
        if(animation_target != "crouch") animation_target = "crouch";
        break;

    // Spin Dash:
    case ACTION_SPIN_DASH:
        // Classic Spin Dash:
        if(character_data == CHAR_CLASSIC) {
            if(animation_target != "spin_dash") animation_target = "spin_dash";
        } else {
            if(animation_target != "super_spin" && animation_target != "spin_dash") animation_target = "spin_dash";
        }
        break;

    // Roll:
    case ACTION_ROLL:
        if(animation_target != "roll") animation_target = "roll";
        break;

    // Skid:
    case ACTION_SKID:
        // Classic/tag skid:
        if(character_data == CHAR_CLASSIC || tag_animations == true) {
            if(animation_target != "skid") animation_target = "skid";
        }

        // Normal skid:
        else {
            if(animation_target != "skid" && animation_target != "skid_fast" && animation_target != "skid_turn") animation_target = "skid";
        }
        break;

    // Balance:
    case ACTION_BALANCE:
        if(character_data == CHAR_CLASSIC) {
            if(abs(balance_direction) == 2) {
                if(animation_target != "balance_front") animation_target = "balance_front";
            } else {
                if(animation_target != "balance_back") animation_target = "balance_back";
            }
        } else {
            if(animation_direction == balance_direction) {
                if(animation_target != "balance_front") animation_target = "balance_front";
            } else {
                if(animation_target != "balance_back") animation_target = "balance_back";
            }
        }
        break;

    // Push:
    case ACTION_PUSH:
        if(animation_target != "push") animation_target = "push";
        break;

    // Spring:
    case ACTION_SPRING:
        // Classic spring:
        if(character_data == CHAR_CLASSIC) {
            if((y_speed < 0 || spring_alarm > 0) && animation_target != "spring") animation_target = "spring";
            if(((y_speed >= 0 && spring_angle == gravity_angle + ANGLE_UP) || (spring_alarm == 0 && spring_angle != gravity_angle + ANGLE_UP)) && animation_target != "jog") animation_target = "jog";
        }

        // Tag/normal spring:
        else {
            if((y_speed < 0 || spring_alarm > 0) && animation_target != "spring_flight") animation_target = "spring_flight";
            if(((y_speed >= 0 && spring_angle == gravity_angle + ANGLE_UP) || (spring_alarm == 0 && spring_angle != gravity_angle + ANGLE_UP)) && animation_target != "spring_fall") animation_target = "spring_fall";
        }
        break;

    // Breathe:
    case ACTION_BREATHE:
        if(animation_target != "breathe") animation_target = "breathe";
        break;

    // Hurt:
    case ACTION_HURT:
        if(animation_target != "hurt") animation_target = "hurt";
        break;

    // Death:
    case ACTION_DEATH:
        if(character_data == CHAR_CLASSIC && drowned == true) {
            if(animation_target != "drown") animation_target = "drown";
        } else {
            if(animation_target != "death") animation_target = "death";
        }
        break;

    // Fly:
    case ACTION_FLY:
        if(flight_timer == flight_duration) {
            if(animation_target != "fly_drop") animation_target = "fly_drop";
        } else {
            if(animation_target != "fly" && animation_target != "fly_drop" && animation_target != "fly_turn") animation_target = "fly";
        }
        break;
}

// Wait:
if(input_cpu == false && input_lock == false && tag_animations == false && animation_current == "stand" && animation_next == "") {
    if(animation_timer != 400) animation_timer += 1;
    else {
        if(player_exists(1)) animation_next = "wait_leader";
        else animation_next = choose("wait_leader", "wait_partner");

        animation_loop_count = 0;

        // Classic fix:
        if(character_data == CHAR_CLASSIC) animation_target = animation_next;
    }
} else animation_timer = 0;

if(player_exists(1) && animation_current == "wait_leader") {
    var partner_instance;

    // Partner instance:
    partner_instance = global.player_instance[1];

    if(partner_instance.input_cpu_alarm == 0 && partner_instance.g_speed == 0 && partner_instance.animation_target != "wait_partner") {
        with(partner_instance) animation_target = "wait_partner";
    }
}

// Missing animations:
if(character_data == CHAR_MILES) {
    if(animation_target == "super_spin") animation_target = "spin_dash";
}

// Animation core:
player_animation_core();

// Align roll:
if(animation_current == "roll" || animation_current == "spin_flight") player_align_roll();
