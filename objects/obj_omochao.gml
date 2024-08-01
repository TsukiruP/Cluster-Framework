#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Omochao Initialization

event_inherited();

// Main:
main_left     = 11;
main_right    = 10;
main_top      = 11;
main_bottom   = 10;

main_offset_x = 2;
main_offset_y = 5;

// Draw variables:
draw_x = x;
draw_y = y;
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animate

// Exit if the stage is paused:
if (game_ispaused(ctrl_pause)) {
    exit;
}

// Match player:
if (instance_exists(player_handle)) {
    if (player_handle.hint_wanted == true) {
        // Put down Omochao:
        if (ctrl_text.text_clear == true && player_handle.animation_current == "omochao" && player_handle.animation_reverse == false) {
            player_handle.animation_trigger = true;
            player_handle.animation_reverse = true;
        }

        // Change sprite index:
        switch (player_handle.character_id) {
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
        // Reset sprite index:
        sprite_index = spr_omochao_idle;
    }
}

// Reset sprite index:
if (player_handle == noone && sprite_index != spr_omochao_idle) {
    sprite_index = spr_omochao_idle;
}

// Idle:
if (sprite_index == spr_omochao_idle) {
    // Image index:
    image_index = sync_rate(global.object_time, 3, sprite_get_number(sprite_index));

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
    image_xscale = player_handle.image_xscale;
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

// Collision:
event_inherited();
