/// draw_collision(left, top, right, bottom, xoffset, yoffset, angle, color)
/* Draws a rectangular outline that flips and rotates accordingly. */

var x_int, y_int, left, top, right, bottom, off_x, off_y, dir, rot, x1, y1, x2, y2;

x_int = floor(x);
y_int = floor(y);

left = argument0;
top = argument1;
right = argument2;
bottom = argument3;

dir_x = image_xscale;
dir_y = image_yscale;

off_x = argument4 * dir_x;
off_y = argument5 * dir_y;

rot = round(argument7 / 90) * 90;
sine = dsin(rot);
csine = dcos(rot);

// Flip:
if (dir_x == -1)
{
    var temp;

    temp = left;
    left = right;
    right = temp;
}

if (dir_y == -1)
{
    var temp;

    temp = top;
    top = bottom;
    bottom = temp;
}

if !(left == 0 && top == 0 && right == 0 && bottom == 0)
{
    x1 = x_int - (csine * left) + (csine * off_x) - (sine * top) + (sine * off_y);
    y1 = y_int - (csine * top) + (csine * off_y) - (sine * right) - (sine * off_x);
    x2 = x_int + (csine * right) + (csine * off_x) + (sine * bottom) + (sine * off_y);
    y2 = y_int + (csine * bottom) + (csine * off_y) + (sine * left) - (sine * off_x);

    draw_rectangle_color(x1, y1, x2, y2, argument8, argument8, argument8, argument8, true);
}
