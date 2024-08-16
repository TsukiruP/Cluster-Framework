/// set_hurtbox(left, top, right, bottom, [x offset, y offset])
// Sets the object's hurtbox values.

var left, top, right, bottom, x_off, y_off;

// Initialize:
left   = 0;
top    = 0;
right  = 0;
bottom = 0;

x_off  = 0;
y_off  = 0;

// Assign hurtbox:
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

// Set hurtbox:
hurtbox_left     = left;
hurtbox_top      = top;
hurtbox_right    = right;
hurtbox_bottom   = bottom;

hurtbox_x_offset = x_off;
hurtbox_y_offset = y_off;
