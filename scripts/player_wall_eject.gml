/// player_wall_eject(obj)
/// @desc Ejects the player from the given solid by calculating the distance between them needed to escape collision.
/// @param {object} obj
/// @returns {int}

var _obj; _obj = argument0;

var sine; sine = dsin(mask_direction);
var csine; csine = dcos(mask_direction);
var ox;

// Fully inside wall:
if (collision_point(x, y, _obj, true, false) != noone)
{
    for (ox = wall_radius; ox < wall_radius * 2; ox += 1)
    {
        // Right:
        if (collision_ray_vertical(ox, 0, mask_direction, _obj) == noone)
        {
            x += csine * (wall_radius + ox);
            y -= sine * (wall_radius + ox);
            return -1;
        }

        // Left:
        else if (collision_ray_vertical(-ox, 0, mask_direction, _obj) == noone)
        {
            x -= csine * (wall_radius + ox);
            y += sine * (wall_radius + ox);
            return 1;
        }
    }
}
else
{
    // Find closest side within collision:
    for (ox = wall_radius; ox > -1; ox -= 1)
    {
        if (collision_ray(ox, 0, mask_direction, _obj) == noone)
        {
            // Left:
            if (collision_ray_vertical(ox + 1, 0, mask_direction, _obj) != noone)
            {
                x -= csine * (wall_radius - ox);
                y += sine * (wall_radius - ox);
                return 1;
            }

            // Right:
            else if (collision_box_vertical(-(ox + 1), 0, mask_direction, _obj) != noone)
            {
                x += csine * (wall_radius - ox);
                y -= sine * (wall_radius - ox);
                return -1;
            }
        }
    }
}

return 0;
