#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Player Effect Initialization

event_inherited();

player_handle = noone;
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Attach

if (instance_exists(player_handle))
{
    x = floor(player_handle.x);
    y = floor(player_handle.y);
}
else
{
    instance_destroy();
}

event_inherited();
