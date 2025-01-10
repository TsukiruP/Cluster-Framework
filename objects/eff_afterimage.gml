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

if (game_ispaused(mnu_pause))
{
    exit;
}

if (image_alpha > 0)
{
    image_alpha -= 0.1;

    if (image_alpha == 0)
    {
        instance_destroy();
    }
}
