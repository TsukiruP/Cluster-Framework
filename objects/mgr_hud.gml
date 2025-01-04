#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// HUD Initialization

var i;

// HUD variables:
hud_hide = true;
hud_time = 0;
hud_duration = 10;

hud_x = 0;

switch (game_get_config("misc_hud"))
{
    // S4E2:
    case 2:
        hud_index = spr_hud_s4e2;
        hud_offset = 13;
        hud_y = 14;
        break;

        // Default:
    default:
        hud_index = spr_hud;
        hud_offset = 4;
        hud_y = 6;
}

// Air variables:
air_hide = true;
air_time = 0;

air_x = 0;
air_value = 30;

// Gauge variables:
gauge_hide = true;
gauge_time = 0;
gauge_duration = 20;

gauge_x = 0;
gauge_value = 0;
gauge_max = 0;

// Status variables:
status_icon[STATUS_SHIELD] = ITEM_BASIC;
status_icon[STATUS_INVIN] = ITEM_INVIN;
status_icon[STATUS_SPEED] = ITEM_SPEED;
status_icon[STATUS_PANIC] = ITEM_PANIC;
status_icon[STATUS_SWAP] = ITEM_SWAP;

status_bar_x = 0;
status_width = sprite_get_width(spr_item_icon) + 2;
status_max = 3 + 2 * game_get_config("gameplay_debuffs");

for (i = STATUS_SHIELD; i <= STATUS_SWAP; i += 1)
{
    status_active[i, 0] = 0;
    status_active[i, 1] = false;
}

// Item variables:
item_hide = false;
item_grid = -1;
item_duration = 10;
item_alarm = 0;

if (game_get_config("misc_hud") == 1 && game_get_config("misc_feed"))
{
    item_grid = ds_grid_create(3, 0);
}
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Cleanup

if (item_grid != -1)
{
    ds_grid_destroy(item_grid);
}
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Alarm

// Exit if the stage is paused:
if (game_ispaused(mnu_pause))
{
    exit;
}

if (item_grid != -1)
{
    if (ds_grid_height(item_grid) > 0)
    {
        if (ds_grid_get(item_grid, 1, ds_grid_height(item_grid) - 1) == item_duration)
        {
            if (item_alarm > 0)
            {
                item_alarm -= 1;
                item_hide = false;

                // Hide:
                if (item_alarm <= 30)
                {
                    item_hide = sync_rate(item_alarm, 2, 2);
                }

                // Clear:
                if (item_alarm == 0)
                {
                    ds_grid_clear(item_grid, 0);
                    ds_grid_resize(item_grid, ds_grid_width(item_grid), 0);
                }
            }
        }
        else
        {
            if (item_alarm != 90)
            {
                item_alarm = 90;
            }
        }
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Time

// Exit if the stage is paused:
if (game_ispaused(mnu_pause))
{
    exit;
}

var i;

// Hud:
if (hud_hide == false)
{
    hud_time = approach(hud_time, hud_duration, 1);
}
else
{
    hud_time = approach(hud_time, 0, 1);
}

// Air:
if (air_hide == false)
{
    air_time = approach(air_time, hud_duration, 1);
}
else
{
    air_time = approach(air_time, 0, 1);
}

// Gauge:

// Items:
if (item_grid != -1)
{
    for (i = 0; i < ds_grid_height(item_grid); i += 1)
    {
        ds_grid_set(item_grid, 1, i, approach(ds_grid_get(item_grid, 1, i), item_duration, 1));
    }
}
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// HUD

// Exit if the stage is paused:
if (game_ispaused(mnu_pause))
{
    exit;
}

hud_x = lerp(-sprite_get_width(hud_index), hud_offset, smoothstep(0, hud_duration, hud_time));
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Air

// Exit if the stage is paused or HUD isn't default:
if (game_ispaused(mnu_pause) || game_get_config("misc_hud") != 1)
{
    exit;
}

air_x = lerp(-sprite_get_width(hud_index), hud_x, smoothstep(0, hud_duration, air_time));

if (instance_exists(stage_get_player(0)))
{
    with (stage_get_player(0))
    {
        // Hide:
        if (state_current != player_state_death)
        {
            if (physics_id == PHYS_WATER && status_shield != SHIELD_BUBBLE)
            {
                other.air_hide = false;
            }
            else
            {
                other.air_hide = true;
            }
            
            // Air value is always updated.
            other.air_value = air_remaining;
        }
    }
}
else
{
    air_value = 30;
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Gauge
/*
// Exit if the stage is paused:
if (game_ispaused(mnu_pause))
{
    exit;
}

if (game_config_get("misc_hud") == 1)
{
    var gauge_x_target, gauge_x_factor;

    // Gauge target:
    if (gauge_hide == false)
    {
        gauge_x_target = hud_x_target + 6;
    }
    else
    {
        gauge_x_target = -sprite_get_width(hud_index) - hud_x_factor;
    }

    if (gauge_x_current != gauge_x_target)
    {
        var gauge_x_distance;

        // Gauge distance:
        gauge_x_distance = gauge_x_target - gauge_x_current;

        // Gauge factor:
        gauge_x_factor = hud_x_factor * (1 + (2 * (hud_hide == false && gauge_hide == true)));

        gauge_x_speed = ceil(abs(gauge_x_distance) / hud_x_factor);
        gauge_x_current += gauge_x_speed * sign(gauge_x_distance);
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Status

// Exit if the stage is paused, HUD isn't default or status is disabled:
if (game_ispaused(mnu_pause) || game_get_config("misc_hud") != 1 || game_get_config("misc_status") == 0)
{
    exit;
}

status_bar_x = lerp(screen_get_width() + status_width + 5, screen_get_width() - status_width * status_max + 5, smoothstep(0, hud_duration, hud_time));

if (instance_exists(stage_get_player(0)))
{
    with (stage_get_player(0))
    {
        // Shield:
        if (status_shield != SHIELD_NONE)
        {
            other.status_icon[STATUS_SHIELD] = status_shield + 2;
        }
        else
        {
            other.status_icon[STATUS_SHIELD] = ITEM_BASIC;
        }

        other.status_active[STATUS_SHIELD, 0] = (status_shield != SHIELD_NONE);
        other.status_active[STATUS_SHIELD, 1] = true;

        // Invincibility:
        other.status_icon[STATUS_INVIN] = ITEM_INVIN;
        other.status_active[STATUS_INVIN, 0] = (status_invin != INVIN_NONE);

        if (status_invin_alarm > 0 && status_invin_alarm <= 120)
        {
            other.status_active[STATUS_INVIN, 1] = sync_rate(status_invin_alarm, 2, 2);
        }
        else
        {
            other.status_active[STATUS_INVIN, 1] = true;
        }

        // Speed Up/Slow Down:
        if (status_speed == 2)
        {
            other.status_icon[STATUS_SPEED] = ITEM_SLOW;
        }
        else
        {
            other.status_icon[STATUS_SPEED] = ITEM_SPEED;
        }

        other.status_active[STATUS_SPEED, 0] = (status_speed != 0)

        if (status_speed_alarm > 0 && status_speed_alarm <= 120)
        {
            other.status_active[STATUS_SPEED, 1] = sync_rate(status_speed_alarm, 2, 2);
        }
        else
        {
            other.status_active[STATUS_SPEED, 1] = true;
        }

        // Panic:
        other.status_icon[STATUS_PANIC] = ITEM_PANIC;
        other.status_active[STATUS_PANIC, 0] = status_panic;

        if (status_panic_alarm > 0 && status_panic_alarm <= 120)
        {
            other.status_active[STATUS_PANIC, 1] = sync_rate(status_panic_alarm, 2, 2);
        }
        else
        {
            other.status_active[STATUS_PANIC, 1] = true;
        }

        // Swap:
        other.status_icon[STATUS_SWAP] = ITEM_SWAP;
        other.status_active[STATUS_SWAP, 0] = status_swap;

        if (status_swap_alarm > 0 && status_swap_alarm <= 120)
        {
            other.status_active[STATUS_SWAP, 1] = sync_rate(status_swap_alarm, 2, 2);
        }
        else
        {
            other.status_active[STATUS_SWAP, 1] = true;
        }
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Items

// Exit if the stage is paused or there's no item grid:
if (game_ispaused(mnu_pause) || item_grid == -1)
{
    exit;
}

var i;

for (i = 0; i < ds_grid_height(item_grid); i += 1)
{
    ds_grid_set(item_grid, 2, i, lerp(-sprite_get_width(spr_item_icon), screen_get_width() / 2 + 9 * (ds_grid_height(item_grid) - 1) - 18 * i, smoothstep(0, item_duration, ds_grid_get(item_grid, 1, i))));
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

// Exit if HUD isn't default:
if (game_get_config("misc_hud") != 1)
{
    exit;
}

var time_y;

// Font:
draw_set_font(global.font_hud);
draw_set_color(c_white);

// Time:
time_y = view_yview[view_current] + hud_y + 5;

draw_sprite(hud_index, 0, view_xview[view_current] + hud_x, view_yview[view_current] + hud_y);
draw_text(view_xview[view_current] + hud_x + 29, time_y, string_pad(stage_get_time() div 3600, 2));
draw_text(view_xview[view_current] + hud_x + 54, time_y, string_pad((stage_get_time() div 60) mod 60, 2));
draw_text(view_xview[view_current] + hud_x + 79, time_y, string_pad(floor(stage_get_time() * 1.667) mod 100, 2));

// Rings
draw_sprite(hud_index, 1, view_xview[view_current] + hud_x, view_yview[view_current] + hud_y + 26);
draw_text(view_xview[view_current] + hud_x + 29, view_yview[view_current] + hud_y + 31, string_pad(stage_get_rings(), 3));


// Air:
draw_sprite(hud_index, 2, view_xview[view_current] + air_x, view_yview[view_current] + hud_y + 52);
draw_text(view_xview[view_current] + air_x + 29, view_yview[view_current] + hud_y + 57, string_pad(air_value, 2));

/*
// Action gauge:
if (instance_exists(instance_player(0))) {
    var clock_up_percentage;
    
    // Gauge:
    clock_up_percentage = (instance_player(0).clock_up_duration - instance_player(0).clock_up_timer) / instance_player(0).clock_up_duration;
    
    draw_sprite(spr_hud, 3, view_xview[view_current] + gauge_x_current, view_yview[view_current] + screen_get_height() - 29);
    draw_sprite_part(gauge_index, 0, 0, 0, sprite_get_width(gauge_index) * clock_up_percentage, sprite_get_height(gauge_index), view_xview[view_current] + gauge_x_current + 8, view_yview[view_current] + screen_get_height() - 29 + 12);
}
*/

// Reset:
draw_reset();
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw S4E2 HUD

// Exit if HUD isn't S4E2:
if (game_get_config("misc_hud") != 2)
{
    exit;
}

// Color:
draw_set_color(c_white);

// HUD:
draw_sprite(spr_hud_s4e2, 0, view_xview[view_current] + hud_x, view_yview[view_current] + hud_y);

// Score:
draw_set_font(global.font_score_s4e2);
draw_text(view_xview[view_current] + hud_x + 37, view_yview[view_current] + hud_y + 3, string_pad(stage_get_score(), 9));

// Time:
var time_x, time_y;

time_x = view_xview[view_current] + hud_x + 58;
time_y = view_yview[view_current] + hud_y + 18;

draw_set_font(global.font_time_s4e2);
draw_text(time_x, time_y, stage_get_time() div 3600);
draw_text(time_x + 10, time_y, ":");
draw_text(time_x + 16, time_y, string_pad((stage_get_time() div 60) mod 60, 2));
draw_text(time_x + 35, time_y, ";");
draw_text(time_x + 44, time_y, string_pad(floor(stage_get_time() * 1.667) mod 100, 2));

// Rings:
draw_set_font(global.font_hud_s4e2);

if ((sync_rate(game_get_time(), 8, 2) && stage_get_rings() == 0) || stage_get_rings() > 0)
{
    // Flash red:
    if (stage_get_rings() == 0)
    {
        draw_set_color(c_red);
    }
    
    draw_text(view_xview[view_current] + hud_x - 5, view_yview[view_current] + hud_y + 11, string_pad(stage_get_rings(), 3));
}

// Reset:
draw_reset();
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Status

// Exit if HUD isn't default or status is disabled:
if (game_get_config("misc_hud") != 1 || game_get_config("misc_status") == 0)
{
    exit;
}

var i, status_count;

// Reset count:
status_count = 0;

for (i = status_max; i > 0; i -= 1)
{
    var status_x;
    
    // Status x:
    status_id = i - 1;
    status_x = view_xview[view_current] + status_bar_x + status_width * (status_max - 1 - status_count);
    
    if (((game_get_config("misc_status") != 0 && status_active[status_id, 0] == true) || game_get_config("misc_status") == 2) && status_active[status_id, 1] == true)
    {
        // Shadow:
        draw_sprite_ext(spr_item_icon, status_icon[status_id], status_x + 1, view_yview[view_current] + 18, 1, 1, 0, c_black, 1);
        
        // Icon:
        image_blend = pick(game_get_config("misc_status") == 2 && status_active[status_id, 0] == false, c_white, c_gray);
        draw_sprite_ext(spr_item_icon, status_icon[status_id], status_x, view_yview[view_current] + 17, 1, 1, 0, image_blend, 1);
    }
    
    // Increase count:
    if ((game_get_config("misc_status") == 1 && status_active[status_id, 0] == true) || game_get_config("misc_status") == 2)
    {
        status_count += 1;
    }
}

// Reset:
draw_reset();
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Items

// Exit if list has been disabled or there's no item_grid:
if (!game_get_config("misc_feed") || item_grid == -1)
{
    exit;
}

var i;

for (i = 0; i < ds_grid_height(item_grid); i += 1)
{
    draw_sprite_ext(spr_item_icon, ds_grid_get(item_grid, 0, i), view_xview[view_current] + ds_grid_get(item_grid, 2, i), view_yview[view_current] + screen_get_height() - 33, 1, 1, 0, c_white, !item_hide);
}
