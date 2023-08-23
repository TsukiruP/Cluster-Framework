/// draw_backdrop_tiled_area(back, left, top, x, y, width, height, yscale)

var backdrop_width, backdrop_height, i, j;

if(background_exists(argument[0])) {
    backdrop_width  = background_get_width(argument[0]);
    backdrop_height = background_get_height(argument[0]);
} else {
    backdrop_width  = sprite_get_width(argument[0]);
    backdrop_height = sprite_get_height(argument[0]);
}

tiled_width = backdrop_width;
tiled_height = backdrop_height;
for(j = 0; j < argument[6]; j += backdrop_height) {
    tiled_height = min(argument[6] - j, backdrop_height);

    for(i = 0; i < argument[5]; i += backdrop_width) {
        tiled_width = min(argument[5] - i, backdrop_width);

        if(background_exists(argument[0])) {
            draw_background_part_ext(argument[0], argument[1], argument[2], tiled_width, tiled_height, argument[3] + i, argument[4] + j, 1, argument[7], c_white, 1);
        } else {
            draw_sprite_part_ext(argument[0], 0, argument[1], argument[2], tiled_width, tiled_height, argument[3] + i, argument[4] + j, 1, argument[7], c_white, 1);
        }
    }
}
