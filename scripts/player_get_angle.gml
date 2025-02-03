/// player_get_angle(obj, rot)
/* Calculates the angle of the given solid using its image && collision data. */

var xscale, yscale, left, right, top, bottom, kind, temp_radius;

xscale = sign(argument0.image_xscale);
yscale = sign(argument0.image_yscale);
left = argument0.bbox_left;
right = argument0.bbox_right + 1;
top = argument0.bbox_top;
bottom = argument0.bbox_bottom + 1;
kind = argument0.shape;
temp_radius = 8;

// Default if...
if (kind != SHAPE_UNDEFINED)
{
    // Colliding on the wrong side of the solid:
    if ((argument1 == 0 and yscale == -1) or (argument1 == 90 and xscale == -1) or
        (argument1 == 180 and yscale == 1) or (argument1 == 270 and xscale == 1)) return argument1;

    // Out of the solid's bounds:
    if (argument1 mod 180 != 0)
    {
        if (yscale == -1 and y - temp_radius < top) return argument1;
        if (yscale == 1 and y + temp_radius > bottom) return argument1;
        if (kind == SHAPE_CONCAVE)
        {
            if (xscale == 1 and x + y_radius < left) return argument1;
            if (xscale == -1 and x - y_radius > right) return argument1;
        }
    }
    else
    {
        if (xscale == -1 and x - temp_radius < left) return argument1;
        if (xscale == 1 and x + temp_radius > right) return argument1;
        if (kind == SHAPE_CONCAVE)
        {
            if (yscale == 1 and y + y_radius < top) return argument1;
            if (yscale == -1 and y - y_radius > bottom) return argument1;
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

switch (kind)
{
    case SHAPE_SLANT:
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

        // Calculate hypotenuse angle:
        return angle_wrap(round(point_direction(x1, y1, x2, y2)));
        break;
    }
    case SHAPE_CONCAVE:
    case SHAPE_CONVEX:
    {
        // Set corner offset:
        x1 = right;
        y1 = bottom;

        if (kind == SHAPE_CONVEX xor xscale == 1)
        {
            x1 = left;
        }
        if (kind == SHAPE_CONVEX xor yscale == 1)
        {
            y1 = top;
        }

        // Set mask offset:
        x2 = x + (temp_radius * xscale * (argument1 mod 180 == 0));
        y2 = y + (temp_radius * yscale * (argument1 mod 180 != 0));

        // Calculate curve angle:
        var dir;
        dir = point_direction(x1, y1, x2, y2);
        if (kind == SHAPE_CONVEX)
        {
            dir = point_direction(x2, y2, x1, y1);
        }
        return angle_wrap(round(dir) + 90);
        break;
    }

    // Undefined solid shape:
    case SHAPE_UNDEFINED:
    {
        var max_dist;
        max_dist = y_radius * 4;

        // Ignore if not within the solid's bounds
        if (collision_ray_vertical(-temp_radius, max_dist, argument1, argument0) != noone and
            collision_ray_vertical(temp_radius, max_dist, argument1, argument0) != noone)
        {
            var dir, dist1, dist2, oy;
            dir = floor(angle / 10) * 10;
            if (y_speed < 0) dir = argument1;
            dist1 = -1;
            dist2 = -1;
            
            // Scan below feet
            for (oy = y_radius; oy < max_dist; oy += 1)
            {
                // Check if the sensors are touching the solid
                if (dist1 < 0 and collision_ray_vertical(-temp_radius, oy, dir, argument0) != noone)
                {
                    dist1 = oy;
                }
                if (dist2 < 0 and collision_ray_vertical(temp_radius, oy, dir, argument0) != noone)
                {
                    dist2 = oy;
                }
                
                // Calculate angle between sensors, if they have touched the solid
                if (dist1 > -1 and dist2 > -1)
                {
                    var x_int, y_int, sine, csine, x1, y1, x2, y2;
                    x_int = floor(x);
                    y_int = floor(y);
                    sine = dsin(dir);
                    csine = dcos(dir);
                    
                    x1 = x_int - (csine * temp_radius) + (sine * dist1);
                    y1 = y_int + (sine * temp_radius) + (csine * dist1);
                    x2 = x_int + (csine * temp_radius) + (sine * dist2);
                    y2 = y_int - (sine * temp_radius) + (csine * dist2);
                    
                    return angle_wrap(round(point_direction(x1, y1, x2, y2)));
                }
            }
        }
        /*var dir, x_int, y_int, sine, csine, x1, y1, x2, y2, left, right, total_solids, n, inst;

        // Initialize sensors:
        dir = floor(angle / 10) * 10;
        if (y_speed < 0) dir = argument1;

        x_int = floor(x);
        y_int = floor(y);
        sine = dsin(dir);
        csine = dcos(dir);

        x1 = x_int - (csine * temp_radius) + (sine * y_radius);
        y1 = y_int + (sine * temp_radius) + (csine * y_radius);
        x2 = x_int + (csine * temp_radius) + (sine * y_radius);
        y2 = y_int - (sine * temp_radius) + (csine * y_radius);

        left = noone;
        right = noone;
        total_solids = ds_list_size(solid_list);*/

        /* Scan below feet.
        If you have lots of steep surfaces, you'll want to increase the number of times the sensors are pushed down.
        36 seems to be good enough (at least that's what Harmony did iirc.) */
        /*repeat (y_radius * 2)
        {
            // Extend sensors downwards if they're not touching the ground:
            if (left == noone)
            {
                x1 += sine;
                y1 += csine;
            }
            if (right == noone)
            {
                x2 += sine;
                y2 += csine;
            }

            // Evaluate all solids:
            for (n = 0; n < total_solids; n += 1)
            {
                // Get the current solid:
                inst = ds_list_find_value(solid_list, n);

                // Get sensor heights:
                if (left == noone and collision_point(x1, y1, inst, true, false) != noone)
                {
                    left = inst;
                }
                if (right == noone and collision_point(x2, y2, inst, true, false) != noone)
                {
                    right = inst;
                }
            }

            // Calculate angle from sensors:
            if (left != noone and right != noone)
            {
                return angle_wrap(round(point_direction(x1, y1, x2, y2)));
            }
        }*/
        break;
    }
}

// Default:
return argument1;
