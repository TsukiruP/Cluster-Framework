/// player_movement_air()
/// @desc Performs a movement step for the player in the air.
/// @returns {bool} Returns whether the player's current state should be aborted or not.

var total_steps, step, hit_wall, hit_floor;

total_steps = 1 + (abs(x_speed) div x_radius);
step = x_speed / total_steps;

repeat (total_steps)
{
    // Apply movement step:
    x += dcos(angle) * step;
    y -= dsin(angle) * step;
    
    // Die if out of bounds:
    if (!player_inbounds())
    {
        player_set_damage(self);
        return false;
    }
    
    // Stage objects:
    player_get_stage_objects();
    if (player_collision_reaction()) return false;
    
    // Wall collision:
    hit_wall = player_collision_wall(0);
    
    if (hit_wall != noone)
    {
        // Get crushed:
        if (hit_wall.can_crush && collision_point(x, y, hit_wall, true, false) != noone)
        {
            player_set_damage(self);
            return false;
        }
        
        var wall_sign; wall_sign = player_wall_eject(hit_wall);
        
        // React:
        if (player_react(hit_wall, HIT_SOLID, pick(wall_sign == -1, ANGLE_LEFT, ANGLE_RIGHT))) return false;
        
        // Stop moving:
        if (sign(x_speed) == wall_sign) x_speed = 0;
    }
}

total_steps = 1 + (abs(y_speed) div y_radius);
step = y_speed / total_steps;

repeat (total_steps)
{
    // Apply movement step:
    x += dsin(angle) * step;
    y += dcos(angle) * step;
    
    // Die if out of bounds:
    if (!player_inbounds())
    {
        player_set_damage(self);
        return false;
    }
    
    // Stage objects:
    player_get_stage_objects();
    if (player_collision_reaction()) return false;
    
    // Floor collision:
    if (y_speed >= 0)
    {
        hit_floor = player_collision_floor(y_radius);
        
        if (hit_floor != noone)
        {
            if (player_react(hit_floor, HIT_SOLID, ANGLE_UP)) return false;
            player_set_ground(hit_floor);
            player_rotate_mask();
        }
    }
    
    // Ceiling collision:
    else
    {
        hit_floor = player_collision_ceiling(y_radius);
        
        if (hit_floor != noone)
        {
            // Rotate mask to ceiling and get ceiling data:
            mask_direction = (mask_direction + 180) mod 360;
            player_set_ground(hit_floor);
            
            // Abort if rising too slow or ceiling is too shallow:
            if (y_speed > ceiling_land_threshold || (relative_angle > 135 && relative_angle < 225))
            {
                var sine; sine = dsin(relative_angle);
                var csine; csine = dcos(relative_angle);
                var g_speed; g_speed = (csine * x_speed) - (sine * y_speed);
                
                // Slide against ceiling:
                x_speed = csine * g_speed;
                y_speed = sine * g_speed;
                
                // Reset air and exit loop:
                player_reset_air();
                break;
            }
        }
    }
    
    // Land:
    if (ground_inst != noone)
    {
        // Calculate landing speed:
        if (abs(x_speed) <= abs(y_speed) && relative_angle >= 22.5 && relative_angle <= 337.5)
        {
            // Scale speed to incline:
            x_speed = -y_speed * sign(dsin(relative_angle));
            if (relative_angle < 45 || relative_angle > 315) x_speed *= 0.5;
        }
        
        // Stop falling and exit loop:
        y_speed = 0;
        break;
    }
    
    // Wall collision (again):
    hit_wall = player_collision_wall(0);
    if (hit_wall != noone) player_wall_eject(hit_wall);
}

return true;
