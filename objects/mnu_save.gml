#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Save Initialization

// Menu variables:
menu_selection = 0;

// Save variables:
save_width = 98;
save_height = (mgr_text.font_height * 3) + 16;
save_kerning = 4;
save_preview_map = save_preview();
save_count = mgr_game.save_count;
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Destroy Preview Map

ds_map_destroy(save_preview_map);
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Menu

// Exit if text is active:
if (game_ispaused(mgr_text))
{
    exit;
}

var menu_up, menu_down, menu_direction;

// Menu direction:
menu_up = input_get_check(INP_UP, CHECK_PRESSED);
menu_down = input_get_check(INP_DOWN, CHECK_PRESSED);
menu_direction = menu_down - menu_up;

// Menu selection:
menu_selection += menu_direction;
menu_selection = wrap(menu_selection, 0, save_count - 1);

// Accept:
if (input_get_check(INP_ACCEPT, CHECK_PRESSED))
{
    switch (ds_map_get(save_preview_map, "save" + string(menu_selection) + "_exists"))
    {
        // Create new save:
        case 0:
            save_default();
            save_write(menu_selection);
            event_user(0);
            break;

        // Read existing save:
        case 1:
            save_read(menu_selection);
            break;
    }
}
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Destroy Preview Map

ds_map_destroy(save_preview_map);
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Refresh Preview

ds_map_destroy(save_preview_map);
save_preview_map = save_preview();
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Saves

var save_top, save_indent, save_offset, save_x1, save_y1, save_x2, save_y2;

save_top = (global.display_height / 2) - ((save_height + save_kerning) * (save_count - 1)) / 2;

for (i = 0; i < save_count; i += 1)
{
    // Indent:
    save_indent = 0;

    if (menu_selection == i)
    {
        save_indent = 8;
    }

    // Position:
    save_offset = (save_height + save_kerning) * i;
    save_x1 = (global.display_width / 2) - save_width - save_indent;
    save_y1 = save_top + save_offset;
    save_x2 = (global.display_width / 2) + save_width - save_indent;
    save_y2 = save_y1 + save_height / 2;

    // Box:
    draw_set1(make_color_rgb(global.textbox_red, global.textbox_green, global.textbox_blue), 0.6);
    draw_rectangle(save_x1 - 8, save_y1 - save_height / 2, save_x2 + 8, save_y2, false);

    // Font:
    draw_set_font(global.font_system);
    draw_set1(c_gray, 1);

    if (menu_selection == i)
    {
        draw_set_color(c_white);
    }

    // Text:
    switch (ds_map_get(save_preview_map, "save" + string(i) + "_exists"))
    {
        // Save doesn't exist:
        case 0:
            draw_set2(fa_middle, fa_center);
            draw_text(save_x1 + save_width, save_y2 - save_height / 2, "No Data");
            break;
        
        // Save exists:
        case 1:
            var save_name, save_stage, save_time;
    
            // Save data:
            save_name = ds_map_get(save_preview_map, "save" + string(i) + "_name");
            save_stage = ds_map_get(save_preview_map, "save" + string(i) + "_stage");
            save_time = ds_map_get(save_preview_map, "save" + string(i) + "_time");
            
            if (save_name == "")
            {
                save_name = "Slot " + string(i + 1);
            }
            
            // Name and stage:
            draw_set2(fa_left, fa_center);
            draw_text(save_x1, save_y1, save_name + "##" + room_get_name(save_stage));
    
            // Time:
            draw_set2(fa_right, fa_center);
            draw_text(save_x2, save_y1, "##" + string_pad(save_time div 216000, 3) + ":" + string_pad(save_time div 3600, 2));
            break;
        
        // Game mismatch:
        case 2:
            draw_set2(fa_middle, fa_center);
            draw_text(save_x1 + save_width, save_y2 - save_height / 2, "Game Mismatch");
            break;
        
        // Version mismatch:
        case 3:
            draw_set2(fa_middle, fa_center);
            draw_text(save_x1 + save_width, save_y2 - save_height / 2, "Version Mismatch");
            break;
    }
}
