#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Parallax Initialization

// Parallax variables:
parallax_ratio     =  0.8;
parallax_reference = -1;
y_max_scale        =  3;

// Sky variables:
sky_x            =  0;
sky_factor       =  0.90;
sky_scroll       =  0;
sky_scroll_speed = -0.08;

// Sea variables:
sea_factor   =  0.875;
under_factor = 0.875;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Parallax Reference

if (instance_exists(obj_water_surface)) parallax_reference = obj_water_surface.y;
else parallax_reference = room_height;
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Parallax Speed

sky_scroll += sky_scroll_speed * global.object_ratio;
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Parallax

var sky_height, sky_y;
var sea_height, sea_x, sea_y, sea_scale;
var under_height;

// Sea variables:
sea_height = background_get_height(pbg_basic_test_sea);
sea_x      = view_xview[view_current] * sea_factor;
sea_y      = view_yview[view_current] * parallax_ratio + (parallax_reference - ((parallax_reference - view_hview / 2) * parallax_ratio));
sea_scale  = clamp((parallax_reference - sea_y) / sea_height, -1, 1);

// Sky variables:
sky_height   = background_get_height(pbg_basic_test_sky);
sky_x        = view_xview[view_current] * sky_factor + sky_scroll;
sky_y        = sea_y - background_get_height(pbg_basic_test_sky);

// Under variables;
under_height = 128;

// Sky parallax:
draw_backdrop_tiled_area(pbg_basic_test_sky, 0, 0, sky_x, sky_y, view_xview[view_current] * (1 - sky_factor) - sky_scroll + view_wview[view_current], sky_height);

// Underwater parallax:
draw_backdrop_tiled_area(pbg_basic_test_under, 0, 0, sky_x - sky_scroll, sea_y, view_xview[view_current] * (1 - sky_factor) + view_wview[view_current], under_height);

// Extend underwater parallax:
for(i = 0; i < (room_height - (sea_y + under_height)) / 64; i += 1) {
    var under_x, under_width;

    under_x     = under_factor - (i * 0.05);
    under_width = (1 - under_factor) + (i * 0.05);

    draw_backdrop_tiled_area(pbg_basic_test_under, 0, 128, view_xview[view_current] * under_x, sea_y + under_height + i * 64, view_xview[view_current] * under_width + view_wview[view_current], 64);
}

// Draw rocks:
draw_backdrop_tiled_area(pbg_basic_test_rock_small, 0, 0, view_xview[view_current] * 0.86 - 24, sea_y + 20 * sea_scale - 17, view_xview[view_current] + view_wview[view_current], background_get_height(pbg_basic_test_rock_small), 214);
draw_backdrop_tiled_area(pbg_basic_test_rock_large, 0, 0, view_xview[view_current] * 0.73 + 152, sea_y + 40 * sea_scale - 45, view_xview[view_current] + view_wview[view_current], background_get_height(pbg_basic_test_rock_large), 154);

// Sea parallax:
for(i = 0; i < sea_height / 4; i += 1) {
    var layer_y, layer_scroll;

    layer_y = sea_y + (i * 4) * sea_scale;

    // Draw medium rocks:
    if (i == 3) draw_backdrop_tiled_area(pbg_basic_test_rock_medium, 0, 0, view_xview[view_current] * 0.87 + 50, layer_y - 15, view_xview[view_current] + view_wview[view_current], background_get_height(pbg_basic_test_rock_medium), 170);

    layer_scroll = ((current_time * 0.002) * i mod background_get_width(pbg_basic_test_sea)) * global.object_ratio;

    // Draw sea:
    draw_backdrop_tiled_area(pbg_basic_test_sea, 0, i * 4, sea_x - layer_scroll, layer_y, view_xview[view_current] * (1 - sea_factor) + layer_scroll + view_wview[view_current], 4, 0, 0, 1, sea_scale);
}

if (sea_scale > 0) {
    draw_backdrop_tiled_area(pbg_basic_test_rock_small, 0, 0, view_xview[view_current] * 0.86 - 24, sea_y + 20 * sea_scale - 17, view_xview[view_current] + view_wview[view_current], background_get_height(pbg_basic_test_rock_small), 214);
    draw_backdrop_tiled_area(pbg_basic_test_rock_large, 0, 0, view_xview[view_current] * 0.73 + 152, sea_y + 40 * sea_scale - 45, view_xview[view_current] + view_wview[view_current], background_get_height(pbg_basic_test_rock_large), 154);
}
