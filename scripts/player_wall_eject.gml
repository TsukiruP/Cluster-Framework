/// player_wall_eject(inst)
/// @desc Ejects the player from the given solid by calculating the distance between them needed to escape collision.
/// @param {object} inst
/// @returns {int}

var _inst; _inst = argument0;

var sine; sine = dsin(mask_rotation);
var csine; csine = dcos(mask_rotation);

// Get collision offset:
for ({var ox; ox = wall_radius}; ox > -1; ox -= 1)
{
    if (collision_ray(ox, 0, mask_rotation, _inst) == noone) break;
}

// If the offset is negative, we're stuck:
if (ox <= 0)
{
    // Find the closest edge outside of collision:
    for (ox = wall_radius; ox < wall_radius * 2; ox += 1)
    {
        // Right side:
        if (collision_ray_vertical(ox, 0, mask_rotation, _inst) == noone)
        {
            x += csine * (wall_radius + ox);
            y -= sine * (wall_radius + ox);
            return -1;
        }

        // Left side:
        if (collision_ray_vertical(-ox, 0, mask_rotation, _inst) == noone)
        {
            x -= csine * (wall_radius + ox);
            y += sine * (wall_radius + ox);
            return 1;
        }
    }
}

// Right side only:
else if (collision_ray_vertical(ox + 1, 0, mask_rotation, _inst) != noone)
{
    x -= csine * (wall_radius - ox);
    y += sine * (wall_radius - ox);
    return 1;
}

// Left side only:
else if (collision_ray_vertical(-(ox + 1), 0, mask_rotation, _inst) != noone)
{
    x += csine * (wall_radius - ox);
    y -= sine * (wall_radius - ox);
    return -1;
}

// Failure:
return 0;