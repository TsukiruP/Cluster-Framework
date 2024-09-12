/// player_get_angle(x, y, [floor_mode])
// Calculates the angle of the given solid using its image && collision data.

// Unspecified solid shape:
if (argument0.shape == -1)
{
    var total_solids, dist1, dist2, oy, n, inst;

    total_solids = ds_list_size(solid_list);
    dist1 = -1;
    dist2 = -1;

    // Scan line beyond feet:
    for (oy = y_radius; oy < y_radius * 2; oy += 1)
    {
        // Evaluate all solids:
        for (n = 0; n < total_solids; n += 1)
        {
            // Get the current solid:
            inst = ds_list_find_value(solid_list, n);

            // Continue if not colliding with the current solid:
            if (collision_ray(x_radius, oy, angle, inst) == noone) continue;

            // Get sensor heights:
            if (dist1 < 0 && collision_ray_vertical(-x_radius, oy, angle, inst) != noone)
            {
                dist1 = oy;
            }

            if (dist2 < 0 && collision_ray_vertical(x_radius, oy, angle, inst) != noone)
            {
                dist2 = oy;
            }
        }

        // Exit loop if both sensors have found the ground:
        if (dist1 > -1 && dist2 > -1)
        {
            break;
        }
    }

    // Sensor failure:
    if (dist1 < 0 || dist2 < 0)
    {
        return -1;
    }

    // Default:
    if (dist1 == dist2)
    {
        return angle;
    }

    // Calculate angle from sensors:
    var x_int, y_int, sine, csine, x1, y1, x2, y2;

    x_int = floor(x);
    y_int = floor(y);

    sine = dsin(angle);
    csine = dcos(angle);

    x1 = x_int - (csine * x_radius) + (sine * dist1);
    y1 = y_int + (sine * x_radius) + (csine * dist1);
    x2 = x_int + (csine * x_radius) + (sine * dist2);
    y2 = y_int - (sine * x_radius) + (csine * dist2);

    return angle_wrap(round(point_direction(x1, y1, x2, y2)));
}

// Get the solid's image data:
var xscale, yscale, left, right, top, bottom;

xscale = sign(argument0.image_xscale);
yscale = sign(argument0.image_yscale);

left = argument0.bbox_left;
right = argument0.bbox_right + 1;
top = argument0.bbox_top;
bottom = argument0.bbox_bottom + 1;

// Abort if colliding on the wrong side of the solid:
if ((argument1 == 0 && yscale == -1) || (argument1 == 90 && xscale == -1) ||
    (argument1 == 180 && yscale == 1) || (argument1 == 270 && xscale == 1))
{
    return argument1;
}

// Abort if out of the solid's bounds:
if (argument1 mod 180 != 0)
{
    if (yscale == -1 && y - x_radius < top)
    {
        return argument1;
    }

    if (yscale == 1 && y + x_radius > bottom)
    {
        return argument1;
    }

    if (argument0.shape == SHAPE_CONCAVE)
    {
        if (xscale == 1 && x + y_radius < left)
        {
            return argument1;
        }

        if (xscale == -1 && x - y_radius > right)
        {
            return argument1;
        }
    }
}
else
{
    if (xscale == -1 && x - x_radius < left)
    {
        return argument1;
    }

    if (xscale == 1 && x + x_radius > right)
    {
        return argument1;
    }

    if (argument0.shape == SHAPE_CONCAVE)
    {
        if (yscale == 1 && y + y_radius < top)
        {
            return argument1;
        }

        if (yscale == -1 && y - y_radius > bottom)
        {
            return argument1;
        }
    }
}

// If the solid's angle is hard-coded, return it:
if (argument0.surface_angle > -1)
{
    return angle_wrap(argument0.surface_angle);
}

// Determine calculation method:
var x1, y1, x2, y2;
if (argument0.shape == SHAPE_SLANT)
{
    // Set offsets:
    x1 = left;
    y1 = bottom;
    x2 = right;
    y2 = top;

    if (yscale == -1)
    {
        x1 = right;
        x2 = left;
    }

    if (xscale == -1)
    {
        y1 = top;
        y2 = bottom;
    }

    // Calculate slant angle:
    return angle_wrap(round(point_direction(x1, y1, x2, y2)));
}

// Curves:
else if (argument0.shape != SHAPE_RECTANGLE)
{
    // Set corner offset:
    x1 = right;
    y1 = bottom;

    if (argument0.shape == SHAPE_CONVEX ^^ xscale == 1)
    {
        x1 = left;
    }

    if (argument0.shape == SHAPE_CONVEX ^^ yscale == 1)
    {
        y1 = top;
    }

    // Set mask offset:
    x2 = x + (x_radius * xscale * (argument1 mod 180 == 0));
    y2 = y + (x_radius * yscale * (argument1 mod 180 != 0));

    // Calculate curve angle:
    var dir;

    dir = point_direction(x1, y1, x2, y2);

    if (argument0.shape == SHAPE_CONVEX)
    {
        dir = point_direction(x2, y2, x1, y1);
    }
    return angle_wrap(round(dir) + 90);
}

// Default:
return argument1;
