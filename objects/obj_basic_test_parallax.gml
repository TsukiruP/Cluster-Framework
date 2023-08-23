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
sky_x              =  0;
sky_factor         =  0.90;
sky_scroll         =  0;
sky_scroll_speed   = -0.08;

// Sea variables:
sea_factor         =  0.94;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Parallax Reference

if(instance_exists(obj_water_surface)) parallax_reference = obj_water_surface.y;
else parallax_reference = room_height;
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Parallax Speed

sky_scroll += sky_scroll_speed;
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Parallax

var sky_y;
var sea_x, sea_y, sea_scale;

// Sea variables:
sea_x      = floor(view_xview[view_current] * sea_factor);
sea_y      = floor(view_yview[view_current] * parallax_ratio) + (parallax_reference - floor((parallax_reference - view_hview / 2) * parallax_ratio));
sea_scale  = clamp((parallax_reference - sea_y) / background_get_height(pbg_basic_test_sea), -1, 1);

// Sky variables:
sky_x     = floor(view_xview[view_current] * sky_factor) + sky_scroll;
sky_y     = sea_y - background_get_height(pbg_basic_test_sky);

// Sky parallax:
draw_background_tiled_horizontal_part(pbg_basic_test_sky, 0, 0, background_get_width(pbg_basic_test_sky), background_get_height(pbg_basic_test_sky), sky_x, sky_y, 0);

// Under parallax:
draw_background_tiled_horizontal_part(pbg_basic_test_under, 0, 0, background_get_width(pbg_basic_test_under), background_get_height(pbg_basic_test_under), floor(view_xview[view_current] * sky_factor), sea_y, 0);

// Draw small rocks:
draw_background_tiled_horizontal_part(pbg_basic_test_rock_small, 0, 0, background_get_width(pbg_basic_test_rock_small), background_get_height(pbg_basic_test_rock_small), floor(view_xview[view_current] * 0.86) - 24, sea_y + 20 * sea_scale - 17, 214);
draw_background_tiled_horizontal_part(pbg_basic_test_rock_large, 0, 0, background_get_width(pbg_basic_test_rock_large), background_get_height(pbg_basic_test_rock_large), floor(view_xview[view_current] * 0.83) + 152, sea_y + 40 * sea_scale - 45, 154);

// Sea parallax:
for(i = 0; i < background_get_height(pbg_basic_test_sea) / 4; i += 1) {
    // Draw medium rocks:
    if(i == 3) draw_background_tiled_horizontal_part(pbg_basic_test_rock_medium, 0, 0, background_get_width(pbg_basic_test_rock_medium), background_get_height(pbg_basic_test_rock_medium), floor(view_xview[view_current] * 0.87) + 50, sea_y + (i * 4) * sea_scale - 15, 170);

    // Draw sea layers:
    draw_background_tiled_horizontal_part_yscale(pbg_basic_test_sea, 0, i * 4, background_get_width(pbg_basic_test_sea), 4, sea_x - ((current_time * 0.001) * i mod  background_get_width(pbg_basic_test_sea)), sea_y + (i * 4) * sea_scale, 0, sea_scale);
}



// Draw overlaying rocks:
if(sea_scale > 0) {
    draw_background_tiled_horizontal_part(pbg_basic_test_rock_small, 0, 0, background_get_width(pbg_basic_test_rock_small), background_get_height(pbg_basic_test_rock_small), floor(view_xview[view_current] * 0.86) - 24, sea_y + 20 * sea_scale - 17, 214);
    draw_background_tiled_horizontal_part(pbg_basic_test_rock_large, 0, 0, background_get_width(pbg_basic_test_rock_large), background_get_height(pbg_basic_test_rock_large), floor(view_xview[view_current] * 0.83) + 152, sea_y + 40 * sea_scale - 45, 154);
}
