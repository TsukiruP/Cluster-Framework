/// player_movement_ground()
// Performs a movement step for the player on the ground.

var ox, oy, total_steps, step, prop_handle, hit_prop, obstacle_handle, hit_obstacle, hit_wall, hit_floor;

// Snap to moving platforms:
if (instance_exists(ground_id)) {
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
else {
    on_ground = false;
}

// Reset wall direction:
wall_sign = 0;

// Initialize movement loop:
total_steps = 1 + (abs(x_speed) div x_radius);
step        = x_speed / total_steps;

// Process movement loop:
repeat (total_steps) {
    // Apply movement step:
    x += dcos(angle) * step;
    y -= dsin(angle) * step;

    // Keep in bounds:
    if (!player_inbounds()) {
        return false;
    }

    // Prop collision:
    prop_handle = instance_nearest(floor(x), floor(y), par_prop);
    hit_prop    = player_collision_object(prop_handle);

    if (hit_prop != 0) {
        // React:
        player_react(prop_handle, hit_prop);

        if (state_changed == true) {
            return false;
        }
    }

    // Obstacle collision:
    obstacle_handle = instance_nearest(floor(x), floor(y), par_obstacle);
    hit_obstacle    = player_collision_object(obstacle_handle);

    if (hit_obstacle != 0) {
        // React:
        player_react(obstacle_handle, hit_obstacle, angle_wrap(round(point_direction(obstacle_handle.x, obstacle_handle.y, x, y) / ANGLE_UP) * ANGLE_UP));

        if (state_changed == true) {
            return false;
        }
    }

    // Get colliding solids:
    player_get_solids();

    // Wall collision:
    hit_wall = player_collision_wall(0);

    if (hit_wall != noone) {
        // Get crushed if applicable:
        // [PLACEHOLDER]

        // Eject from wall:
        wall_sign = player_wall_eject(hit_wall);

        // React:
        // [PLACEHOLDER]

        // Stop if moving towards wall:
        if (sign(x_speed) == wall_sign) {
            x_speed = 0;

            player_wall_push(hit_wall);
        }
    }

    // Floor collision
    hit_floor = player_collision_floor(y_radius * 2);

    if (hit_floor != noone) {
        // React:
        // [PLACEHOLDER]

        // Get floor data:
        player_set_ground(hit_floor);
    }

    // Fall off:
    else {
        on_ground = false;
    }

    // Handle mask rotation:
    player_rotate_mask();
}

// Success
return true;
