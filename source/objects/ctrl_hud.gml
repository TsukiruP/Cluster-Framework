#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// HUD Initialization

hud_hide = true;
hud_max_frame = 10;
hud_frame = 0;
hud_x = 0;

switch (config_get("misc_hud"))
{
    case 2:
        hud_sprite = spr_hud_s4e2;
        hud_offset = 13;
        hud_y = 14;
        break;

    default:
        hud_sprite = spr_hud;
        hud_offset = 4;
        hud_y = 6;
}

gauge_hide = true;
gauge_frame = 0;
gauge_x = 0;
gauge_max_energy = 1;
gauge_energy = 0;

boss_hide = true;
boss_frame = 0;
boss_x = 0;
boss_health = 0;

status_icon[STATUS_SHIELD] = ITEM_BASIC;
status_icon[STATUS_INVIN] = ITEM_INVIN;
status_icon[STATUS_SPEED] = ITEM_SPEED;
status_icon[STATUS_PANIC] = ITEM_PANIC;
status_icon[STATUS_SWAP] = ITEM_SWAP;
status_width = sprite_get_width(spr_item_icon) + 2;
status_max = 3 + 2 * config_get("gameplay_debuffs");
status_bar_x = 0;

for ({var i; i = STATUS_SHIELD}; i <= STATUS_SWAP; i += 1)
{
    status_active[i, 0] = 0;
    status_active[i, 1] = false;
}

item_hide = false;
item_max_frame = 10;
item_alarm = 0;
item_grid = -1;
if (config_get("misc_hud") == 1 && config_get("misc_feed")) item_grid = ds_grid_create(3, 0);
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Cleanup

if (item_grid != -1) ds_grid_destroy(item_grid);
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Alarm

if (game_ispaused(mnu_pause)) exit;

if (item_grid != -1)
{
    if (ds_grid_height(item_grid) > 0)
    {
        if (ds_grid_get(item_grid, 1, ds_grid_height(item_grid) - 1)== item_max_frame)
        {
            if (item_alarm > 0)
            {
                item_alarm -= 1;
                item_hide = false;

                if (item_alarm <= 30) item_hide = mod_time(item_alarm, 2, 2);

                if (item_alarm == 0)
                {
                    ds_grid_clear(item_grid, 0);
                    ds_grid_resize(item_grid, ds_grid_width(item_grid), 0);
                }
            }
        }
        else if (item_alarm != 90) item_alarm = 90;
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Frames

if (game_ispaused(mnu_pause)) exit;

if (!hud_hide) hud_frame = approach(hud_frame, hud_max_frame, 1);
else hud_frame = approach(hud_frame, 0, 1);

if (!hud_hide && !gauge_hide) gauge_frame = approach(gauge_frame, hud_max_frame, 1);
else gauge_frame = approach(gauge_frame, 0, 1);

if (!hud_hide && !boss_hide) boss_frame = approach(boss_frame, hud_max_frame, 1);
else boss_frame = approach(boss_frame, 0, 1);

if (item_grid != -1)
{
    for ({var i; i = 0}; i < ds_grid_height(item_grid); i += 1)
    {
        ds_grid_set(item_grid, 1, i, approach(ds_grid_get(item_grid, 1, i), item_max_frame, 1));
    }
}
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// HUD

if (game_ispaused(mnu_pause)) exit;

hud_x = lerp(-sprite_get_width(hud_sprite), hud_offset, smoothstep(0, hud_max_frame, hud_frame));
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Gauge

if (game_ispaused(mnu_pause) || config_get("misc_hud") != 1) exit;

gauge_x = lerp(-sprite_get_width(spr_hud_gauge), hud_x + 6, smoothstep(0, hud_max_frame, gauge_frame));

with (stage_get_player(0))
{
    switch (character_index)
    {
        /*
        case CHAR_CLASSIC:
            other.gauge_hide = false;
            other.gauge_max_energy = max_energy;
            other.gauge_energy = energy;
            break;
        */

        default:
            other.gauge_hide = true;
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Boss

if (game_ispaused(mnu_pause) || config_get("misc_hud") != 1) exit;

boss_x = lerp(screen_get_width() + sprite_get_width(spr_hud_boss), screen_get_width() - sprite_get_width(spr_hud_boss) - 10, smoothstep(0, hud_max_frame, boss_frame));
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Status

if (game_ispaused(mnu_pause) || config_get("misc_hud") != 1 || config_get("misc_status") == 0) exit;

status_bar_x = lerp(screen_get_width() + status_width + 5, screen_get_width() - status_width * status_max + 5, smoothstep(0, hud_max_frame, hud_frame));

with (stage_get_player(0))
{
    // Shield:
    if (status_shield != SHIELD_NONE) other.status_icon[STATUS_SHIELD] = status_shield + 2;
    else other.status_icon[STATUS_SHIELD] = ITEM_BASIC;
    other.status_active[STATUS_SHIELD, 0] = (status_shield != SHIELD_NONE);
    other.status_active[STATUS_SHIELD, 1] = true;

    // Invincibility:
    other.status_icon[STATUS_INVIN] = ITEM_INVIN;
    other.status_active[STATUS_INVIN, 0] = (status_invin != INVIN_NONE);
    if (status_invin_alarm > 0 && status_invin_alarm <= 120) other.status_active[STATUS_INVIN, 1] = mod_time(status_invin_alarm, 2, 2);
    else other.status_active[STATUS_INVIN, 1] = true;

    // Speed Up/Slow Down:
    if (status_speed == SPEED_SLOW) other.status_icon[STATUS_SPEED] = ITEM_SLOW;
    else other.status_icon[STATUS_SPEED] = ITEM_SPEED;
    other.status_active[STATUS_SPEED, 0] = (status_speed != 0)
    if (status_speed_alarm > 0 && status_speed_alarm <= 120) other.status_active[STATUS_SPEED, 1] = mod_time(status_speed_alarm, 2, 2);
    else other.status_active[STATUS_SPEED, 1] = true;

    // Panic:
    other.status_icon[STATUS_PANIC] = ITEM_PANIC;
    other.status_active[STATUS_PANIC, 0] = (status_panic_alarm > 0);
    if (status_panic_alarm > 0 && status_panic_alarm <= 120) other.status_active[STATUS_PANIC, 1] = mod_time(status_panic_alarm, 2, 2);
    else other.status_active[STATUS_PANIC, 1] = true;

    // Swap:
    other.status_icon[STATUS_SWAP] = ITEM_SWAP;
    other.status_active[STATUS_SWAP, 0] = (status_swap_alarm > 0);

    if (status_swap_alarm > 0 && status_swap_alarm <= 120) other.status_active[STATUS_SWAP, 1] = mod_time(status_swap_alarm, 2, 2);
    else other.status_active[STATUS_SWAP, 1] = true;
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Items

if (game_ispaused(mnu_pause) || item_grid == -1) exit;

for ({var i; i = 0}; i < ds_grid_height(item_grid); i += 1)
{
    ds_grid_set(item_grid, 2, i, lerp(-sprite_get_width(spr_item_icon), screen_get_width() / 2 + 9 * (ds_grid_height(item_grid) - 1) - 18 * i, smoothstep(0, item_max_frame, ds_grid_get(item_grid, 1, i))));
}
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Default HUD

if (config_get("misc_hud") != 1) exit;

// Font:
draw_set_font(global.font_hud);
draw_set_color(c_white);

// Time:
var time_y; time_y = view_yview[view_current] + hud_y + 5;

draw_sprite(hud_sprite, 0, view_xview[view_current] + hud_x, view_yview[view_current] + hud_y);
draw_text(view_xview[view_current] + hud_x + 29, time_y, string_pad(stage_get_time() div 3600, 2));
draw_text(view_xview[view_current] + hud_x + 54, time_y, string_pad((stage_get_time() div 60) mod 60, 2));
draw_text(view_xview[view_current] + hud_x + 79, time_y, string_pad(floor(stage_get_time() * 1.667) mod 100, 2));

// Rings
draw_sprite(hud_sprite, 1, view_xview[view_current] + hud_x, view_yview[view_current] + hud_y + 26);
draw_text(view_xview[view_current] + hud_x + 29, view_yview[view_current] + hud_y + 31, string_pad(stage_get_rings(), 3));

// Gauge:
var gauge_y; gauge_y = screen_get_height() - 27;

draw_sprite(spr_hud_gauge, 0, view_xview[view_current] + gauge_x, view_yview[view_current] + gauge_y);
draw_sprite_part(spr_hud_energy, 0, 0, 0, sprite_get_width(spr_hud_energy) * (gauge_energy / gauge_max_energy), sprite_get_height(spr_hud_energy), view_xview[view_current] + gauge_x + 8, view_yview[view_current] + gauge_y + 10);

// Boss:
draw_sprite(spr_hud_boss, 0, view_xview[view_current] + boss_x, view_yview[view_current] + gauge_y);
draw_reset();
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw S4E2 HUD

if (config_get("misc_hud") != 2) exit;

// Color:
draw_set_color(c_white);

// HUD:
draw_sprite(spr_hud_s4e2, 0, view_xview[view_current] + hud_x, view_yview[view_current] + hud_y);

// Score:
draw_set_font(global.font_score_s4e2);
draw_text(view_xview[view_current] + hud_x + 37, view_yview[view_current] + hud_y + 3, string_pad(stage_get_score(), 9));

// Time:
var time_x; time_x = view_xview[view_current] + hud_x + 58;
var time_y; time_y = view_yview[view_current] + hud_y + 18;

draw_set_font(global.font_time_s4e2);
draw_text(time_x, time_y, stage_get_time() div 3600);
draw_text(time_x + 10, time_y, ":");
draw_text(time_x + 16, time_y, string_pad((stage_get_time() div 60) mod 60, 2));
draw_text(time_x + 35, time_y, ";");
draw_text(time_x + 44, time_y, string_pad(floor(stage_get_time() * 1.667) mod 100, 2));

// Rings:
draw_set_font(global.font_hud_s4e2);

if ((mod_time(game_get_time(), 8, 2) && stage_get_rings() == 0) || stage_get_rings() > 0)
{
    if (stage_get_rings() == 0) draw_set_color(c_red);
    draw_text(view_xview[view_current] + hud_x - 5, view_yview[view_current] + hud_y + 11, string_pad(stage_get_rings(), 3));
}

draw_reset();
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Status

if (config_get("misc_hud") != 1 || config_get("misc_status") == 0) exit;

var status_count; status_count = 0;

for ({var i; i = status_max}; i > 0; i -= 1)
{
    var status_config; status_config = config_get("misc_status");
    var status_index; status_index = i - 1;
    var status_x; status_x = view_xview[view_current] + status_bar_x + status_width * (status_max - 1 - status_count);

    if (((status_config != 0 && status_active[status_index, 0]) || status_config == 2) && status_active[status_index, 1])
    {
        // Shadow:
        draw_sprite_ext(spr_item_icon, status_icon[status_index], status_x + 1, view_yview[view_current] + 18, 1, 1, 0, c_black, 1);

        // Icon:
        image_blend = pick(status_config == 2 && !status_active[status_index, 0], c_white, c_gray);
        draw_sprite_ext(spr_item_icon, status_icon[status_index], status_x, view_yview[view_current] + 17, 1, 1, 0, image_blend, 1);
    }

    if ((status_config == 1 && status_active[status_index, 0]) || status_config == 2) status_count += 1;
}

draw_reset();
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Items

if (!config_get("misc_feed") || item_grid == -1) exit;

for ({var i; i = 0}; i < ds_grid_height(item_grid); i += 1)
{
    draw_sprite_ext(spr_item_icon, ds_grid_get(item_grid, 0, i), view_xview[view_current] + ds_grid_get(item_grid, 2, i), view_yview[view_current] + screen_get_height() - 33, 1, 1, 0, c_white, !item_hide);
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Drown Countdown

with (eff_drown) event_draw();
