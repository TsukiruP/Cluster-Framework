/// draw_background_tiled_horizontal_part_yscale(back, left, top, width, height, x, y, sep, yscale)
// Draw a part of a background/sprite, horizontally tiled.

var background_start, background_end, background_step;

// Retrieve background properties
background_step  = argument3 + argument7;
background_start = view_xview[view_current] + ((argument5 - view_xview[view_current]) mod background_step) - background_step;
background_end   = view_xview[view_current] + view_wview[view_current] + background_step;

repeat((background_end - background_start) / background_step) {
    draw_background_part_ext(argument0, argument1, argument2, argument3, argument4, background_start, argument6, 1, argument8, c_white, 1);

    background_start += background_step;
}
