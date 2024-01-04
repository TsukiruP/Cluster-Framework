/// player_collision_object(side, obj)

var left, top, right, bottom, i, collision_test;

switch(argument0) {
    case SIDE_MAIN:
        left   = -wall_width;
        top    = -hitbox_height;
        right  =  wall_width;
        bottom =  hitbox_height;
        break;

    case SIDE_LEFT:
        left   = -wall_width - 1;
        top    = -hitbox_height;
        right  =  0;
        bottom =  hitbox_height;
        break;

    case SIDE_RIGHT:
        left   =  0;
        top    = -hitbox_height;
        right  =  wall_width + 1;
        bottom =  hitbox_height;
        break;

    case SIDE_TOP:
        left   = -wall_width;
        top    = -hitbox_height - 1;
        right  =  wall_width;
        bottom =  0;
        break;

    case SIDE_TOP_EXT:
        left   = -wall_width;
        top    = -hitbox_height - 16;
        right  =  wall_width;
        bottom =  0;
        break;

    case SIDE_BOTTOM:
        left   = -wall_width;
        top    =  0;
        right  =  wall_width;
        bottom =  hitbox_height + 1;
        break;

    case SIDE_BOTTOM_EXT:
        left   = -wall_width;
        top    =  0;
        right  =  wall_width;
        bottom =  hitbox_height + 16;
        break;

}

// Collision test:
collision_test = collision_rectangle(floor(x) + left, floor(y) + top, floor(x) + right, floor(y) + bottom, argument1, true, true);

return collision_test;
