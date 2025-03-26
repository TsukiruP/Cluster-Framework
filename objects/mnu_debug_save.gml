#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Save Initialization

menu_mode = 0;
menu_page = 0;
menu_option = 0;

save_width = 98;
save_height = (font_get_height(global.font_system) * 3) + 16;
save_leading = 4;
save_preview_map = debug_save_preview();
save_max = 3;

page_count = ceil(game_get_save_count() / save_max);
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Cleanup

ds_map_destroy(save_preview_map);
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Inputs

if (game_ispaused(ctrl_text) || instance_exists(ctrl_transition)) exit;

var menu_left; menu_left = input_get_check(INP_LEFT, CHECK_PRESSED);
var menu_right; menu_right = input_get_check(INP_RIGHT, CHECK_PRESSED);
var menu_x_direction; menu_x_direction = menu_right - menu_left;

var menu_up; menu_up = input_get_check(INP_UP, CHECK_PRESSED);
var menu_down; menu_down = input_get_check(INP_DOWN, CHECK_PRESSED);
var menu_y_direction; menu_y_direction = menu_down - menu_up;

if (menu_x_direction != 0 || menu_y_direction != 0) audio_play_sfx("snd_menu_move", true);

menu_page += menu_x_direction;
menu_page = wrap(menu_page, 0, page_count - 1);

var save_count; save_count = min(game_get_save_count() - (save_max * menu_page), save_max);

menu_option += menu_y_direction;
menu_option = wrap(menu_option, 0, save_count - 1);

var menu_save; menu_save = (menu_page * save_max) + menu_option;

if (input_get_check(INP_CONFIRM, CHECK_PRESSED))
{
    if (menu_mode == 0 || ((menu_mode == 1 || menu_mode == 2) && ds_map_get(save_preview_map, "save" + string(menu_save) + "_exists")))
    {
        var save_name; save_name = game_get_save("name");;

        if (menu_mode == 1 || menu_mode == 2) save_name = ds_map_get(save_preview_map, "save" + string(menu_save) + "_name");
        if (save_name == "") save_name = "Slot " + string(menu_save);

        script_execute(pick(menu_mode, game_write_save, game_read_save, game_delete_save), menu_save);
        script_execute(text_set_subject, pick(menu_mode, "Wrote", "Read", "Deleted") + " " + save_name + " data.");
        event_user(0);
        audio_play_sfx("snd_menu_confirm", true);
    }
    else audio_play_sfx("snd_menu_cannot", true);
}

if (input_get_check(INP_CANCEL, CHECK_PRESSED))
{
    audio_play_sfx("snd_menu_close", true);
    instance_destroy();
}
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Refresh Preview

ds_map_destroy(save_preview_map);
save_preview_map = debug_save_preview();
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Menu

var i, j;

// Pages:
for ({var i; i = 0}; i < page_count; i += 1)
{
    var save_count; save_count = min(game_get_save_count() - (save_max * i), save_max);
    var page_top; page_top = (screen_get_height() / 2) - ((save_height + save_leading) * (save_count - 1)) / 2;

    // Saves:
    for ({var j; j = 0}; j < save_count; j += 1)
    {
        // Save string:
        var save_index; save_index = (save_max * i) + j;
        var save_string; save_string = "save" + string(save_index);
        var save_indent; save_indent = pick((menu_page == i && menu_option == j), 0, 8);
        var save_offset; save_offset = (save_height + save_leading) * j;

        // Position:
        var save_x1; save_x1 = (screen_get_width() / 2) - save_width - save_indent;
        var save_y1; save_y1 = page_top + save_offset;
        var save_x2; save_x2 = (screen_get_width() / 2) + save_width - save_indent;
        var save_y2; save_y2 = save_y1 + save_height / 2;

        // Page offset:
        var page_offset; page_offset = save_x2 - ((screen_get_width() - save_x2) / 2);

        save_x1 -= page_offset * menu_page;
        save_x2 -= page_offset * menu_page;
        save_x1 += page_offset * i;
        save_x2 += page_offset * i;

        // View center:
        save_x1 += view_xview[view_current];
        save_y1 += view_yview[view_current];
        save_x2 += view_xview[view_current];
        save_y2 += view_yview[view_current];

        // Box:
        draw_set1(game_get_interface_color(), game_get_config("interface_alpha"));
        draw_rectangle(save_x1 - 8, save_y1 - save_height / 2, save_x2 + 8, save_y2, false);

        // Font:
        draw_set_font(global.font_system);
        draw_set1(pick(menu_page == i && menu_option == j, c_gray, c_white), 1);

        // Text:
        if (ds_map_get(save_preview_map, save_string + "_exists"))
        {
            // Save data:
            var save_character; save_character = ds_map_get(save_preview_map, save_string + "_character");
            var save_name; save_name = ds_map_get(save_preview_map, save_string + "_name");
            var save_stage; save_stage = ds_map_get(save_preview_map, save_string + "_stage");
            var save_time; save_time = ds_map_get(save_preview_map, save_string + "_time");

            // Default to slot number:
            if (save_name == "") save_name = "Slot " + string(save_index);

            // Character:
            draw_sprite_ext(spr_save_character, save_character, save_x1 - 8, save_y1 - save_height / 2, 1, 1, 0, c_white, 0.6);

            // Name and stage:
            draw_set2(fa_left, fa_middle);
            draw_text(save_x1, save_y1, save_name + "##" + room_get_name(save_stage));

            // Time:
            draw_set2(fa_right, fa_middle);
            draw_text(save_x2, save_y1, "##" + string_pad(save_time div 216000, 3) + ":" + string_pad(save_time div 3600, 2));
        }

        // Save doesn't exist:
        else
        {
            draw_set2(fa_center, fa_middle);
            draw_text(save_x1 + save_width, save_y2 - save_height / 2, "No Data");
        }
    }
}

draw_reset();
