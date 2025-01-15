#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Hint Box Initialization

event_inherited();

hurtbox_set(21, 17, 19, 16, 0, 31);

draw_y = 0;
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animation

if (game_ispaused(mnu_pause))
{
    exit;
}

event_inherited();

if (text_get_clear())
{
    with (player_handle)
    {
        if (animation_previous != "look_end")
        {
            player_set_animation("look_end");
        }
    }
}

draw_y = hover(y, floor(game_get_time()) * 0.03, 2);
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Hint Box

draw_sprite_ext(sprite_index, instance_exists(player_handle) + 1, x, draw_y, image_xscale, 1, 0, c_white, 1);
event_inherited();
