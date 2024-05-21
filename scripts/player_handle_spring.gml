/// player_handle_spring()
// Bounce Pad! Wait, that's not right.

var spring_handle;

// Nearest spring:
spring_handle = instance_nearest(x, y, par_spring);

if (spring_handle == noone) exit;

// Activate spring:
if (player_collision_prop(spring_handle, SIDE_MAIN) != 0) {
    with (spring_handle) {
        if (spring_active == false) spring_active = true;
    }
    
    // Spring variables:
    spring_strength = spring_handle.spring_strength;
    spring_angle    = spring_handle.spring_angle;
    
    // Bounce:
    ground       = false;
    x_speed      = dcos(spring_angle) * (spring_strength * spring_handle.spring_direction_x);
    y_speed      = dsin(spring_angle) * (spring_strength * spring_handle.spring_direction_y);
    action_state = ACTION_SPRING;
    
    // Move player:
    if (spring_alarm == 0 || spring_current != spring_handle) {
        if (spring_handle.spring_direction_x != 0) {
            y                   = spring_handle.y;
            animation_direction = sign(spring_handle.spring_direction_x);
        }
        
        if (spring_handle.spring_direction_y != 0) x = spring_handle.x;
        
        spring_alarm   = spring_strength;
        spring_current = spring_handle;
    }
}
