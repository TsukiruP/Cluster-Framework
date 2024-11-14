#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Save Initialization

// save height:
save_current = 0;
save_width = 98;
save_height = (mgr_text.font_height * 3) + 16;
save_kerning = 4;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Menu

if (!save_exists(save_current))
{
    if (input_get_check(INP_ACCEPT, CHECK_PRESSED))
    {
        save_write(save_current);
    }
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Saves

var save_count, save_top, save_indent, save_offset, save_x1, save_y1, save_x2, save_y2;

save_count = mgr_game.save_count;
save_top = (global.display_height / 2) - ((save_height + save_kerning) * (save_count - 1)) / 2;

for (i = 0; i < save_count; i += 1)
{
    // Indent:
    save_indent = 0;

    if (save_current == i)
    {
        save_indent = 12;
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

    if (save_current == i)
    {
        draw_set_color(c_white);
    }

    // Save:
    if (save_exists(i))
    {
        // Name and stage:
        draw_set2(fa_left, fa_center);
        draw_text(save_x1, save_y1, save_get("name") + "##" + room_get_name(save_get("stage")));

        // Time:
        draw_set2(fa_right, fa_center);
        draw_text(save_x2, save_y1, "##" + string_pad(save_get("time") div 216000, 3) + ":" + string_pad(save_get("time") div 3600, 2));
    }

    // No data:
    else
    {
        draw_set2(fa_middle, fa_center);
        draw_text(save_x1 + save_width, save_y2 - save_height / 2, "No Data");
    }
}
