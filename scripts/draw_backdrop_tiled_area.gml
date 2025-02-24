/// draw_backdrop_tiled_area(back, left, top, x, y, region width, region height, [xsep, ysep, xscale, yscale])

var backdrop_width, backdrop_height, xsep, ysep, xscale, yscale, i, j;

// Set x seperation:
if (argument_count >= 8) xsep = argument[7];
else xsep = 0;

// Set y seperation:
if (argument_count >= 9) ysep = argument[8];
else ysep = 0;

// Set x scale:
if (argument_count >= 10) xscale = argument[9];
else xscale = 1;

// Set y scale:
if (argument_count >= 11) yscale = argument[10];
else yscale = 1;

// Set backdrop data:
if (background_exists(argument[0])) {
    backdrop_width  = background_get_width(argument[0]);
    backdrop_height = background_get_height(argument[0]);
}
else {
    backdrop_width  = sprite_get_width(argument[0]);
    backdrop_height = sprite_get_height(argument[0]);
}

tiled_width  = backdrop_width;
tiled_height = backdrop_height;

for (j = 0; j < argument[6]; j += backdrop_height + ysep) {
    tiled_height = min(argument[6] - j, backdrop_height);

    for (i = 0; i < argument[5]; i += backdrop_width + xsep) {
        tiled_width = min(argument[5] - i, backdrop_width);

        if (background_exists(argument[0])) {
            draw_background_part_ext(argument[0], argument[1], argument[2], tiled_width, tiled_height, argument[3] + i, argument[4] + j, xscale, yscale, c_white, 1);
        } else {
            draw_sprite_part_ext(argument[0], 0, argument[1], argument[2], tiled_width, tiled_height, argument[3] + i, argument[4] + j, xscale, yscale, c_white, 1);
        }
    }
}