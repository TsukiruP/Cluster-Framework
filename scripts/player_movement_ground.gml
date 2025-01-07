/// player_movement_ground()
/* Performs a movement step for the player on the ground.
Returns whether the player's current state should be aborted or not. */

var ox, oy, total_steps, step, prop_handle, hit_prop, obstacle_handle, hit_obstacle, hit_wall, hit_floor;

// Snap to moving platforms:
if (instance_exists(ground_id))
{
    // Initialize vectors:
    ox = ground_id.x - ground_id.xprevious;
    oy = ground_id.y - ground_id.yprevious;

    if (ground_id.hspeed != 0) ox = ground_id.hspeed;
    if (ground_id.vspeed != 0) oy = ground_id.vspeed;

    // Move:
    if (ox != 0) x += ox;
    if (oy != 0) y += oy;
}

// Fall off:
else
{
    on_ground = false;
}

// Reset wall data:
wall_sign = 0;

// Initialize movement loop:
total_steps = 1 + (abs(x_speed) div x_radius);
step = x_speed / total_steps;

// Process movement loop:
repeat (total_steps)
{
    // Apply movement step:
    x += dcos(angle) * step;
    y -= dsin(angle) * step;

    // Keep in bounds:
    if (!player_inbounds())
    {
        return false;
    }

    // Object collision:
    if (player_collision_object())
    {
        return false;
    }

    // Get colliding solids:
    player_get_solids();

    // Wall collision:
    hit_wall = player_collision_wall(0);

    if (hit_wall != noone)
    {
        // Get crushed:
        if (hit_wall.can_crush && collision_point(x, y, hit_wall, true, false) != noone)
        {
            // Death:
            player_set_damage(self);
            return false;
        }

        // Eject from wall:
        wall_sign = player_wall_eject(hit_wall);

        // React:
        player_react(hit_wall, COLL_SOLID);
        
        if (state_changed == true)
        {
            return false;
        }

        // Stop if moving towards wall:
        if (sign(x_speed) == wall_sign)
        {
            // Reset speed:
            x_speed = 0;

            // Push:
            if (image_xscale == wall_sign and input_x_direction == wall_sign)
            {
                player_wall_push(hit_wall, wall_sign);
            }
        }
    }

    // Floor collision
    hit_floor = player_collision_floor(y_radius * 2);

    if (hit_floor != noone)
    {
        // React:
        player_react(hit_floor, COLL_SOLID);
        
        if (state_changed == true)
        {
            return false;
        }

        // Get floor data:
        player_set_ground(hit_floor);
    }

    // Fall off:
    else
    {
        on_ground = false;
    }

    // Handle mask rotation:
    player_rotate_mask();
}

// Success
return true;
