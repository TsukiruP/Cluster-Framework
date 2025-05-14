#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Spinner Initialization

event_inherited();
spanner = false;
hitbox_set_hurtbox(20, 19, 20, 4);
hitbox_set_attackbox(8, 18, 7, 4);
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animation

if (game_ispaused(mnu_pause)) exit;

sequence_speed = game_get_speed();
sequence_execute();
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Field Initialization

//field spanner: false

/*preview
sprite_index = Sprite(pick(Field("spanner", 0), "spr_spinner", "spr_spanner"), 0);
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Sequence Initialization

sequence_init(pick(spanner, seq_spinner, seq_spanner));
