#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// HUD Initialization

// HUD variables:
hud_hide      =  true;

hud_index     = spr_hud;
hud_x_current = global.display_width;
hud_x_target  = 4;
hud_x_speed   = 0;
hud_x_factor  = 4;

hud_y         =  6;

// Air variables:
air_hide     =  false;
air_value    =  30;

air_x_current = -sprite_get_width(hud_index);
air_x_speed   =  0;

// Item feed variables:
item_hide  =  false;
item_feed  = -1;
item_alarm =  0;

// Status variables:
status_icon[STATUS_SHIELD]   =  ITEM_BASIC;
status_icon[STATUS_INVIN]    =  ITEM_INVIN;
status_icon[STATUS_SPEED]    =  ITEM_SPEED;
status_icon[STATUS_PANIC]    =  ITEM_PANIC;
status_icon[STATUS_SWAP]     =  ITEM_SWAP;
status_position              = -1;
status_speed                 =  0;
status_size                  =  2 + 2 * global.gameplay_debuffs;
status_count                 =  0;

status_active[STATUS_SHIELD, 0] =  0;
status_active[STATUS_SHIELD, 1] =  false;

status_active[STATUS_INVIN,  0] =  0;
status_active[STATUS_INVIN,  1] =  false;

status_active[STATUS_SPEED,  0] =  0;
status_active[STATUS_SPEED,  1] =  false;

status_active[STATUS_PANIC,  0] =  0;
status_active[STATUS_PANIC,  1] =  false;

status_active[STATUS_SWAP ,  0] =  0;
status_active[STATUS_SWAP ,  1] =  false;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Data

switch (global.misc_hud) {
    // S4E2:
    case 2:
        hud_index    = spr_hud_s4e2;
        hud_x_factor = 3;
        hud_y        = 14;
        break;

    // Default:
    default:
        hud_index    = spr_hud;
        hud_x_factor = 4;
        hud_y        = 6;
}

if (input_get_check(INP_TAG, CHECK_PRESSED)) {
    hud_hide = !hud_hide;
}

// HUD target:
if (hud_hide == true) {
    hud_x_target  = -(sprite_get_width(hud_index) + hud_x_factor);
    hud_x_factor *= 3;
} else {
    switch (global.misc_hud) {
        // S4E2:
        case 2:
            hud_x_target = 13;
            break;

        // Default:
        default:
            hud_x_target = 4;
            break;
    }
}
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Movement

// Don't bother if the stage is paused:
if (game_is_paused(ctrl_pause)) {
    exit;
}

// HUD:
if (hud_x_current != hud_x_target) {
    // Snap to target:
    if (hud_x_current == global.display_width) {
        hud_x_current = hud_x_target;
    }
    
    var hud_x_distance;
    
    // HUD distance:
    hud_x_distance = hud_x_target - hud_x_current;
    
    hud_x_speed    = ceil(abs(hud_x_distance) / hud_x_factor);
    hud_x_current += hud_x_speed * sign(hud_x_distance);
}

// Air:
if (global.misc_hud == 1) {
    var air_x_target;
    
    // Value:
    if (player_exists(0) != noone) {
        with (player_exists(0)) {
            // Hide:
            if (action_current != player_action_death) {
                if (physics_type == PHYS_UNDERWATER && status_shield != SHIELD_BUBBLE) {
                    other.air_hide = false;
                } else {
                    other.air_hide = true;
                }
                
                // Air value is always updated.
                other.air_value = air_remaining;
            }
        }
    } else {
        air_value = 30;
    }
    
    // Air target:
    if (air_hide == false) {
        air_x_target = hud_x_target;
    } else {
        air_x_target = -sprite_get_width(hud_index) - hud_x_factor;
    }
    
    if (air_x_current != air_x_target) {
        var air_x_distance, air_x_factor;
        
        // Air distance:
        air_x_distance = air_x_target - air_x_current;
        
        // Air factor:
        air_x_factor = hud_x_factor * (1 + (2 * (hud_hide == false && air_hide == true)));
        
        air_x_speed    = ceil(abs(air_x_distance) / air_x_factor);
        air_x_current += air_x_speed * sign(air_x_distance);
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Status

// Don't bother if the stage is paused:
if (game_is_paused(ctrl_pause)) {
    exit;
}

if (player_exists(0) != noone) {
    with (player_exists(0)) {
        // Shield:
        if (status_shield != SHIELD_NONE) {
            other.status_icon[STATUS_SHIELD] = status_shield + 2;
        } else {
            other.status_icon[STATUS_SHIELD] = ITEM_BASIC;
        }
        
        other.status_active[STATUS_SHIELD, 0] = (status_shield != SHIELD_NONE);
        other.status_active[STATUS_SHIELD, 1] = true;
        
        // Invincibility:
        other.status_icon[STATUS_INVIN]      = ITEM_INVIN;        
        other.status_active[STATUS_INVIN, 0] = (status_invin != INVIN_NONE);

        if (status_invin_alarm > 0 && status_invin_alarm <= 120) {
            other.status_active[STATUS_INVIN, 1] = sync_rate(status_invin_alarm, 2, 2);
        } else {
            other.status_active[STATUS_INVIN, 1] = true;
        }
        
        // Speed Up/Slow Down:
        if (status_speed == 2) {
            other.status_icon[STATUS_SPEED] = ITEM_SLOW;
        } else {
            other.status_icon[STATUS_SPEED] = ITEM_SPEED;
        }
        
        other.status_active[STATUS_SPEED, 0] = (status_speed != 0)

        if (status_speed_alarm > 0 && status_speed_alarm <= 120) {
            other.status_active[STATUS_SPEED, 1] = sync_rate(status_speed_alarm, 2, 2);
        } else {
            other.status_active[STATUS_SPEED, 1] = true;
        }
        
        // Panic:
        other.status_icon[STATUS_PANIC]      = ITEM_PANIC;
        other.status_active[STATUS_PANIC, 0] = status_panic;

        if (status_panic_alarm > 0 && status_panic_alarm <= 120) {
            other.status_active[STATUS_PANIC, 1] = sync_rate(status_panic_alarm, 2, 2);
        } else {
            other.status_active[STATUS_PANIC, 1] = true;
        }
        
        // Swap:
        other.status_icon[STATUS_SWAP]      = ITEM_SWAP;
        other.status_active[STATUS_SWAP, 0] = status_swap;

        if (status_swap_alarm > 0 && status_swap_alarm <= 120) {
            other.status_active[STATUS_SWAP, 1] = sync_rate(status_swap_alarm, 2, 2);
        } else {
            other.status_active[STATUS_SWAP, 1] = true;
        }
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Item Feed

// Don't bother if the stage is paused:
if (game_is_paused(ctrl_pause)) {
    exit;
}

// Create feed:
if (player_exists(0) != noone) {
    if (global.misc_feed == true && item_feed == -1) {
        item_feed = ds_list_create();
    }
}

// Update feed:
if (item_feed != -1) {
    if (ds_list_size(item_feed) != 0) {
        if (ds_list_find_value(item_feed, ds_list_size(item_feed) - 1) == global.display_width / 2+ (ds_list_size(item_feed) / 2 - 1) * 9 - (ds_list_size(item_feed) / 2 - 1) * 18) {
            if (item_alarm > 0) {
                item_alarm -= 1;
                
                // Hide:
                if (item_alarm <= 60) {
                    item_hide = sync_rate(item_alarm, 2, 2);
                } else {
                    item_hide = false;
                }
                
                // Clear feed:
                if (item_alarm <= 0) {
                    ds_list_clear(item_feed);
                }
            }
        }
    }
}
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Destroy Item Feed

if (item_feed != -1) {
    ds_list_destroy(item_feed);
    item_feed = -1;
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Default HUD

// Don't bother if HUD isn't default:
if (global.misc_hud != 1) {
    exit;
}

// Font:
draw_set_font(global.font_hud);
draw_set_color(c_white);
draw_set_halign(fa_left);

// Time:
draw_sprite(hud_index, 0, view_xview[view_current] + hud_x_current, view_yview[view_current] + hud_y);
draw_text(view_xview[view_current] + hud_x_current + 29, view_yview[view_current] + hud_y + 5, string_place_value(global.game_time div 3600, 2));
draw_text(view_xview[view_current] + hud_x_current + 54, view_yview[view_current] + hud_y + 5, string_place_value((global.game_time div 60) mod 60, 2));
draw_text(view_xview[view_current] + hud_x_current + 79, view_yview[view_current] + hud_y + 5, string_place_value(floor(global.game_time * 1.667) mod 100, 2));

// Rings
draw_sprite(hud_index, 1, view_xview[view_current] + hud_x_current, view_yview[view_current] + hud_y + 26);
draw_text(view_xview[view_current] + hud_x_current + 29, view_yview[view_current] + hud_y + 31, string_place_value(global.game_rings, 3));

// Air:
draw_sprite(hud_index, 2, view_xview[view_current] + air_x_current, view_yview[view_current] + hud_y + 52);
draw_text(view_xview[view_current] + air_x_current + 29, view_yview[view_current] + hud_y + 57, string_place_value(air_value, 2));

/*
// Timer:
draw_sprite(spr_hud, 0, view_xview[view_current] + hud_position, view_yview[view_current] + 6);
draw_text(view_xview[view_current] + hud_position + 29, view_yview[view_current] + 11, string_place_value(global.game_time div 3600, 2));
draw_text(view_xview[view_current] + hud_position + 54, view_yview[view_current] + 11, string_place_value((global.game_time div 60) mod 60, 2));
draw_text(view_xview[view_current] + hud_position + 79, view_yview[view_current] + 11, string_place_value(floor(global.game_time * 1.667) mod 100, 2));

// Rings:
draw_sprite(spr_hud, 1, view_xview[view_current] + hud_position, view_yview[view_current] + 32);
draw_text(view_xview[view_current] + hud_position + 29, view_yview[view_current] + 37, string_place_value(global.game_rings, 3));

// Air:
draw_sprite(spr_hud, 2, view_xview[view_current] + air_position, view_yview[view_current] + 58);
draw_text(view_xview[view_current] + air_position + 29, view_yview[view_current] + 63, string_place_value(air_value, 2));

// Action gauge:
draw_sprite(spr_hud, 3, view_xview[view_current] + hud_position + 6, view_yview[view_current] + global.display_height - 29);
draw_sprite_part(spr_action_gauge, 0, 0, 0, sprite_get_width(spr_action_gauge) * ((global.player_instance[0].clock_up_duration - global.player_instance[0].clock_up_timer)/global.player_instance[0].clock_up_duration), sprite_get_height(spr_action_gauge), view_xview[view_current] + hud_position + 6 + 8, view_yview[view_current] + global.display_height - 29 + 12);
*/

// Reset draw variables:
draw_set_color(c_white);
draw_set_alpha(1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw S4E2 HUD

// Don't bother if HUD isn't S4E2:
if (global.misc_hud != 2) {
    exit;
}

// Font:
draw_set_color(c_white);
draw_set_halign(fa_left);

// HUD:
draw_sprite(spr_hud_s4e2, 0, view_xview[view_current] + hud_x_current, view_yview[view_current] + hud_y);

// Score:
draw_set_font(global.font_score_s4e2);
draw_text(view_xview[view_current] + hud_x_current + 37, view_yview[view_current] + hud_y + 3, string_place_value(global.game_score, 9));

// Time:
draw_set_font(global.font_time_s4e2);
draw_text(view_xview[view_current] + hud_x_current + 58, view_yview[view_current] + hud_y + 18, global.game_time div 3600);
draw_text(view_xview[view_current] + hud_x_current + 58 + 10, view_yview[view_current] + hud_y + 18, ":");
draw_text(view_xview[view_current] + hud_x_current + 58 + 16, view_yview[view_current] + hud_y + 18, string_place_value((global.game_time div 60) mod 60, 2));
draw_text(view_xview[view_current] + hud_x_current + 58 + 35, view_yview[view_current] + hud_y + 18, ";");
draw_text(view_xview[view_current] + hud_x_current + 58 + 44, view_yview[view_current] + hud_y + 18, string_place_value(floor(global.game_time * 1.667) mod 100, 2));

// Rings:
draw_set_font(global.font_hud_s4e2);

if ((sync_rate(global.object_time, 8, 2) && global.game_rings == 0) || global.game_rings > 0) {
    // Flash red:
    if (global.game_rings == 0) {
        draw_set_color(c_red);
    } else {
        draw_set_color(c_white);
    }

    draw_text(view_xview[view_current] + hud_x_current - 5, view_yview[view_current] + hud_y + 11, string_place_value(global.game_rings, 3));
}

// Reset draw variables:
draw_set_color(c_white);
draw_set_alpha(1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Status

// Don't bother if HUD isn't default or status is disabled:
if (global.misc_hud != 1 || global.misc_status == 0) {
    exit;
}

// Reset status count:
status_count = 0;

for (i = status_size; i >= 0; i -= 1) {
    if (((global.misc_status == 1 && status_active[i, 0] == true) || global.misc_status == 2) && status_active[i, 1] == true) {
        // Shadow:
        draw_sprite_ext(spr_items, 0, view_xview[view_current] + view_wview[view_current] - hud_x_current - 8 - (sprite_get_width(spr_items) + 2) * status_count, view_yview[view_current] + 18, 1, 1, 0, c_black, 1);

        // Icons:
        draw_sprite_ext(spr_items, status_icon[i], view_xview[view_current] + view_wview[view_current] - hud_x_current - 9 - (sprite_get_width(spr_items) + 2) * status_count, view_yview[view_current] + 17, 1, 1, 0, c_white, 1);

        // Gray out:
        if (global.misc_status == 2) {
            if (status_active[i, 0] == false) {
                draw_sprite_ext(spr_items, status_icon[i], view_xview[view_current] + view_wview[view_current] - hud_x_current - 9 - (sprite_get_width(spr_items) + 2) * status_count, view_yview[view_current] + 17, 1, 1, 0, c_gray, 0.6);
            }
        }
    }

    // Increase status count:
    if ((global.misc_status == 1 && status_active[i, 0] == true) || global.misc_status == 2) {
        status_count += 1;
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Item Feed

// Don't bother if feed has been disabled:
if (global.misc_hud == 0) {
    exit;
}

// Item feed:
if (item_feed != -1) {
    if (ds_list_size(item_feed) != 0) {
        for (i = 0; i < ds_list_size(item_feed); i += 2) {
            var item_target, item_speed;

            draw_set_color(c_white);

            item_target = global.display_width / 2 + (ds_list_size(item_feed) / 2 - 1) * 9 - i / 2 * 18; // No, I do not know what I was thinking with coding this. Nor do I know why it works.
            item_speed  = ceil(abs(ds_list_find_value(item_feed, i + 1) - item_target) / 4);

            if (ds_list_find_value(item_feed, i + 1) != item_target) {
                ds_list_replace(item_feed, i + 1, ds_list_find_value(item_feed, i + 1) + item_speed);
            }
            
            draw_sprite_ext(spr_items, ds_list_find_value(item_feed, i), view_xview[view_current] + ds_list_find_value(item_feed, i + 1), view_yview[view_current] + view_hview[view_current] - 33, 1, 1, 0, c_white, !item_hide);
        }
    }
}
