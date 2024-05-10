/// player_collision_prop(side, prop, [radius_x, radius_y, offset_x, offset_y])
/*
// Player coordinates:
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
var object_width, object_height, object_offset_x, object_offset_y;

if (argument_count >= 3) {
    object_width = argument[2];
} else {
    object_width = argument[1].prop_width;
}

if (argument_count >= 4) {
    object_height = argument[3];
} else {
    object_height = argument[1].prop_height;
}

if (argument_count >= 5) {
    object_offset_x = argument[4];
} else {
    object_offset_x = argument[1].prop_offset_x;
}

if (argument_count >= 6) {
    object_offset_y = argument[5];
} else {
    object_offset_y = argument[1].prop_offset_y;
}

// Object coordinates:
var ox1, oy1, ox2, oy2;

switch (argument[0]) {
    case SIDE_MAIN:
        ox1 = floor(argument[1].x) - object_width + object_offset_x;
        oy1 = floor(argument[1].y) - object_height + object_offset_y;
        ox2 = floor(argument[1].x) + object_width + object_offset_x;
        oy2 = floor(argument[1].y) + object_height +object_offset_y;
        break;

    case SIDE_LEFT:
        ox1 = floor(argument[1].x) - object_width + object_offset_x - 1;
        oy1 = floor(argument[1].y) - object_height + object_offset_y;
        ox2 = floor(argument[1].x);
        oy2 = floor(argument[1].y) + object_height + object_offset_y;
        break;

    case SIDE_RIGHT:
        ox1 = floor(argument[1].x);
        oy1 = floor(argument[1].y) - object_height + object_offset_y;
        ox2 = floor(argument[1].x) + object_width + object_offset_x + 1;
        oy2 = floor(argument[1].y) + object_height + object_offset_y;
        break;

    case SIDE_TOP:
        ox1 = floor(argument[1].x) - object_width + object_offset_x;
        oy1 = floor(argument[1].y) - object_height + object_offset_y - 1;
        ox2 = floor(argument[1].x) + object_width + object_offset_x;
        oy2 = floor(argument[1].y);
        break;

    case SIDE_BOTTOM:
        ox1 = floor(argument[1].x) - object_width + object_offset_x;
        oy1 = floor(argument[1].y);
        ox2 = floor(argument[1].x) + object_width + object_offset_x;
        oy2 = floor(argument[1].y) + object_height + object_offset_y + 1;
        break;
}

// Return collision:
return rectangle_in_rectangle(x1, y1, x2, y2, ox1, oy1, ox2, oy2);;
