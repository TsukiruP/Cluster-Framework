/// player_movement_ground()
/* Performs a movement step for the player on the ground.
Returns whether the player's current state should be aborted or not. */

var ox, oy, total_steps, step, prop_id, hit_prop, obstacle_id, hit_obstacle, hit_wall, hit_floor;

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
else on_ground = false;

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

    if (!player_inbounds()) return false;

    // Get colliding stage objects:
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

        // Eject from wall:
        wall_sign = player_wall_eject(hit_wall);

        // React:
        if (player_react(hit_wall, HIT_SOLID, pick(wall_sign == -1, ANGLE_LEFT, ANGLE_RIGHT))) return false;

        // Stop if moving towards wall:
        if (sign(x_speed) == wall_sign)
        {
            x_speed = 0;
            if (sign(image_xscale) == wall_sign && input_x_direction == wall_sign) player_wall_push(hit_wall, wall_sign);
        }
    }

    // Floor collision
    hit_floor = player_collision_floor(y_radius * 2);

    if (hit_floor != noone)
    {
        // React:
        if (player_react(hit_floor, HIT_SOLID, ANGLE_UP)) return false;

        player_set_ground(hit_floor);
    }
    else on_ground = false;

    player_rotate_mask();
}

return true;
