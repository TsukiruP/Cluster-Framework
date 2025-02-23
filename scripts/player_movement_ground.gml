/// player_movement_ground()
/// @desc Performs a movement step for the player on the ground.
/// @returns {bool} Returns whether the player's current state should be aborted or not.

// Snap to moving platforms:
if (instance_exists(ground_inst))
{
    // Initialize vectors:
    var ox; ox = ground_inst.x - ground_inst.xprevious;
    var oy; oy = ground_inst.y - ground_inst.yprevious;

    if (ground_inst.hspeed != 0) ox = ground_inst.hspeed;
    if (ground_inst.vspeed != 0) oy = ground_inst.vspeed;

    // Move:
    if (ox != 0) x += ox;
    if (oy != 0) y += oy;
}

// Fall off:
else on_ground = false;

// Reset wall data:
wall_sign = 0;

// Initialize movement loop:
var total_steps; total_steps = 1 + (abs(x_speed) div x_radius);
var step; step = x_speed / total_steps;

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
    var hit_wall; hit_wall = player_collision_wall(0);

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
    var hit_floor; hit_floor = player_collision_floor(y_radius * 2);

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