/// player_movement_air()
// Performs a movement step for the player in the air.

var total_steps, step, hit_object, hit_wall, hit_floor;

// Reset wall direction:
wall_direction = 0;

// Initialize horizontal movement loop:
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
        }
    }
}

// Initialize vertical movement loop:
total_steps = 1 + (abs(y_speed) div y_radius);
step        = y_speed / total_steps;

// Process vertical movement loop
repeat (total_steps) {
    // Apply movement:
    x += dsin(angle) * step;
    y += dcos(angle) * step;

    // Keep in bounds:
    player_inbounds();

    // Prop collision
    // [PLACEHOLDER]

    // Get solids:
    player_get_solids();

    // Handle floor/ceiling collisions
    if (y_speed >= 0) {
        // Floor collision:
        hit_floor = player_collision_floor(y_radius);

        if (hit_floor != noone) {
            // Trigger reaction
            //if (player_react(hit_floor, COLL_BOTTOM)) return false; [PLACEHOLDER]

            // Set floor:
            player_set_ground(hit_floor);
        }
    } else {
        // Ceiling collision:
        hit_floor = player_collision_ceiling(y_radius);

        if (hit_floor != noone) {
            // Trigger reaction
            //if (player_react(hit_floor, COLL_TOP)) return false;

            // Rotate mask:
            mask_rotation = wrap_angle(mask_rotation + 180);

            // Set ceiling:
            player_set_ground(hit_floor);

            // Abort if rising too slow or relative angle is too flat:
            if (y_speed > ceiling_land_threshold || (relative_angle > 135 && relative_angle < 225)) {
                // Slide against ceiling
                var sine, csine, g_speed;

                sine    = dsin(relative_angle);
                csine   = dcos(relative_angle);

                g_speed =  (csine * x_speed) - (sine * y_speed);
                x_speed =  csine * g_speed;
                y_speed = -(sine * g_speed);

                // Reset air:
                player_reset_air();
                break;
            }
        }
    }

    // Land:
    if (ground_id != noone) {
        // Calculate landing speed:
        if (abs(x_speed) <= abs(y_speed) && relative_angle >= 22.5 && relative_angle <= 337.5) {
            // Scale speed to incline:
            x_speed = -y_speed * sign(dsin(relative_angle));

            if (relative_angle < 45 || relative_angle > 315) {
                x_speed *= 0.5;
            }
        }

        // Stop falling:
        y_speed = 0;

        // Exit loop:
        break;
    }

    // Wall collision:
    hit_wall = player_collision_wall(0);

    if (hit_wall != noone) {
        player_wall_eject(hit_wall);
    }
}

// Success
return true;
