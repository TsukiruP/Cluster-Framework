/// player_collision_prop(prop, side, [type, prop_left, prop_right, prop_top, prop_bottom])

// Collision type:
var type, left, right, top, bottom, offset_x, offset_y;

if (argument_count >= 3) type = argument[2];
else type = 0;

switch (type) {
    // Hurtbox:
    case 1:
        left     = hurtbox_left;
        right    = hurtbox_right;
        top      = hurtbox_top;
        bottom   = hurtbox_bottom;
        offset_x = hurtbox_offset_x;
        offset_y = hurtbox_offset_y;
        break;

    // Hitbox:
    case 2:
        left     = hitbox_left;
        right    = hitbox_right;
        top      = hitbox_top;
        bottom   = hitbox_bottom;
        offset_x = hitbox_offset_x;
        offset_y = hitbox_offset_y;
        break;

    // Main:
    default:
        left     = main_left;
        right    = main_right;
        top      = main_top;
        bottom   = main_bottom;
        offset_x = 0;
        offset_y = 0;
}

// Player collision:
var x1, y1, x2, y2;

switch (mode) {
    case 0:
        x1 = floor(x) - ((left + offset_x) * animation_direction);
        y1 = floor(y) - top + offset_y;
        x2 = floor(x) + ((right + offset_x) * animation_direction);
        y2 = floor(y) + bottom + offset_y;
        break;

    case 1:
        x1 = floor(x) - top + offset_y;
        y1 = floor(y) - ((right + offset_x) * animation_direction);
        x2 = floor(x) + bottom + offset_y;
        y2 = floor(y) + ((left + offset_x) * animation_direction);
        break;

    case 2:
        x1 = floor(x) - ((right + offset_x) * animation_direction);
        y1 = floor(y) - bottom + offset_y;
        x2 = floor(x) + ((left + offset_x) * animation_direction);
        y2 = floor(y) + top + offset_y;
        break;

    case 3:
        x1 = floor(x) - bottom + offset_y;
        y1 = floor(y) - ((left + offset_x) * animation_direction);
        x2 = floor(x) + top + offset_y;
        y2 = floor(y) + ((right + offset_x) * animation_direction);
        break;
}

// Prop collision:
var o_left, o_right, o_top, o_bottom, o_offset_x, o_offset_y;

if (argument_count >= 4) o_left = argument[3];
else o_left = argument[0].main_left;

if (argument_count >= 5) o_right = argument[4];
else o_right = argument[0].main_right;

if (argument_count >= 6) o_top = argument[5];
else o_top = argument[0].main_top;

if (argument_count >= 7) o_bottom = argument[6];
else o_bottom = argument[0].main_bottom;

if (argument_count >= 8) o_offset_x = argument[7];
else o_offset_x = argument[0].main_offset_x;

if (argument_count >= 9) o_offset_y = argument[8];
else o_offset_y = argument[0].main_offset_y;

var ox1, oy1, ox2, oy2;

switch (argument[1]) {
    case SIDE_MAIN:
        ox1 = floor(argument[0].x) - o_left + o_offset_x;
        oy1 = floor(argument[0].y) - o_top + o_offset_y;
        ox2 = floor(argument[0].x) + o_right + o_offset_x;
        oy2 = floor(argument[0].y) + o_bottom + o_offset_y;
        break;

    case SIDE_LEFT:
        ox1 = floor(argument[0].x) - o_left + o_offset_x - 1;
        oy1 = floor(argument[0].y) - o_top + o_offset_y;
        ox2 = floor(argument[0].x);
        oy2 = floor(argument[0].y) + o_bottom + o_offset_y;
        break;

    case SIDE_RIGHT:
        ox1 = floor(argument[0].x);
        oy1 = floor(argument[0].y) - o_top + o_offset_y;
        ox2 = floor(argument[0].x) + o_right + o_offset_x + 1;
        oy2 = floor(argument[0].y) + o_bottom + o_offset_y;
        break;

    case SIDE_TOP:
        ox1 = floor(argument[0].x) - o_left + o_offset_x;
        oy1 = floor(argument[0].y) - o_top + o_offset_y - 1;
        ox2 = floor(argument[0].x) + o_right + o_offset_x;
        oy2 = floor(argument[0].y);
        break;

    case SIDE_BOTTOM:
        ox1 = floor(argument[0].x) - o_left + o_offset_x;
        oy1 = floor(argument[0].y);
        ox2 = floor(argument[0].x) + o_right + o_offset_x;
        oy2 = floor(argument[0].y) + o_bottom + o_offset_y + 1;
        break;
}

// Return collision:
return rectangle_in_rectangle(x1, y1, x2, y2, ox1, oy1, ox2, oy2);;

/*
// Player coordinates:
var x1, y1, x2, y2;

switch (mode) {
    case 0:
        x1 = floor(x) - (main_left * animation_direction);
        y1 = floor(y) - main_top;
        x2 = floor(x) + (main_right * animation_direction);
        y2 = floor(y) + main_bottom;
        break;

    case 1:
        x1 = floor(x) - main_top;
        y1 = floor(y) - (main_right * animation_direction);
        x2 = floor(x) + main_bottom;
        y2 = floor(y) + (main_left * animation_direction);
        break;

    case 2:
        x1 = floor(x) - (main_right * animation_direction);
        y1 = floor(y) - main_bottom;
        x2 = floor(x) + (main_left * animation_direction);
        y2 = floor(y) + main_top;
        break;

    case 3:
        x1 = floor(x) - main_bottom;
        y1 = floor(y) - (main_left * animation_direction);
        x2 = floor(x) + main_top;
        y2 = floor(y) + (main_right * animation_direction);
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
