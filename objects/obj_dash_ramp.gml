#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Dash Ramp Initialization

event_inherited();
hurtbox_set(32, 16, 32, 16);
hitbox_set(6, 16, 4, 0, 25)
reaction_index = player_reaction_dash_ramp;
shape = SHAPE_SLANT;
mask = false;
sequence_init(sequence_dash_ramp);
sfx_alarm = 0;
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Alarm

if (sfx_alarm > 0) sfx_alarm -= 1;
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animation

if (game_ispaused(mnu_pause)) exit;

sequence_speed = game_get_speed();

if (script_exists(sequence_index))
{
    sequence_update();
    script_execute(sequence_index);
}
