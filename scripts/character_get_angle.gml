/// character_get_angle(x, y, angle)
// Returns the surface angle at the given position & angle.

var mask_temp, xPoint, yPoint;

// Store mask as a temporal variables:
mask_temp = mask_index;

// Switch mask:
mask_index = mask_dot;

// Limit the angle:
argument2 = round(argument2 / 10) * 10;

// Set up sensors:
xPoint[0] = argument0 - dcos(argument2) * 7;
xPoint[1] = argument0 + dcos(argument2) * 7;

yPoint[0] = argument1 + dsin(argument2) * 7;
yPoint[1] = argument1 - dsin(argument2) * 7;

// Push down the sensors to find the angle:
repeat(25) {
    if(!character_collision(floor(xPoint[0]), floor(yPoint[0]), collision_layer)) {
        xPoint[0] += dsin(argument2);
        yPoint[0] += dcos(argument2);
    }

    if(!character_collision(floor(xPoint[1]), floor(yPoint[1]), collision_layer)) {
        xPoint[1] += dsin(argument2);
        yPoint[1] += dcos(argument2);
    }
}

// Restore temporal mask:
mask_index = mask_temp;

// Return angle:
return floor(point_direction(xPoint[0], yPoint[0], xPoint[1], yPoint[1]));
