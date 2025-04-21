#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Chopper Initialization

event_inherited();
hitbox_set_hurtbox(17, 8, 15, 14);
hitbox_set_attackbox(9, 6, 15, 12);
sequence_init(seq_chopper_move);
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animation

if (game_ispaused(mnu_pause)) exit;

sequence_speed = game_get_speed();

if (sequence_index == seq_chopper_move)
{
    x += sequence_speed * image_xscale;
    if (enemy_get_border_hor()) sequence_set(seq_chopper_move_turn);
}

sequence_execute();
