#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Save Initialization

// Savedata height:
savedata_current = 0;
savedata_width = 98;
savedata_height = (mgr_text.font_height * 3) + 16;
savedata_kerning = 4;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Menu

if (!savedata_exists(savedata_current))
{
    if (input_get_check(INP_ACCEPT, CHECK_PRESSED))
    {
        savedata_write(savedata_current);
    }
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Saves

var savedata_count, savedata_top, savedata_indent, savedata_offset, savedata_x1, savedata_y1, savedata_x2, savedata_y2;

savedata_count = mgr_game.savedata_count;
savedata_top = (global.display_height / 2) - ((savedata_height + savedata_kerning) * (savedata_count - 1)) / 2;

for (i = 0; i < savedata_count; i += 1)
{
    // Indent:
    savedata_indent = 0;

    if (savedata_current == i)
    {
        savedata_indent = 12;
    }

    // Position:
    savedata_offset = (savedata_height + savedata_kerning) * i;
    savedata_x1 = (global.display_width / 2) - savedata_width - savedata_indent;
    savedata_y1 = savedata_top + savedata_offset;
    savedata_x2 = (global.display_width / 2) + savedata_width - savedata_indent;
    savedata_y2 = savedata_y1 + savedata_height / 2;

    // Box:
    draw_set1(make_color_rgb(global.textbox_red, global.textbox_green, global.textbox_blue), 0.6);
    draw_rectangle(savedata_x1 - 8, savedata_y1 - savedata_height / 2, savedata_x2 + 8, savedata_y2, false);

    // Font:
    draw_set_font(global.font_system);
    draw_set1(c_gray, 1);

    if (savedata_current == i)
    {
        draw_set_color(c_white);
    }

    // Save:
    if (savedata_exists(i))
    {
        // Name and stage:
        draw_set2(fa_left, fa_center);
        draw_text(savedata_x1, savedata_y1, savedata_get("name") + "##" + room_get_name(savedata_get("stage")));

        // Time:
        draw_set2(fa_right, fa_center);
        draw_text(savedata_x2, savedata_y1, "##" + string_pad(savedata_get("time") div 216000, 3) + ":" + string_pad(savedata_get("time") div 3600, 2));
    }

    // No data:
    else
    {
        draw_set2(fa_middle, fa_center);
        draw_text(savedata_x1 + savedata_width, savedata_y2 - savedata_height / 2, "No Data");
    }
}
