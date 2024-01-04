/// player_get_angle(x, y, angle)
// Returns the surface angle at the given position & angle.
/*
var mask_temp, angle_temp, xPoint, yPoint;

// Store mask as a temporal variables:
mask_temp = mask_index;

// Switch mask:
mask_index = mask_dot;

// Limit the angle:
angle_temp = roundto_unbiased(argument2, 10);

// Set up sensors:
xPoint[0] = argument0 - dcos(angle_temp) * 4;
xPoint[1] = argument0 + dcos(angle_temp) * 4;

yPoint[0] = argument1 + dsin(angle_temp) * 4;
yPoint[1] = argument1 - dsin(angle_temp) * 4;

// Push down the sensors to find the angle:
repeat(25) {
    for(i = 0; i <= 1; i += 1) {
        if(!player_collision(floor(xPoint[i]), floor(yPoint[i]), collision_layer)) {
            xPoint[i] += dsin(angle_temp);
            yPoint[i] += dcos(angle_temp);
        }
    }
}

// Restore temporal mask:
mask_index = mask_temp;

// Return angle:
return floor(point_direction(xPoint[0], yPoint[0], xPoint[1], yPoint[1]));
