/// set_hitbox(left, top, right, bottom, [x offset, y offset])
// Sets the object's hitbox values.

var left, top, right, bottom, x_off, y_off;

// Initialize:
left   = 0;
top    = 0;
right  = 0;
bottom = 0;

x_off  = 0;
y_off  = 0;

// Assign hitbox:
if (argument_count >= 4) {
    left   = argument[0];
    top    = argument[1];
    right  = argument[2];
    bottom = argument[3];
    
    if (argument_count >= 5) {
        x_off = argument[4];
    }
    
    if (argument_count >= 6) {
        y_off = argument[5];
    }
}

// Set hitbox:
hitbox_left     = left;
hitbox_top      = top;
hitbox_right    = right;
hitbox_bottom   = bottom;

hitbox_x_offset = x_off;
hitbox_y_offset = y_off;
