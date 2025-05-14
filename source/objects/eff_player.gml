#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Player Effect Initialization

event_inherited();
player_inst = noone;
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Attach

event_inherited();

if (instance_exists(player_inst))
{
    x = floor(player_inst.x);
    y = floor(player_inst.y);
}
else instance_destroy();
