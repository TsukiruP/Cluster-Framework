/// hurtbox_set(left, top, right, bottom, [xoffset, yoffset])
/* Sets the calling instance's hurtbox. */

var left, top, right, bottom, off_x, off_y;

left = 0;
top = 0;
right = 0;
bottom = 0;

off_x = 0;
off_y = 0;

if (argument_count > 3)
{
    left = argument[0];
    top = argument[1];
    right = argument[2];
    bottom = argument[3];

    if (argument_count > 4) off_x = argument[4];
    if (argument_count > 5) off_y = argument[5];
}

hurtbox_left = left;
hurtbox_top = top;
hurtbox_right = right;
hurtbox_bottom = bottom;

hurtbox_offset_x = off_x;
hurtbox_offset_y = off_y;
