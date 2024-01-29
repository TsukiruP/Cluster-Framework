#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// HUD Initialization

// State variables:
hide = true;

// HUD variables:
hud_sprite   =  spr_hud;
hud_target   =  4;
hud_factor   =  4;
hud_position = -1;
hud_start    = -sprite_get_width(spr_hud) - hud_factor * 2;
hud_speed    =  0;

// Air variables:
air_hide     =  false;
air_value    =  30;
air_position = -sprite_get_width(spr_hud);
air_speed    =  0;

// Item feed variables:
item_feed     = -1;
item_timer    =  0;
item_duration =  110;

// Status variables:
status_icon[STATUS_SHIELD]   =  ITEM_BASIC;
status_icon[STATUS_MUTEKI]   =  ITEM_MUTEKI;
status_icon[STATUS_SPEED]    =  ITEM_SPEED;
status_icon[STATUS_PANIC]    =  ITEM_PANIC;
status_icon[STATUS_SWAP]     =  ITEM_SWAP;
status_position              = -1;
status_speed                 =  0;
status_size                  =  2 + 2 * global.gameplay_debuffs;
status_count                 =  0;

status_active[STATUS_SHIELD] =  0;
status_active[STATUS_MUTEKI] =  0;
status_active[STATUS_SPEED]  =  0;
status_active[STATUS_PANIC]  =  0;
status_active[STATUS_SWAP]   =  0;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Update Position

// HUD position:
if (hide == false) {
    if (hud_position == -1) hud_position = hud_target;
    else if (hud_position < hud_target) {
        hud_speed     = ceil(abs(hud_position - hud_target) / hud_factor);
        hud_position += hud_speed;
    } else {
        hud_speed    = 0;
        hud_position = hud_target;
    }
} else {
    if (hud_position == -1) hud_position = hud_start;
    else if (hud_position != hud_start) {
        hud_speed     = ceil(abs(hud_position - hud_start) / (hud_factor * 3));
        hud_position -= hud_speed;
    } else {
        hud_speed    = 0;
        hud_position = hud_start;
    }
}


// Air:
if (global.misc_hud == 1) {
    if (player_exists(0) != noone) {
        // Hide air:
        with (player_exists(0)) {
            if (action_state != ACTION_DEATH) {
                // Show air timer only if underwater and don't have the bubble shield:
                if (physics_type == PHYS_UNDERWATER && shield_data != SHIELD_BUBBLE) other.air_hide = false;
                else other.air_hide  = true;
                
                // Update air value:
                other.air_value = air_remaining;
            }
        }
        
        // Air position:
        if (air_hide == false) {
            if (air_position < hud_position) {
                if (hud_speed == 0) air_speed = ceil(abs(air_position - hud_position) / hud_factor);
                else air_speed = hud_speed;

                air_position += air_speed;
            } else {
                air_speed    = hud_speed;
                air_position = hud_position;
            }
        } else {
            if (air_position != hud_start) {
                air_speed     = ceil(abs(air_position - hud_start) / (hud_factor * 3));
                air_position -= air_speed;
            } else {
                air_speed    = 0;
                air_position = hud_start;
            }
        }
    } else {
        air_value    = 30;
        air_position = hud_position;
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Status Icons

if (player_exists(0) != noone) {
    with (player_exists(0)) {
        // Shield:
        if (shield_data != SHIELD_NONE) other.status_icon[STATUS_SHIELD] = shield_data + 2;
        else other.status_icon[STATUS_SHIELD] = ITEM_BASIC;

        // Invincibility:
        other.status_icon[STATUS_MUTEKI] = ITEM_MUTEKI;

        // Speed Up/Slow Down:
        if (speed_shoe_type == 2) other.status_icon[STATUS_SPEED] = ITEM_SLOW;
        else other.status_icon[STATUS_SPEED] = ITEM_SPEED;

        // Panic:
        other.status_icon[STATUS_PANIC] = ITEM_PANIC;

        // Swap:
        other.status_icon[STATUS_SWAP] = ITEM_SWAP;
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Item Feed


if (player_exists(0) != noone) {
    if (global.misc_feed == true && item_feed == -1) item_feed = ds_list_create();
}

if (item_feed != -1) {
    if (ds_list_size(item_feed) != 0) {
        if (ds_list_find_value(item_feed, ds_list_size(item_feed) - 1) == global.display_width / 2+ (ds_list_size(item_feed) / 2 - 1) * 9 - (ds_list_size(item_feed) / 2 - 1) * 18) {
            item_timer = min(item_timer + 1, item_duration);

            if (item_timer == item_duration) ds_list_clear(item_feed);
        }
    }
}
#define Other_3
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Destroy Item Feed

event_user(0);
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Destroy Item Feed

event_user(0);
#define Other_10
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
/// Draw HUD

if (global.misc_hud == 1) {
    // Font:
    draw_set_font(global.font_hud);
    draw_set_color(c_white);
    draw_set_halign(fa_left);

    // Timer:
    draw_sprite(spr_hud, 0, view_xview[view_current] + hud_position, view_yview[view_current] + 6);
    draw_text(view_xview[view_current] + hud_position + 29, view_yview[view_current] + 11, string_place_value(floor(global.stage_time / 60000), 2));
    draw_text(view_xview[view_current] + hud_position + 54, view_yview[view_current] + 11, string_place_value(floor(global.stage_time / 1000) mod 60, 2));
    draw_text(view_xview[view_current] + hud_position + 79, view_yview[view_current] + 11, string_place_value(floor(global.stage_time / 10) mod 100, 2));

    // Rings:
    draw_sprite(spr_hud, 1, view_xview[view_current] + hud_position, view_yview[view_current] + 32);
    draw_text(view_xview[view_current] + hud_position + 29, view_yview[view_current] + 37, string_place_value(global.stage_rings, 3));

    // Air:
    draw_sprite(spr_hud, 2, view_xview[view_current] + air_position, view_yview[view_current] + 58);
    draw_text(view_xview[view_current] + air_position + 29, view_yview[view_current] + 63, string_place_value(air_value, 2));

    // Action gauge:
    draw_sprite(spr_hud, 3, view_xview[view_current] + hud_position + 6, view_yview[view_current] + global.display_height - 29);
    draw_sprite_part(spr_action_gauge, 0, 0, 0, sprite_get_width(spr_action_gauge) * ((global.player_instance[0].clock_up_duration - global.player_instance[0].clock_up_timer)/global.player_instance[0].clock_up_duration), sprite_get_height(spr_action_gauge), view_xview[view_current] + hud_position + 6 + 8, view_yview[view_current] + global.display_height - 29 + 12);
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

// Don't bother if HUD has been disabled:
if (global.misc_hud == 0) exit;

if (player_exists(0) != noone) {
    // Reset status count:
    status_count = 0;
    
    with (player_exists(0)) {
        other.status_active[STATUS_SHIELD] = (shield_data != 0);
        other.status_active[STATUS_MUTEKI] = (invincibility_alarm > 120 || (invincibility_alarm > -1 && invincibility_alarm <= 120 && invincibility_alarm mod 5));
        other.status_active[STATUS_SPEED]  = (speed_shoe_alarm > 120 || (speed_shoe_alarm > -1 && speed_shoe_alarm <= 120 && speed_shoe_alarm mod 5));
        other.status_active[STATUS_PANIC]  = (status_panic_alarm > 120 || (status_panic_alarm > -1 && status_panic_alarm <= 120 && status_panic_alarm mod 5));;
        other.status_active[STATUS_SWAP]   = (status_swap_alarm > 120 || (status_swap_alarm > -1 && status_swap_alarm <= 120 && status_swap_alarm mod 5));;
    }
    
    for (i = status_size; i >= 0; i -= 1) {
        if ((global.misc_status == 1 && status_active[i]) || global.misc_status == 2) {
            // Shadow:
            draw_sprite_ext(spr_items, 0, view_xview[view_current] + view_wview[view_current] - hud_position - 8 - (sprite_get_width(spr_items) + 2) * status_count, view_yview[view_current] + 18, 1, 1, 0, c_black, 1);

            // Icons:
            draw_sprite_ext(spr_items, status_icon[i], view_xview[view_current] + view_wview[view_current] - hud_position - 9 - (sprite_get_width(spr_items) + 2) * status_count, view_yview[view_current] + 17, 1, 1, 0, c_white, 1);
            
            // Gray out:
            if (global.misc_status == 2) {
                if (status_active[i] == false) {
                    draw_sprite_ext(spr_items, status_icon[i], view_xview[view_current] + view_wview[view_current] - hud_position - 9 - (sprite_get_width(spr_items) + 2) * status_count, view_yview[view_current] + 17, 1, 1, 0, c_gray, 0.6);
                }
            }
            
            // Increase status count:
            if ((global.misc_status == 1 && status_icon[i] != 0) || global.misc_status == 2) status_count += 1;
        }
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Item Feed

// Don't bother if HUD has been disabled:
if (global.misc_hud == 0) exit;

// Item feed:
if (item_feed != -1) {
    if (ds_list_size(item_feed) != 0) {
        for (i = 0; i < ds_list_size(item_feed); i += 2) {
            var item_target, item_speed;

            draw_set_color(c_white);

            item_target = global.display_width / 2 + (ds_list_size(item_feed) / 2 - 1) * 9 - i / 2 * 18; // No, I do not know what I was thinking with coding this. Nor do I know why it works.
            item_speed  = ceil(abs(ds_list_find_value(item_feed, i + 1) - item_target) / 4);

            if (ds_list_find_value(item_feed, i + 1) != item_target) ds_list_replace(item_feed, i + 1, ds_list_find_value(item_feed, i + 1) + item_speed);

            if (item_timer < 60 || (item_timer >= 60 && item_timer mod 5)) draw_sprite(spr_items, ds_list_find_value(item_feed, i), view_xview[view_current] + ds_list_find_value(item_feed, i + 1), view_yview[view_current] + view_hview[view_current] - 33);
        }
    }
}
