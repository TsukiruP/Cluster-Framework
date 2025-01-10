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
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Reset

if (game_ispaused())
{
    exit;
}

player_handle = noone;
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

with (player_handle)
{
    if (text_get_clear() == true && animation_current == "look")
    {
        player_set_animation("look_end");
    }

    if (mgr_text.body_box_alpha == 0 && animation_current == "stand")
    {
        hint_allow = true;
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
