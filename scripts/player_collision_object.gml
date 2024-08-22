/// player_collision_object(obj, [phase])
// Returns whether the player is colliding with an object.

var ax_int, ay_int, aleft, atop, aright, abottom, aoff_x, aoff_y, adir, arot, ax1, ay1, ax2, ay2;
var object_handle, bx_int, by_int, bleft, btop, bright, bbottom, boff_x, boff_y, bdir, brot, bx1, by1, bx2, by2;
var phase, collision;

object_handle = argument0;
phase         = 0;
collision     = 0;

// Hitbox flag:
if (argument_count >= 2) {
    phase = argument[1];
}

if (object_handle != noone) {
    // Initialize player:
    ax_int  = floor(x);
    ay_int  = floor(y);

    aleft   = hitbox_left;
    atop    = hitbox_top;
    aright  = hitbox_right;
    abottom = hitbox_bottom;

    aoff_x  = hitbox_offset_x * image_xscale;
    aoff_y  = hitbox_offset_y;

    adir    = image_xscale;
    arot    = mask_rotation;

    // Initialize object:
    bx_int  = floor(object_handle.x);
    by_int  = floor(object_handle.y);

    bleft   = object_handle.hurtbox_left;
    btop    = object_handle.hurtbox_top;
    bright  = object_handle.hurtbox_right;
    bbottom = object_handle.hurtbox_bottom;

    boff_x  = object_handle.hurtbox_offset_x * object_handle.image_xscale;
    boff_y  = object_handle.hurtbox_offset_y;

    bdir    = object_handle.image_xscale;
    brot    = gravity_angle(object_handle);

    if (phase == 1) {
        // Swap to player hurtbox values:
        aleft   = hurtbox_left;
        atop    = hurtbox_top;
        aright  = hurtbox_right;
        abottom = hurtbox_bottom;

        aoff_x  = hurtbox_offset_x * image_xscale;
        aoff_y  = hurtbox_offset_y;

        // Swap to object hitbox values:
        bleft   = object_handle.hitbox_left;
        btop    = object_handle.hitbox_top;
        bright  = object_handle.hitbox_right;
        bbottom = object_handle.hitbox_bottom;

        boff_x  = object_handle.hitbox_offset_x * object_handle.image_xscale;
        boff_y  = object_handle.hitbox_offset_y;
    }

    // Check object collision:
    if !(bleft == 0 && btop == 0 && bright == 0 && bbottom == 0) {
        // Flip object direction:
        if (bdir == -1) {
            var temp;

            temp    = bleft;
            bleft  = bright;
            bright = temp;
        }

        // Rotate object:
        switch (brot) {
            // Down:
            case 0:
                bx1 = bx_int - bleft + boff_x;
                by1 = by_int - btop + boff_y;
                bx2 = bx_int + bright + boff_x;
                by2 = by_int + bbottom + boff_y;
                break;

            // Right:
            case 90:
                bx1 = bx_int - btop + boff_y;
                by1 = by_int - bright - boff_x;
                bx2 = bx_int + bbottom + boff_y;
                by2 = by_int + bleft - boff_x;
                break;

            // Up:
            case 180:
                bx1 = bx_int - bright - boff_x;
                by1 = by_int - bbottom - boff_y;
                bx2 = bx_int + bleft - boff_x;
                by2 = by_int + btop - boff_y;
                break;

            // Left:
            case 270:
                bx1 = bx_int - bbottom - boff_y;
                by1 = by_int - bleft + boff_x;
                bx2 = bx_int + btop - boff_y;
                by2 = by_int + bright + boff_x;
                break;
        }

        if !(aleft == 0 && atop == 0 && aright == 0 && abottom == 0) {
            // Flip player direction:
            if (adir == -1) {
                var temp;

                temp   = aleft;
                aleft  = aright
                aright = temp;
            }

            // Rotate player:
            switch (arot) {
                // Down:
                case 0:
                    ax1 = ax_int - aleft + aoff_x;
                    ay1 = ay_int - atop + aoff_y;
                    ax2 = ax_int + aright + aoff_x;
                    ay2 = ay_int + abottom + aoff_y;
                    break;

                // Right:
                case 90:
                    ax1 = ax_int - atop + aoff_y;
                    ay1 = ay_int - aright - aoff_x;
                    ax2 = ax_int + abottom + aoff_y;
                    ay2 = ay_int + aleft - aoff_x;
                    break;

                // Up:
                case 180:
                    ax1 = ax_int - aright - aoff_x;
                    ay1 = ay_int - abottom - aoff_y;
                    ax2 = ax_int + aleft - aoff_x;
                    ay2 = ay_int + atop - aoff_y;
                    break;

                // Left:
                case 270:
                    ax1 = ax_int - abottom - aoff_y;
                    ay1 = ay_int - aleft + aoff_x;
                    ax2 = ax_int + atop - aoff_y;
                    ay2 = ay_int + aright + aoff_x;
                    break;
            }

            // Special collision:
            if (rectangle_in_rectangle(ax1, ay1, ax2, ay2, bx1, by1, bx2, by2)) {
                if (phase == 1) {
                    collision |= COLL_HIT;
                } else {
                    collision |= COLL_HURT;
                }
            }
        }

        // Radius collision:
        var upright;

        upright = (arot mod 180 == 0);

        if ((upright == true && rectangle_in_rectangle(ax_int - x_radius, ay_int - y_radius, ax_int + x_radius, ay_int + y_radius, bx1, by1, bx2, by2)) ||
            (upright == false && rectangle_in_rectangle(ax_int - y_radius, ay_int - x_radius, ax_int + y_radius, ay_int + x_radius, bx1, by1, bx2, by2))) {

            // We've hit the object's hitbox:
            if (phase == 1) {
                collision |= COLL_HIT_RADIUS;
            }

            // We've hit the object's hurtbox:
            else {
                collision |= COLL_HURT_RADIUS;
            }

        }
    }
}

// Failure OR move to next phase:
if (phase == 0) {
    return collision | player_collision_object(argument0, 1);
} else {
    return collision;
}
