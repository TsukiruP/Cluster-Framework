/// player_collision_object(side, obj)

// Player data:
var x1, y1, x2, y2;
switch (mode) {
    case 0:
        x1 = floor(x) - main_width;
        y1 = floor(y) - main_height;
        x2 = floor(x) + main_width;
        y2 = floor(y) + main_height;
        break;

    case 1:
        x1 = floor(x) - main_height;
        y1 = floor(y) - main_width;
        x2 = floor(x) + main_height;
        y2 = floor(y) + main_width;
        break;

    case 2:
        x1 = floor(x) - main_width;
        y1 = floor(y) - main_height;
        x2 = floor(x) + main_width;
        y2 = floor(y) + main_height;
        break;

    case 3:
        x1 = floor(x) - main_height;
        y1 = floor(y) - main_width;
        x2 = floor(x) + main_height;
        y2 = floor(y) + main_width;
        break;
}

// Object data:
switch (argument0) {
    case SIDE_MAIN:
        ox1 = floor(argument1.x) - argument1.prop_width + argument1.prop_offset_x;
        oy1 = floor(argument1.y) - argument1.prop_height + argument1.prop_offset_y;
        ox2 = floor(argument1.x) + argument1.prop_width + argument1.prop_offset_x;
        oy2 = floor(argument1.y) + argument1.prop_height + argument1.prop_offset_y;
        break;

    case SIDE_LEFT:
        ox1 = floor(argument1.x) - argument1.prop_width + argument1.prop_offset_x - 1;
        oy1 = floor(argument1.y) - argument1.prop_height + argument1.prop_offset_y;
        ox2 = floor(argument1.x);
        oy2 = floor(argument1.y) + argument1.prop_height + argument1.prop_offset_y;
        break;

    case SIDE_RIGHT:
        ox1 = floor(argument1.x);
        oy1 = floor(argument1.y) - argument1.prop_height + argument1.prop_offset_y;
        ox2 = floor(argument1.x) + argument1.prop_width + argument1.prop_offset_x + 1;
        oy2 = floor(argument1.y) + argument1.prop_height + argument1.prop_offset_y;
        break;

    case SIDE_TOP:
        ox1 = floor(argument1.x) - argument1.prop_width + argument1.prop_offset_x;
        oy1 = floor(argument1.y) - argument1.prop_height + argument1.prop_offset_y - 1;
        ox2 = floor(argument1.x) + argument1.prop_width + argument1.prop_offset_x;
        oy2 = floor(argument1.y);
        break;

    case SIDE_BOTTOM:
        ox1 = floor(argument1.x) - argument1.prop_width + argument1.prop_offset_x;
        oy1 = floor(argument1.y);
        ox2 = floor(argument1.x) + argument1.prop_width + argument1.prop_offset_x;
        oy2 = floor(argument1.y) + argument1.prop_height + argument1.prop_offset_y + 1;
        break;
}

// Collision test:
collision_test = rectangle_in_rectangle(x1, y1, x2, y2, ox1, oy1, ox2, oy2);

return collision_test;
