#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Omochao Initialization

event_inherited();

// Size:
main_left     = 11;
main_right    = 10;
main_top      = 11;
main_bottom   = 10;
main_offset_x = 2;
main_offset_y = 5;

// Draw variables:
draw_x = x;
draw_y = y;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Activate

if (player_handle != noone) {
    if (player_handle.hint_wanted == true) {
        // Check current:
        if (hint_current != hint_target) {
            // Update text controller:
            switch (hint_target) {
                // Default:
                default:
                    text_message_set("Hello! I'm Omochao! Listen to me carefully and you will learn a lot.");
            }

            // Set current:
            hint_current = hint_target;
        }
    }
}
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animate

// Don't bother if the game is paused:
if (game_paused(ctrl_pause)) exit;

// Match player:
if (player_handle != noone) {
    if (player_handle.hint_wanted == true) {
        // Put down Omochao:
        if (ctrl_text.text_clear == true && player_handle.animation_current == "omochao" && player_handle.animation_reverse == false) {
            player_handle.animation_trigger = true;
            player_handle.animation_reverse = true;
        }
    
        // Change sprite index:
        switch (player_handle.character_data) {
            // Sonic:
            case CHAR_SONIC:
                sprite_index = spr_omochao_sonic;
                break;
        }
        
        // Clear text:
        if (player_handle.hint_wanted == false) {
            ctrl_text.text_clear = true;
        }
    } else {
        // Reset current:
        event_inherited();
        
        // Reset sprite index:
        sprite_index = spr_omochao_idle;
    }
}

// Reset:
if (player_handle == noone && hint_current != -1) {
    // Reset current:
    event_inherited();
    
    // Reset sprite index:
    sprite_index = spr_omochao_idle;
}

// Idle:
if (sprite_index == spr_omochao_idle) {
    // Image index:
    image_index  = floor(global.object_time) div 3; 
    
    // Draw coordinates:
    draw_x = x;
    draw_y = y;
    
    // Image xscale:
    image_xscale = 1;
}

// Picked up:
else {
    // Image index:
    image_index = player_handle.image_index;
    
    // Draw coordinates:
    draw_x = floor(player_handle.x);
    draw_y = floor(player_handle.y);
    
    // Image xscale:
    image_xscale = player_handle.animation_direction;
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Omochao

// Omochao:
draw_sprite_ext(sprite_index, image_index, draw_x + (image_xscale < 0), draw_y, image_xscale, 1, 0, c_white, 1);

// Size:
event_inherited();
