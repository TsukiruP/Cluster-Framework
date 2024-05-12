/// player_rectangle_check(radius_x, radius_y, offset_x, offset_y, prop)
/*
// Exit if collision is disabled:
if (collision_allow == false) exit;

// Return false if either radius is set to 0:
if (argument0 == 0 || argument1 == 0) return noone;

// Set up arguments:
var x1, y1, x2, y2;

switch (mode) {
    case 0:
        x1 = floor(x) - argument0 + (argument2 * animation_direction);
        y1 = floor(y) - argument1 + argument3;
        x2 = floor(x) + argument0 + (argument2 * animation_direction);
        y2 = floor(y) + argument1 + argument3;
        break;

    case 1:
        x1 = floor(x) - argument1 + argument3;
        y1 = floor(y) - argument0 - (argument2 * animation_direction);
        x2 = floor(x) + argument1 + argument3;
        y2 = floor(y) + argument0 - (argument2 * animation_direction);
        break;

    case 2:
        x1 = floor(x) - argument0 - (argument2 * animation_direction);
        y1 = floor(y) - argument1 - argument3;
        x2 = floor(x) + argument0 - (argument2 * animation_direction);
        y2 = floor(y) + argument1 - argument3;
        break;

    case 3:
        x1 = floor(x) - argument1 - argument3;
        y1 = floor(y) - argument0 + (argument2 * animation_direction);
        x2 = floor(x) + argument1 - argument3;
        y2 = floor(y) + argument0 + (argument2 * animation_direction);
        break;
}

// Set up prop data:
ox1 = floor(argument4.x) - argument4.prop_width + argument4.prop_offset_x;
oy1 = floor(argument4.y) - argument4.prop_height + argument4.prop_offset_y;
ox2 = floor(argument4.x) + argument4.prop_width + argument4.prop_offset_x;
oy2 = floor(argument4.y) + argument4.prop_height + argument4.prop_offset_y;

// Return collision:
return rectangle_in_rectangle(x1, y1, x2, y2, ox1, oy1, ox2, oy2);
