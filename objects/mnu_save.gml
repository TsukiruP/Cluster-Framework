#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Saves

// Box:
draw_set1(make_color_rgb(global.textbox_red, global.textbox_green, global.textbox_blue), 0.6);
draw_rectangle(global.display_width / 2 - 109, global.display_height / 2 - 42, global.display_width / 2 + 108, global.display_height / 2 + 42, false);

// Save:
draw_set_font(global.font_system);
draw_set1(c_white, 1);
draw_set2(fa_left, fa_center);
draw_text(global.display_width / 2 - 99, global.display_height / 2, savedata_get("name") + "##" + room_get_name(savedata_get("room")));
