#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Afterimage Initialization

image_speed = 0;
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Fade Out

// Exit if the stage is paused:
if (game_ispaused(mgr_pause))
{
    exit;
}

if (image_alpha > 0)
{
    image_alpha -= 0.1;
}
else
{
    instance_destroy();
}
