/// player_movement_ground()
// Performs a movement step for the player on the ground.

var ox, oy, total_steps, step, hit_object, hit_wall, hit_floor;

// Snap to platforms:
if (instance_exists(ground_id)) {
    // Vectors:
    ox = ground_id.x - ground_id.xprevious;
    oy = ground_id.y - ground_id.yprevious;

    if (ground_id.hspeed != 0) {
        ox = ground_id.hspeed;
    }

    if (ground_id.vspeed != 0) {
        oy = ground_id.vspeed;
    }

    // Move:
    if (ox != 0) {
        x += ox;
    }

    if (oy != 0) {
        y += oy;
    }
}

// Fall off:
else {
    on_ground = false;
}

// Reset wall direction:
wall_direction = 0;

// Initialize steps:
total_steps = 1 + (abs(x_speed) div x_radius);
step        = x_speed / total_steps;

// Process steps:
repeat (total_steps) {
    // Apply movement:
    x += dcos(angle) * step;
    y -= dsin(angle) * step;

    // Keep in bounds:
    player_inbounds();

    // Prop collision
    // [PLACEHOLDER]

    // Get solids:
    player_get_solids();

    // Wall collision:
    hit_wall = player_collision_wall(0);

    if (hit_wall != noone) {
        // Get crushed:
        // [PLACEHOLDER]

        // Eject:
        wall_direction = player_wall_eject(hit_wall);

        // React:
        // [PLACEHOLDER]

        // Stop moving:
        if (sign(x_speed) == wall_direction) {
            x_speed = 0;
            // Push:
            // [PLACEHOLDER]
        }
    }

    // Floor collision:
    hit_floor = player_collision_floor(y_radius * 2);

    if (hit_floor != noone) {
        // React
        // [PLACEHOLDER]

        // Set floor:
        player_set_ground(hit_floor);
    }

    // Fall off:
    else {
        on_ground = false;
    }

    // Rotate mask:
    player_rotate_mask();
}

// Success:
return true;
