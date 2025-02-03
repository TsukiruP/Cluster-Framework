#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Player Effect Initialization

event_inherited();
player_id = noone;
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Attach

event_inherited();

if (instance_exists(player_id))
{
    x = floor(player_id.x);
    y = floor(player_id.y);
}
else instance_destroy();
