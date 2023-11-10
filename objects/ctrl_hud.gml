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

// Status effect variables:
status_effect[STATUS_SHIELD] =  0;
status_effect[STATUS_MUTEKI] =  0;
status_effect[STATUS_SPEED]  =  0;
status_effect[STATUS_PANIC]  =  0;
status_effect[STATUS_SWAP]   =  0;
status_position              = -1;
status_speed                 =  0;
status_size                  =  2 + 2 * global.gameplay_debuffs;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Update Position

// HUD position:
if(hide == false) {
    if(hud_position == -1) hud_position = hud_target;
    else if(hud_position < hud_target) {
        hud_speed     = ceil(abs(hud_position - hud_target) / hud_factor);
        hud_position += hud_speed;
    } else {
        hud_speed    = 0;
        hud_position = hud_target;
    }
} else {
    if(hud_position == -1) hud_position = hud_start;
    else if(hud_position != hud_start) {
        hud_speed     = ceil(abs(hud_position - hud_start) / (hud_factor * 3));
        hud_position -= hud_speed;
    } else {
        hud_speed    = 0;
        hud_position = hud_start;
    }
}

// Air position:
if(global.misc_hud == 1) {
    if(player_exists(0)) {
        // Air target:
        if(global.player_instance[0].action_state != ACTION_DEATH) {
            if(global.player_instance[0].physics_type == PHYS_UNDERWATER) {
                if(global.player_instance[0].shield_data == SHIELD_BUBBLE) air_hide = true;
                else air_hide = false;
            } else air_hide = true;
        }

        // Air value:
        air_value = global.player_instance[0].air_remaining;

        if(air_hide == false) {
            if(air_position < hud_position) {
                if(hud_speed == 0) air_speed = ceil(abs(air_position - hud_position) / hud_factor);
                else air_speed = hud_speed;

                air_position += air_speed;
            } else {
                air_speed    = hud_speed;
                air_position = hud_position;
            }
        } else {
            if(air_position != hud_start) {
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
/// Status Effects

if(player_exists(0)) {
    // Only update active status effects:
    if(global.misc_status == 1) {
        // Shield:
        if(global.player_instance[0].shield_data != 0) status_effect[STATUS_SHIELD] = global.player_instance[0].shield_data + 2;
        else status_effect[STATUS_SHIELD] = 0;

        // Invincibility:
        if(global.player_instance[0].invincibility_type != 0) status_effect[STATUS_MUTEKI] = ITEM_MUTEKI;
        else status_effect[STATUS_MUTEKI] = 0;

        // Speed Up/Slow Down:
        if(global.player_instance[0].speed_shoe_type == 1) status_effect[STATUS_SPEED] = ITEM_SPEED;
        else if(global.player_instance[0].speed_shoe_type == 2) status_effect[STATUS_SPEED] = ITEM_SLOW;
        else status_effect[STATUS_SPEED] = 0;

        // Panic:
        if(global.player_instance[0].status_panic == true) status_effect[STATUS_PANIC] = ITEM_PANIC;
        else status_effect[STATUS_PANIC] = 0;

        // Swap:
        if(global.player_instance[0].status_swap == true) status_effect[STATUS_SWAP] = ITEM_SWAP;
        else status_effect[STATUS_SWAP] = 0;
    }

    // Update all status effects:
    else if(global.misc_status == 2) {
        // Shield:
        if(global.player_instance[0].shield_data != 0) status_effect[STATUS_SHIELD] = global.player_instance[0].shield_data + 2;
        else status_effect[STATUS_SHIELD] = ITEM_BASIC;

        // Invincibility:
        status_effect[STATUS_MUTEKI] = ITEM_MUTEKI;

        // Speed Up/Slow Down:
        if(global.player_instance[0].speed_shoe_type == 2) status_effect[STATUS_SPEED] = ITEM_SLOW;
        else status_effect[STATUS_SPEED] = ITEM_SPEED;

        // Panic:
        status_effect[STATUS_PANIC] = ITEM_PANIC;

        // Swap:
        status_effect[STATUS_SWAP] = ITEM_SWAP;
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Item Feed

if(player_exists(0)) {
    if(global.misc_feed == true && item_feed == -1) item_feed = ds_list_create();
}

if(item_feed != -1) {
    if(ds_list_size(item_feed) != 0) {
        if(ds_list_find_value(item_feed, ds_list_size(item_feed) - 1) == global.display_width / 2+ (ds_list_size(item_feed) / 2 - 1) * 9 - (ds_list_size(item_feed) / 2 - 1) * 18) {
            item_timer = min(item_timer + 1, item_duration);

            if(item_timer == item_duration) ds_list_clear(item_feed);
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

if(item_feed != -1) {
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

if(global.misc_hud == 1) {
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
/// Draw Status Effects

// Don't bother if HUD has been disabled:
if(global.misc_hud == 0) exit;

if(player_exists(0)) {
    var status_count, player_muteki, player_shoes, player_panic, player_swap;
    
    status_count  = 0;
    player_muteki = (global.player_instance[0].invincibility_alarm == -1 || global.player_instance[0].invincibility_alarm > 120 || (global.player_instance[0].invincibility_alarm <= 120 && global.player_instance[0].invincibility_alarm mod 5));
    player_shoes  = (global.player_instance[0].speed_shoe_alarm == -1 || global.player_instance[0].speed_shoe_alarm > 120 || (global.player_instance[0].speed_shoe_alarm <= 120 && global.player_instance[0].speed_shoe_alarm mod 5));
    player_panic  = (global.player_instance[0].status_panic_alarm == -1 || global.player_instance[0].status_panic_alarm > 120 || (global.player_instance[0].status_panic_alarm <= 120 && global.player_instance[0].status_panic_alarm mod 5));
    player_swap   = (global.player_instance[0].status_swap_alarm == -1 || global.player_instance[0].status_swap_alarm > 120 || (global.player_instance[0].status_swap_alarm <= 120 && global.player_instance[0].status_swap_alarm mod 5));
    
    for(i = status_size; i >= 0; i -= 1) {
        if((global.misc_status == 1 && status_effect[i] != 0) || global.misc_status == 2) {
            if((i != STATUS_MUTEKI && i != STATUS_SPEED && i != STATUS_PANIC && i != STATUS_SWAP) ||
                (i == STATUS_MUTEKI && player_muteki) || (i == STATUS_SPEED && player_shoes) || (i == STATUS_PANIC && player_panic) || (i == STATUS_SWAP && player_swap)) {
                // Shadow:
                draw_sprite_ext(spr_items, 0, view_xview[view_current] + view_wview[view_current] - hud_position - 8 - (sprite_get_width(spr_items) + 2) * status_count, view_yview[view_current] + 18, 1, 1, 0, c_black, 1);

                // Icons:
                draw_sprite_ext(spr_items, status_effect[i], view_xview[view_current] + view_wview[view_current] - hud_position - 9 - (sprite_get_width(spr_items) + 2) * status_count, view_yview[view_current] + 17, 1, 1, 0, c_white, 1);
            }

            // Gray out:
            if(global.misc_status == 2) {
                if((i == STATUS_SHIELD && global.player_instance[0].shield_data == 0) ||
                    (i == STATUS_MUTEKI && global.player_instance[0].invincibility_type == 0) ||
                    (i == STATUS_SPEED && global.player_instance[0].speed_shoe_type == 0) ||
                    (i == STATUS_PANIC && global.player_instance[0].status_panic == false) ||
                    (i == STATUS_SWAP && global.player_instance[0].status_swap == false)) {
                    draw_sprite_ext(spr_items, status_effect[i], view_xview[view_current] + view_wview[view_current] - hud_position - 9 - (sprite_get_width(spr_items) + 2) * status_count, view_yview[view_current] + 17, 1, 1, 0, c_gray, 0.6);
                }
            }

            // Increase status count:
            if((global.misc_status == 1 && status_effect[i] != 0) || global.misc_status == 2) status_count += 1;
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
if(global.misc_hud == 0) exit;

// Item feed:
if(item_feed != -1) {
    if(ds_list_size(item_feed) != 0) {
        for(i = 0; i < ds_list_size(item_feed); i += 2) {
            var item_target, item_speed;

            draw_set_color(c_white);

            item_target = global.display_width / 2 + (ds_list_size(item_feed) / 2 - 1) * 9 - i / 2 * 18; // No, I do not know what I was thinking with coding this. Nor do I know why it works.
            item_speed  = ceil(abs(ds_list_find_value(item_feed, i + 1) - item_target) / 4);

            if(ds_list_find_value(item_feed, i + 1) != item_target) ds_list_replace(item_feed, i + 1, ds_list_find_value(item_feed, i + 1) + item_speed);

            if(item_timer < 60 || (item_timer >= 60 && item_timer mod 5)) draw_sprite(spr_items, ds_list_find_value(item_feed, i), view_xview[view_current] + ds_list_find_value(item_feed, i + 1), view_yview[view_current] + view_hview[view_current] - 33);
        }
    }
}
