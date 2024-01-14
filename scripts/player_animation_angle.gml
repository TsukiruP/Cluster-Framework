/// player_animation_angle()

// Don't bother if in the middle of respawning/dying:
if (action_state == ACTION_RESPAWN || action_state == ACTION_DEATH) exit;

var angle_mod;

// Animation Angle:
switch (animation_current) {
    // Reset angle:
    case "stand":
    case "turn":
    case "ready":
    case "land":
    case "look":
    case "crouch":
    case "super_spin":
    case "spin_dash":
    case "roll":
    case "skid":
    case "skid_fast":
    case "skid_turn":
    case "balance_front":
    case "balance_back":
    case "push":
    case "breathe":
    case "goal":
    case "hurt":
    case "death":
    case "fly_carry":
    case "glide_carry":
    case "fly":
    case "fly_drop":
    case "swim":
    case "swim_drop":
    case "glide":
    case "glide_drop":
    case "slide":
    case "climb_stand":
    case "climb_move":
    case "climb_ledge":
        animation_angle = 0;
        break;
    
    // Spring angle:
    case "spring_flight":
    case "spring_fall":
        if (character_data != CHAR_CLASSIC && action_state == ACTION_SPRING && spring_alarm > 0) animation_angle = spring_angle - 90;
        else animation_angle = approach_angle(animation_angle, 0, 4);
        break;
    
    // Terrain angle:
    default:
        // Default angle behavior:
        if (character_data != CHAR_CLASSIC && tag_animations == false) {
            if (ground == true) animation_angle = ground_angle;
            else animation_angle = approach_angle(animation_angle, 0, 4);
        }
        
        // Classic/Tag angle behavior:
        else {
            if (ground == true) {
                if (terrain_angle_change == false) animation_angle_mod = 0;
                else {
                    var angle_mod;
                    
                    angle_mod = animation_angle_mod;
                    
                    if (ground_angle <= 180) {
                        if (ground_angle < 36) angle_mod = 0;
                        else angle_mod = ground_angle;
                    } else {
                        if (ground_angle > 324) angle_mod = 0;
                        else angle_mod = ground_angle;
                    }
                    
                    if (abs(angle_difference(animation_angle_mod, angle_mod)) < 45) {
                        animation_angle_mod = approach_angle(animation_angle_mod, angle_mod, max(abs(x_speed), 4));
                    } else {
                        animation_angle_mod = angle_mod;
                    }
                }
            } else {
                animation_angle_mod = approach_angle(animation_angle_mod, 0, 4);
            }
            
            // Rotate:
            animation_angle = round(animation_angle_mod / 45) * 45;
        }
}

// Miles Tails:
if (character_data == CHAR_MILES) {
    if (ground == true) miles_tails_angle = wrap_angle(ground_angle + (180 * (animation_direction == -1)));
    else {
        miles_tails_angle = point_direction(0, 0, x_speed, y_speed);
    }
}
