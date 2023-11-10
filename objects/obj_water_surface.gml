#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Water Surface Initialization

water_scroll       = 0;
water_scroll_speed = 0.25;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Water Scroll

water_scroll -= water_scroll_speed * global.object_ratio;
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Water

var water_height;

// Water height:
water_height = max(y - view_yview[view_current], 0);

// Draw water filter:
draw_set_blend_mode_ext(bm_dest_color, bm_src_alpha_sat);
draw_set_color(make_color_rgb(57, 132, 222)); // < Change this if you want to use a different color.
draw_rectangle(view_xview[view_current], view_yview[view_current] + water_height, view_xview[view_current] + view_wview[view_current], view_yview[view_current] + view_hview[view_current], 0);

// Reset:
draw_set_color(c_white);
draw_set_blend_mode(bm_normal);

// Draw surface:
draw_sprite_tiled_horizontal(spr_water_surface, 0, water_scroll, y);
