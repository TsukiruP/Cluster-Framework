/// player_movement_ground()
// Performs a movement step for the player on the ground.

var ox, oy, total_steps, step, hit_object, hit_wall, hit_floor, hit_push;

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

    if (hit_prop != false) {
        // React:
        player_react(prop_handle, hit_prop);

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

        // Trigger reaction:
        // [PLACEHOLDER]

        // Stop if moving towards wall:
        if (sign(x_speed) == wall_sign) {
            x_speed = 0;
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

    // Push collision:
    hit_push = player_collision_wall(1);

    if (hit_push != noone) {
        var push_direction;

        if (mask_rotation mod 180 != 0) {
            push_direction = sign(hit_push.y - y) * -dsin(gravity_angle());
        } else {
            push_direction = sign(hit_push.x - x) * dcos(gravity_angle());
        }

        if (input_x_direction == push_direction) {
            player_wall_push(hit_push);
        }
    }

    // Handle mask rotation:
    player_rotate_mask();
}

// Success
return true;
