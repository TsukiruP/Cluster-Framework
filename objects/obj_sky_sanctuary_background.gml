#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Background Initialization

var i;

// Cloud variables:
for (i = 0; i < 8; i += 1)
{
    cloud_x[i] = 0;
}

cloud_y = 0;
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Clouds

// Cloud x:
cloud_x[0] = -sync_rate(game_get_time(), 7, background_get_width(bg_sky_sanctuary_2));
cloud_x[1] = -sync_rate(game_get_time(), 6, background_get_width(bg_sky_sanctuary_3));
cloud_x[2] = -sync_rate(game_get_time(), 4, background_get_width(bg_sky_sanctuary_4));
cloud_x[3] = -sync_rate(game_get_time(), 3, background_get_width(bg_sky_sanctuary_5));
cloud_x[4] = -sync_rate(game_get_time(), 6, background_get_width(bg_sky_sanctuary_6));
cloud_x[5] = -sync_rate(game_get_time(), 5, background_get_width(bg_sky_sanctuary_7));
cloud_x[6] = -sync_rate(game_get_time(), 4, background_get_width(bg_sky_sanctuary_8));
cloud_x[7] = -sync_rate(game_get_time(), 2, background_get_width(bg_sky_sanctuary_9));

cloud_y = hover(0, game_get_time() * 0.01, 3);
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Background

// Color:
draw_rect(view_xview[view_current], view_yview[view_current], screen_get_width(), screen_get_height(), make_color_rgb(10, 105, 201));

// Sky:
draw_background_tiled_view(bg_sky_sanctuary_1, 0, -32, 1, 1, 0, 1);
draw_background_tiled_view(bg_sky_sanctuary_0, 0, -32, 1, 1, 1, 1);

// Clouds:
draw_background_tiled_view(bg_sky_sanctuary_2, cloud_x[0], 96 + cloud_y, 1, 1, 0, 1);
draw_background_tiled_view(bg_sky_sanctuary_3, cloud_x[1], 120 + cloud_y, 1, 1, 0, 1);
draw_background_tiled_view(bg_sky_sanctuary_4, cloud_x[2], 128 + cloud_y, 1, 1, 0, 1);
draw_background_tiled_view(bg_sky_sanctuary_5, cloud_x[3], 160 + cloud_y, 1, 1, 0, 1);
draw_background_tiled_view(bg_sky_sanctuary_6, cloud_x[4], 168 + cloud_y, 1, 1, 0, 1);
draw_background_tiled_view(bg_sky_sanctuary_7, cloud_x[5], 176 + cloud_y, 1, 1, 0, 1);
draw_background_tiled_view(bg_sky_sanctuary_8, cloud_x[6], 184 + cloud_y, 1, 1, 0, 1);
draw_background_tiled_view(bg_sky_sanctuary_9, cloud_x[7], 200 + cloud_y, 1, 1, 0, 1);
