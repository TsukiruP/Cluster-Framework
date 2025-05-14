#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Spring Initialization

event_inherited();
reaction_index = player_reaction_spring;
angle = 0;
active = false;
force = 8;
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

if (game_ispaused(mnu_pause) || object_is_ancestor(object_index, par_dash_ring)) exit;

if (active) sequence_execute();
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Field Initialization

//field force: number
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Angle Initialization

if (sign(image_xscale) == -1) angle = angle_wrap(180 - angle);
if (sign(image_yscale) == -1) angle = angle_wrap(360 - angle);
