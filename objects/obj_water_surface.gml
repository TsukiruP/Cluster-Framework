#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animation

image_index = sync_rate(game_get_time(), 6, sprite_get_number(spr_water_surface));
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

// Filter:
draw_set_blend_mode_ext(bm_dest_color, bm_src_alpha_sat);
draw_set_color(make_color_rgb(57, 132, 222)); // < Change this if you want to use a different color.
draw_rectangle(view_xview[view_current], view_yview[view_current] + water_height, view_xview[view_current] + view_wview[view_current], view_yview[view_current] + view_hview[view_current], 0);

draw_reset();

// Surface:
draw_sprite_tiled_horizontal(spr_water_surface, image_index, x, y);
