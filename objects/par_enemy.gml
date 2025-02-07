#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Enemy Initialization

event_inherited();
attackbox_element = ELEM_NONE;
reaction_index = player_reaction_enemy;
class = ENE_BASIC;
vitality = 3;
invin_alarm = 0;
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Invincibility

if (game_ispaused(mnu_pause)) exit;

if (invin_alarm > 0) invin_alarm -= 1;
