/// player_collision_prop(prop, side, [pl_type, pr_hitbox])

// Collision type:
var pl_type, pl_left, pl_right, pl_top, pl_bottom, pl_offset_x, pl_offset_y;

if (argument_count >= 3) pl_type = argument[2];
else pl_type = 0;

switch (pl_type) {
    // Hurtbox:
    case 1:
        pl_left     = hurtbox_left;
        pl_right    = hurtbox_right;
        pl_top      = hurtbox_top;
        pl_bottom   = hurtbox_bottom;

        pl_offset_x = hurtbox_offset_x;
        pl_offset_y = hurtbox_offset_y;
        break;

    // Hitbox:
    case 2:
        pl_left     = hitbox_left;
        pl_right    = hitbox_right;
        pl_top      = hitbox_top;
        pl_bottom   = hitbox_bottom;

        pl_offset_x = hitbox_offset_x;
        pl_offset_y = hitbox_offset_y;
        break;

    // Main:
    default:
        pl_left     = main_left;
        pl_right    = main_right;
        pl_top      = main_top;
        pl_bottom   = main_bottom;

        pl_offset_x = 0;
        pl_offset_y = 0;
}

// Player collision:
var pl_x1, pl_y1, pl_x2, pl_y2;

switch (mode) {
    case 0:
        pl_x1 = floor(x) - ((pl_left + pl_offset_x) * animation_direction);
        pl_y1 = floor(y) - pl_top + pl_offset_y;
        pl_x2 = floor(x) + ((pl_right + pl_offset_x) * animation_direction);
        pl_y2 = floor(y) + pl_bottom + pl_offset_y;
        break;

    case 1:
        pl_x1 = floor(x) - pl_top + pl_offset_y;
        pl_y1 = floor(y) - ((pl_right + pl_offset_x) * animation_direction);
        pl_x2 = floor(x) + pl_bottom + pl_offset_y;
        pl_y2 = floor(y) + ((pl_left + pl_offset_x) * animation_direction);
        break;

    case 2:
        pl_x1 = floor(x) - ((pl_right + pl_offset_x) * animation_direction);
        pl_y1 = floor(y) - pl_bottom + pl_offset_y;
        pl_x2 = floor(x) + ((pl_left + pl_offset_x) * animation_direction);
        pl_y2 = floor(y) + pl_top + pl_offset_y;
        break;

    case 3:
        pl_x1 = floor(x) - pl_bottom + pl_offset_y;
        pl_y1 = floor(y) - ((pl_left + pl_offset_x) * animation_direction);
        pl_x2 = floor(x) + pl_top + pl_offset_y;
        pl_y2 = floor(y) + ((pl_right + pl_offset_x) * animation_direction);
        break;
}

// Prop collision:
var pr_hitbox, pr_left, pr_right, pr_top, pr_bottom, pr_offset_x, pr_offset_y;

if (argument_count >= 4) pr_hitbox = argument[3];
else pr_hitbox = false;

if (pr_hitbox == true) {
    pr_left     = argument[0].hitbox_left;
    pr_right    = argument[0].hitbox_right;
    pr_top      = argument[0].hitbox_top;
    pr_bottom   = argument[0].hitbox_bottom;

    pr_offset_x = argument[0].hitbox_offset_x;
    pr_offset_y = argument[0].hitbox_offset_y;
} else {
    pr_left     = argument[0].main_left;
    pr_right    = argument[0].main_right;
    pr_top      = argument[0].main_top;
    pr_bottom   = argument[0].main_bottom;

    pr_offset_x = argument[0].main_offset_x;
    pr_offset_y = argument[0].main_offset_y;
}

var pr_x1, pr_y1, pr_x2, pr_y2;

switch (argument[1]) {
    case SIDE_MAIN:
        pr_x1 = floor(argument[0].x) - pr_left + pr_offset_x;
        pr_y1 = floor(argument[0].y) - pr_top + pr_offset_y;
        pr_x2 = floor(argument[0].x) + pr_right + pr_offset_x;
        pr_y2 = floor(argument[0].y) + pr_bottom + pr_offset_y;
        break;

    case SIDE_LEFT:
        pr_x1 = floor(argument[0].x) - pr_left + pr_offset_x - 1;
        pr_y1 = floor(argument[0].y) - pr_top + pr_offset_y;
        pr_x2 = floor(argument[0].x);
        pr_y2 = floor(argument[0].y) + pr_bottom + pr_offset_y;
        break;

    case SIDE_RIGHT:
        pr_x1 = floor(argument[0].x);
        pr_y1 = floor(argument[0].y) - pr_top + pr_offset_y;
        pr_x2 = floor(argument[0].x) + pr_right + pr_offset_x + 1;
        pr_y2 = floor(argument[0].y) + pr_bottom + pr_offset_y;
        break;

    case SIDE_TOP:
        pr_x1 = floor(argument[0].x) - pr_left + pr_offset_x;
        pr_y1 = floor(argument[0].y) - pr_top + pr_offset_y - 1;
        pr_x2 = floor(argument[0].x) + pr_right + pr_offset_x;
        pr_y2 = floor(argument[0].y);
        break;

    case SIDE_BOTTOM:
        pr_x1 = floor(argument[0].x) - pr_left + pr_offset_x;
        pr_y1 = floor(argument[0].y);
        pr_x2 = floor(argument[0].x) + pr_right + pr_offset_x;
        pr_y2 = floor(argument[0].y) + pr_bottom + pr_offset_y + 1;
        break;
}

// Return collision:
return rectangle_in_rectangle(pl_x1, pl_y1, pl_x2, pl_y2, pr_x1, pr_y1, pr_x2, pr_y2);
