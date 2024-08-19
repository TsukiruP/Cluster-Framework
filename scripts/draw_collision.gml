/// draw_collision(left, top, right, bottom, x offset, y offset, direction, angle, color)
//

var x_int, y_int, left, top, right, bottom, off_x, off_y, dir, rot, x1, y1, x2, y2;

// Initialize:
x_int  = floor(x);
y_int  = floor(y);

left   = argument0;
top    = argument1;
right  = argument2;
bottom = argument3;

off_x  = argument4 * argument6;
off_y  = argument5;

dir    = argument6;
rot    = round(argument7 / 90) * 90;

// Flip direction:
if (dir == -1) {
    var temp;

    temp  = left;
    left  = right;
    right = temp;
}

// Set coordinates:
switch (rot) {
    // Down:
    case 0:
        x1 = x_int - left + off_x;
        y1 = y_int - top + off_y;
        x2 = x_int + right + off_x;
        y2 = y_int + bottom + off_y;
        break;

    // Right:
    case 90:
        x1 = x_int - top + off_y;
        y1 = y_int - right - off_x;
        x2 = x_int + bottom + off_y;
        y2 = y_int + left - off_x;
        break;

    // Up:
    case 180:
        x1 = x_int - right - off_x;
        y1 = y_int - bottom - off_y;
        x2 = x_int + left - off_x;
        y2 = y_int + top - off_y;
        break;

    // Left:
    case 270:
        x1 = x_int - bottom - off_y;
        y1 = y_int - left + off_x;
        x2 = x_int + top - off_y;
        y2 = y_int + right + off_x;
        break;
}

// Draw rectangle:
if !(left == 0 && top == 0 && right == 0 && bottom == 0) {
    draw_rectangle_color(x1, y1, x2, y2, argument8, argument8, argument8, argument8, true);
}
