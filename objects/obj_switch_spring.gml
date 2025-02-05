#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Spring Initialization

event_inherited();
collision = false;
switch_id = noone;
switch_active = false;
switch_time = 0;
sequence_init();
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Active

if (game_ispaused(mnu_pause)) exit;

with (switch_id)
{
    other.switch_active = active;
    other.switch_time = target_time;
}
