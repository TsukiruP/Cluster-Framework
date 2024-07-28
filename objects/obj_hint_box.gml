#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Hint Box Initialization

event_inherited();

// Size:
main_left     = 21;
main_right    = 19;
main_top      = 17;
main_bottom   = 16;
main_offset_x = 0;
main_offset_y = 31;

// Draw variables:
draw_y = 0;
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
        // Look down:
        if (ctrl_text.text_clear == true && player_handle.animation_current == "look" && player_handle.animation_reverse == false) {
            player_handle.animation_trigger = true;
            player_handle.animation_reverse = true;
        }

        // Clear text:
        if (player_handle.hint_wanted == false) {
            ctrl_text.text_clear = true;
        }
    }
}

// Float:
draw_y = y + sin(floor(global.object_time) * 0.03) * 2;
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Hint Box

// Hint Box:
draw_sprite_ext(sprite_index, instance_exists(player_handle) + 1, x, draw_y, image_xscale, 1, 0, c_white, 1);

// Size:
event_inherited();
