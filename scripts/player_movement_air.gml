/// player_movement_air()
/* Performs a movement step for the player in the air.
Returns whether the player's current state should be aborted or not. */

var total_steps, step, hit_object, hit_wall, hit_floor;

// Reset wall direction:
wall_sign = 0;

// Initialize horizontal movement loop:
total_steps = 1 + (abs(x_speed) div x_radius);
step = x_speed / total_steps;

// Process horizontal movement loop:
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

    // Handle wall collision:
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

        // Trigger reaction:
        // [PLACEHOLDER]

        // Stop if moving towards wall:
        if (sign(x_speed) == wall_sign)
        {
            x_speed = 0;
        }
    }
}

// Initialize vertical movement loop:
total_steps = 1 + (abs(y_speed) div y_radius);
step = y_speed / total_steps;

// Process vertical movement loop:
repeat (total_steps)
{
    // Apply movement step:
    x += dsin(angle) * step;
    y += dcos(angle) * step;

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

    // Handle floor/ceiling collisions:
    if (y_speed >= 0)
    {
        // Floor collision:
        hit_floor = player_collision_floor(y_radius);

        if (hit_floor != noone)
        {
            // Trigger reaction:
            // [PLACEHOLDER]

            // Get floor data:
            player_set_ground(hit_floor);

            // Splash:
            player_surface_splash();
        }
    }
    else
    {
        // Ceiling collision:
        hit_floor = player_collision_ceiling(y_radius);

        if (hit_floor != noone)
        {
            // Trigger reaction:
            // [PLACEHOLDER]

            // Rotate mask to ceiling:
            mask_rotation = angle_wrap(mask_rotation + 180);

            // Get ceiling data:
            player_set_ground(hit_floor);

            // Abort if rising too slow or relative angle is too flat:
            if (y_speed > ceiling_land_threshold || (relative_angle > 135 && relative_angle < 225))
            {
                // Slide against ceiling:
                var sine, csine, g_speed;

                sine = dsin(relative_angle);
                csine = dcos(relative_angle);

                g_speed = (csine * x_speed) - (sine * y_speed);
                x_speed = csine * g_speed;
                y_speed = -(sine * g_speed);

                // Reset air state and exit loop:
                player_reset_air();
                break;
            }
        }
    }

    // Landing:
    if (ground_id != noone)
    {
        // Calculate landing speed:
        if (abs(x_speed) <= abs(y_speed) && relative_angle >= 22.5 && relative_angle <= 337.5)
        {
            // Scale speed to incline:
            x_speed = -y_speed * sign(dsin(relative_angle));

            if (relative_angle < 45 || relative_angle > 315)
            {
                x_speed *= 0.5;
            }
        }

        // Stop falling:
        y_speed = 0;

        // Exit loop:
        break;
    }

    // Handle wall collision:
    hit_wall = player_collision_wall(0);

    if (hit_wall != noone)
    {
        player_wall_eject(hit_wall);
    }
}

// Success
return true;
