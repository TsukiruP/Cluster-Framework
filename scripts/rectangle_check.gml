/// rectangle_check(offset_x, offset_y, radius_x, radius_y, obj)

// Exit if collision is disabled:
if (collision_allow == false) exit;

// Set up arguments:
var x1, y1, x2, y2;

switch (mode) {
    case 0:
        x1 = floor(x) + argument0 - argument2;
        y1 = floor(y) + argument1 - argument3;
        x2 = floor(x) + argument0 + argument2;
        y2 = floor(y) + argument1 + argument3;
        break;

    case 1:
        x1 = floor(x) + argument1 - argument3;
        y1 = floor(y) - argument0 - argument2;
        x2 = floor(x) + argument1 + argument3;
        y2 = floor(y) - argument0 + argument2;
        break;

    case 2:
        x1 = floor(x) - argument0 - argument2;
        y1 = floor(y) - argument1 - argument3;
        x2 = floor(x) - argument0 + argument2;
        y2 = floor(y) - argument1 + argument3;
        break;

    case 3:
        x1 = floor(x) - argument1 - argument3;
        y1 = floor(y) + argument0 - argument2;
        x2 = floor(x) - argument1 + argument3;
        y2 = floor(y) + argument0 + argument2;
        break;
}

// Trigger the collision:
return collision_rectangle(x1, y1, x2, y2, argument4, true, true);
