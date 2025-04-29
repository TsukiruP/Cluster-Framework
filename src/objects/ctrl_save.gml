#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Save Initialization

save_directory = "data\saves\"
save_encryption = "";
save_index = -1;
save_count = 9;
indicator_draw = false;
indicator_time = 0;
save_map = ds_map_create();
character_list = ds_list_create();
sonic_map = ds_map_create();
save_reset();
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Time

if (indicator_draw)
{
    indicator_time += 1;

    if (indicator_time >= 60)
    {
        indicator_draw = false;
        indicator_time = 0;
    }
}

if (!instance_exists(ctrl_transition)) save_set("time", save_get("time") + 1);
#define Other_3
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Cleanup

ds_map_destroy(save_map);
ds_list_destroy(character_list);
ds_map_destroy(sonic_map);
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Indicator

if (!indicator_draw) exit;

// Stars:
draw_sprite(spr_save_stars, time_sync(indicator_time, 4, sprite_get_number(spr_save_stars)), view_xview[view_current] + screen_get_width() - 27, view_yview[view_current] + screen_get_height() - 16);

// Sonic:
d3d_fog_trick(c_white);
draw_sprite(spr_sonic_run_4, time_sync(indicator_time, 4, sprite_get_number(spr_sonic_run_5)), view_xview[view_current] + screen_get_width() - 27, view_yview[view_current] + screen_get_height() - 25);
d3d_set_fog(false, c_black, 0, 0);
