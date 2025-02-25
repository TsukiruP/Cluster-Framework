/// player_get_angle(obj, rot)
/// @desc  Calculates the angle of the given solid using its image && collision data.
/// @param {object} obj
/// @param {number} rot
/// @returns {number}

var _obj; _obj = argument0;
var _rot; _rot = argument1;

var x1, y1, x2, y2;

with (_obj)
{
    var kind; kind = shape;
    var normal; normal = surface_angle;
    var xscale; xscale = sign(image_xscale);
    var yscale; yscale = sign(image_yscale);
    var left_side; left_side = bbox_left;
    var right_side; right_side = bbox_right + 1;
    var top_side; top_side = bbox_top;
    var bottom_side; bottom_side = bbox_bottom + 1;
}

/// Custom shape:
if (kind == SHP_CUSTOM)
{
    var x_int; x_int = floor(x);
    var y_int; y_int = floor(y);
    var sine; sine = dsin(_rot);
    var csine; csine = dcos(_rot);

    x1 = x_int - (csine * x_radius) + (sine * y_radius);
    y1 = y_int + (sine * x_radius) + (csine * y_radius);
    x2 = x_int + (csine * x_radius) + (sine * y_radius);
    y2 = y_int - (sine * x_radius) + (csine * y_radius);

    var height; height = (y_radius * 2) + 1;
    var left; left = false;
    var right; right = false;

    /* AUTHOR NOTE: the height used to push the sensors down is dependent on that used to record instances local to the player in the "player_get_stage_objects" function.
    Currently, the maximum height sits at triple the player's vertical radius, plus 1 (same as SonicForGMS.) The sensors initially set at the player's feet and then get pushed down
    a number of times equal to double the player's vertical radius, plus 1.
    If you want to change the height at which the sensors are pushed, you must make sure it matches that in the "player_get_stage_objects" function. */

    // Push sensors downward until they have found the solid:
    repeat (height)
    {
        // Evaluate all solids:
        for ({var n; n = ds_list_size(solid_list) - 1}; n > -1; n -= 1)
        {
            // Get the current solid:
            var inst; inst = ds_list_find_value(solid_list, n);
            
            // Check if each sensor has found the solid:
            if (!left && collision_point(x1, y1, inst, true, false) != noone) left = true;
            if (!right && collision_point(x2, y2, inst, true, false) != noone) right = true;
        }
        
        // Calculate the direction from left to right, if applicable:
        if (left && right) return (point_direction(x1, y1, x2, y2) div 1);
        
        // Otherwise, push the sensors down:
        if (!left)
        {
            x1 += sine;
            y1 += csine;
        }
        
        if (!right)
        {
            x2 += sine;
            y2 += csine;
        }
    }
}
else if (!(kind == SHP_RECTANGLE && normal == -1)) // Ignore for flat rectangles (NOTE: if you want to hard-code the normal, the shape assigned MUST be a rectangle because of this.)
{
    // Default when on a flat side of the solid:
    if ((_rot == 0 && yscale == -1) || (_rot == 90 && xscale == -1) ||
        (_rot == 180 && yscale == 1) || (_rot == 270 && xscale == 1)) return _rot;
    
    // Default if out of the solid's bounds:
    if (_rot mod 180 != 0)
    {
        if (yscale == -1 && y - x_radius < top_side) return _rot;
        if (yscale == 1 && y + x_radius > bottom_side) return _rot;

        if (kind == SHP_QUARTER_PIPE)
        {
            if (yscale == 1 && y + y_radius < top_side) return _rot;
            if (yscale == -1 && y - y_radius > bottom_side) return _rot;
        }
    }
    else
    {
        if (xscale == -1 && x - x_radius < left_side) return _rot;
        if (xscale == 1 && x + x_radius > right_side) return _rot;

        if (kind == SHP_QUARTER_PIPE)
        {
            if (yscale == 1 && y + y_radius < top_side) return _rot;
            if (yscale == -1 && y - y_radius > bottom_side) return _rot;
        }
    }

    // Return solid's angle if it's hard coded:
    if (normal != -1) return normal;

    // Calculate based off shape:
    if (kind == SHP_RIGHT_TRIANGLE)
    {
        x1 = left_side;
        y1 = bottom_side;
        x2 = right_side;
        y2 = top_side;

        if (yscale == -1)
        {
            x1 = right_side;
            x2 = left_side;
        }

        if (xscale == -1)
        {
            y1 = top_side;
            y2 = bottom_side;
        }

        // Return hypotenuse:
        return (point_direction(x1, y1, x2, y2) div 1);
    }
    else
    {
        // Get ellipse/pipe center:
        if (kind == SHP_QUARTER_ELLIPSE ^^ xscale == 1) x1 = left_side;
        else x1 = right_side;

        if (kind == SHP_QUARTER_ELLIPSE ^^ yscale == 1) y1 = top_side;
        else y1 = bottom_side;

        // Player's position clamped to the ellipse:
        x2 = clamp(x, left_side, right_side);
        y2 = clamp(y, top_side, bottom_side);
        
        // Direction from the player to the ellipse/pipe center:
        var dir; dir = point_direction(x1, y1, x2, y2);
        
        if (kind == SHP_QUARTER_ELLIPSE) dir = point_direction(x2, y2, x1, y1);
        return (((dir div 1) + 90) mod 360);
    }
}

return _rot;
