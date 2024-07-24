#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Ring Initialization

event_inherited();

// Image speed:
image_speed = 0;

// Size:
main_left     = 8;
main_right    = 7;
main_top      = 8;
main_bottom   = 7;

// Dropped:
dropped = false;
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animate

// Don't bother if the stage is paused:
if (game_is_paused(ctrl_pause)) {
    exit;
}

image_index = sync_rate(global.object_time, 8 / (1 + dropped == true), sprite_get_number(sprite_index));
