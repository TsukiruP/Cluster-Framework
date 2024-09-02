#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Ring Initialization

event_inherited();

// Hurtbox:
set_hurtbox(8, 8, 7, 7, 0, 0);

// Reaction:
reaction_index = player_reaction_ring;

// Dropped:
dropped = false;
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

image_index = sync_rate(global.object_time, 8 / (1 + (dropped == true)), sprite_get_number(sprite_index));
