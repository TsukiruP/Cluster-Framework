/// player_handle_spring()
// Bounce Pad! Wait, that's not right.

var spring_handle, spring_ancestry;

// Nearest spring:
spring_handle = instance_nearest(x, y, par_spring);

if (spring_handle == noone) exit;

// Activate spring:
if (player_collision_prop(spring_handle, SIDE_MAIN) != 0) {
    // Spring ancestry:
    spring_ancestry = object_is_ancestor(spring_handle.object_index, par_dash_ring) || object_is_ancestor(spring_handle.object_index, par_rainbow_ring);
    
    with (spring_handle) {
        if (spring_active == false) spring_active = true;
    }
    
    // Spring variables:
    spring_strength = spring_handle.spring_strength;
    spring_angle    = spring_handle.spring_angle;
    
    // Spring:
    g_speed =  dcos(spring_angle) * spring_strength;
    x_speed =  dcos(spring_angle) * spring_strength;
    y_speed = -dsin(spring_angle) * spring_strength;
    
    // Move player:
    if (spring_alarm == 0 || spring_current != spring_handle) {
        // Set positon:
        x = spring_handle.x;
        
        if (!(ground == true && (spring_angle == ANGLE_LEFT || spring_angle == ANGLE_RIGHT)) || spring_ancestry == true) {
            y            = spring_handle.y;
            ground       = false;
            action_state = ACTION_SPRING;
        } else {
            input_lock_alarm = 16;
        }
        
        // Set direction:
        if (dcos(spring_angle) != 0) animation_direction = sign(dcos(spring_angle));
        
        spring_alarm   = spring_strength + 15;
        spring_current = spring_handle;
    }
    
    // Add to score:
    if (object_is_ancestor(spring_handle.object_index, par_rainbow_ring)) {
        with (spring_handle) {
            if (rainbow_score == true) {
                global.game_score += 1000;
                rainbow_score      = false;
            }
        }
    }
    
    // Play sound:
    if (spring_handle.spring_sfx == 0) {
        switch (object_get_parent(spring_handle.object_index)) {
            case par_dash_ring:
                break;
            
            case par_rainbow_ring:
                break;
            
            default:
                sound_play_single("snd_spring");
        }
        
        spring_handle.spring_sfx = 8;
    }
}
