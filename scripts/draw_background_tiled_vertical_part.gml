/// draw_background_tiled_vertical_part(back, left, top, width, height, x, y, sep)
// Draw a part of a background, horizontally tiled.

var background_start, background_end, background_step;

// Retrieve background properties
background_step  = argument[4] + argument[7];
background_start = view_yview[view_current] + ((argument[6] - view_yview[view_current]) mod background_step) - background_step;
background_end   = view_yview[view_current] + view_hview[view_current] + background_step;

repeat((background_end - background_start) / background_step) {
    draw_background_part(argument[0], argument[1], argument[2], argument[3], argument[4], argument[5], background_start);

    background_start += background_step;
}
