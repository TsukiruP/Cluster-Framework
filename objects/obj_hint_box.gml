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
                    text_message_set("Hint Boxes are meant to provide information about the environment. This ranges from how to deal with enemies or gimmicks, or how Casinopolis is only open at night.");
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

// Don't bother if the stage is paused:
if (game_paused(ctrl_pause)) exit;

// Match player:
if (player_handle != noone) {
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
    } else {
        // Reset current:
        event_inherited();
    }
}

// Reset:
if (player_handle == noone && hint_current != -1) {
    // Reset current:
    event_inherited();
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
draw_sprite_ext(sprite_index, (player_handle != noone) + 1, x, draw_y, image_xscale, 1, 0, c_white, 1);

// Size:
event_inherited();
