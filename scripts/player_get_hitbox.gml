/// player_get_hitbox(obj, [phase])
/* Returns a set of bit flags about the player and object's hitbox. */

var inst, hitbox, phase, temp;
var ax_int, ay_int, aleft, atop, aright, abottom, aoff_x, aoff_y, adir_x, adir_y, arot, ax1, ay1, ax2, ay2;
var bx_int, by_int, bleft, btop, bright, bbottom, boff_x, boff_y, bdir_x, bdir_y, brot, bx1, by1, bx2, by2;

inst = argument0;
hitbox = 0;
phase = 0;
if (argument_count > 1) phase = argument[1];

if (inst != noone)
{
    if (!inst.collision) return 0;
    
    // Initialize player:
    ax_int = floor(x);
    ay_int = floor(y);

    aleft = hurtbox_left;
    atop = hurtbox_top;
    aright = hurtbox_right;
    abottom = hurtbox_bottom;

    adir_x = image_xscale;
    adir_y = image_yscale;

    aoff_x = hurtbox_offset_x * adir_x;
    aoff_y = hurtbox_offset_y * adir_y;

    arot = mask_rotation;
    asine = dsin(arot);
    acsine = dcos(arot);

    // Initialize object:
    bx_int = floor(inst.x);
    by_int = floor(inst.y);

    bleft = inst.hurtbox_left;
    btop = inst.hurtbox_top;
    bright = inst.hurtbox_right;
    bbottom = inst.hurtbox_bottom;

    bdir_x = inst.image_xscale;
    bdir_y = inst.image_yscale;

    boff_x = inst.hurtbox_offset_x * bdir_x;
    boff_y = inst.hurtbox_offset_y * bdir_y;

    brot = inst.gravity_direction;
    bsine = dsin(brot);
    bcsine = dcos(brot);

    // Swap to object's attackbox:
    if (phase == 1 || phase == 3)
    {
        bleft = inst.attackbox_left;
        btop = inst.attackbox_top;
        bright = inst.attackbox_right;
        bbottom = inst.attackbox_bottom;

        boff_x = inst.attackbox_offset_x * bdir_x;
        boff_y = inst.attackbox_offset_y * bdir_y;
    }

    // Swap to player's attackbox:
    if (phase == 2 || phase == 3)
    {
        aleft = attackbox_left;
        atop = attackbox_top;
        aright = attackbox_right;
        abottom = attackbox_bottom;

        aoff_x = attackbox_offset_x * adir_x;
        aoff_y = attackbox_offset_y * adir_y;
    }

    // Check object collision:
    if !(bleft == 0 && btop == 0 && bright == 0 && bbottom == 0)
    {
        // Flip:
        if (bdir_x == -1)
        {
            temp = bleft;
            bleft = bright;
            bright = temp;
        }

        if (bdir_y == -1)
        {
            temp = btop;
            btop = bbottom;
            bbottom = temp;
        }

        bx1 = bx_int - (bcsine * bleft) + (bcsine * boff_x) - (bsine * btop) + (bsine * boff_y);
        by1 = by_int + (bsine * bright) + (bsine * boff_x) - (bcsine * btop) + (bcsine * boff_y);
        bx2 = bx_int + (bcsine * bright) + (bcsine * boff_x) + (bsine * bbottom) + (bsine * boff_y);
        by2 = by_int - (bsine * bleft) - (bsine * boff_x) + (bcsine * bbottom) + (bcsine * boff_y);

        if !(aleft == 0 && atop == 0 && aright == 0 && abottom == 0)
        {
            // Flip:
            if (adir_x == -1)
            {
                temp = aleft;
                aleft = aright
                aright = temp;
            }

            if (adir_y == -1)
            {
                temp = atop;
                atop = abottom;
                abottom = temp;
            }

            ax1 = ax_int - (acsine * aleft) + (acsine * aoff_x) - (asine * atop) + (asine * aoff_y);
            ay1 = ay_int - (asine * aright) + (asine * aoff_x) - (acsine * atop) + (acsine * aoff_y);
            ax2 = ax_int + (acsine * aright) + (acsine * aoff_x) + (asine * abottom) + (asine * aoff_y);
            ay2 = ay_int + (asine * aleft) - (asine * aoff_x) + (acsine * abottom) + (acsine * aoff_y);

            if (rectangle_in_rectangle(ax1, ay1, ax2, ay2, bx1, by1, bx2, by2)) hitbox |= pick(phase, HIT_COLLISION, HIT_HURT, HIT_ATTACK, HIT_CLASH);
        }
    }
}

if (phase == 0) return (hitbox | player_get_hitbox(argument0, 1) | player_get_hitbox(argument0, 2) | player_get_hitbox(argument0, 3));
return hitbox;