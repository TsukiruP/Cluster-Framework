#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Splash Initialization

event_inherited();

depth = -11;
sequence_set(sequence_splash_5);
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animation

event_inherited();

if (game_ispaused(mnu_pause))
{
    exit;
}

if (player_handle.waterfall_draw != true)
{
    instance_destroy();
}

player_handle.waterfall_draw = false;
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Splash

if (sprite_exists(sprite_index))
{
    draw_sprite_ext(sprite_index, image_index, x, y - 16, 1, 1, 0, c_white, 1);
}
